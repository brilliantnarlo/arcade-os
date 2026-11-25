#define WIN32_LEAN_AND_MEAN
#include <windows.h>

#include "Vsim_top.h"

#include <algorithm>
#include <array>
#include <chrono>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <utility>
#include <vector>

namespace {
constexpr int Width = 640;
constexpr int Height = 480;
constexpr int FrameClocks = 800 * 525;
constexpr auto FramePeriod = std::chrono::nanoseconds(16'666'667);
constexpr std::uint32_t Yellow = 0x00ffff00;
constexpr std::uint32_t White = 0x00ffffff;

struct Buttons {
    bool up = false;
    bool down = false;
    bool center = false;
};

class Simulator {
public:
    Simulator() : pixels(Width * Height) { reset(); }
    ~Simulator() { rtl.final(); }

    void reset() {
        setButtons({});
        rtl.reset_n = 0;
        tick();
        rtl.reset_n = 1;
        std::fill(pixels.begin(), pixels.end(), 0);
    }

    int frame(Buttons buttons = {}) {
        setButtons(buttons);
        int captured = 0;
        for (int clock = 0; clock < FrameClocks; ++clock) {
            tick();
            if (rtl.pixel_valid && rtl.pixel_x < Width && rtl.pixel_y < Height) {
                pixels[rtl.pixel_y * Width + rtl.pixel_x] = rtl.rgb;
                ++captured;
            }
        }
        return captured;
    }

    bool hasColor(int firstRow, std::uint32_t color) const {
        const auto first = pixels.begin() + firstRow * Width;
        return std::find(first, first + 8 * Width, color) != first + 8 * Width;
    }

    std::vector<std::uint32_t> pixels;

private:
    void tick() {
        rtl.clk = 0;
        rtl.eval();
        context.timeInc(1);
        rtl.clk = 1;
        rtl.eval();
        context.timeInc(1);
    }

    void setButtons(Buttons buttons) {
        rtl.button_up = buttons.up;
        rtl.button_down = buttons.down;
        rtl.button_center = !buttons.center;
    }

    VerilatedContext context;
    Vsim_top rtl{&context};
};

int smokeTest() {
    Simulator sim;
    const bool completeFrame = sim.frame() == Width * Height;
    const bool bootsInMenu = sim.hasColor(50, Yellow) && sim.hasColor(270, White);

    sim.frame({false, true, false});
    sim.frame({false, true, false});
    const bool downMovedOnce = sim.hasColor(70, Yellow) && !sim.hasColor(50, Yellow);
    sim.frame();
    sim.frame({false, false, true});
    const bool otherGameStaysInMenu = sim.hasColor(70, Yellow) && sim.hasColor(270, White);
    sim.frame();
    sim.frame({true, false, false});
    sim.frame();
    const bool upReturnsToPong = sim.hasColor(50, Yellow);
    sim.frame({false, false, true});
    sim.frame({false, false, true});
    const bool centerOpensPong = sim.hasColor(25, White) &&
                                !sim.hasColor(50, Yellow) && !sim.hasColor(270, White);
    sim.reset();
    sim.frame();
    const bool resetReturnsToMenu = sim.hasColor(50, Yellow) && sim.hasColor(270, White);

    const std::array checks = {
        std::pair{completeFrame, "640 x 480 valid pixels captured"},
        std::pair{bootsInMenu, "Reset displays the menu with Pong selected"},
        std::pair{downMovedOnce, "Holding Down advances one item"},
        std::pair{otherGameStaysInMenu, "Center on Breakout stays in the menu"},
        std::pair{upReturnsToPong, "Up returns the selection to Pong"},
        std::pair{centerOpensPong, "Center on Pong displays the Pong screen"},
        std::pair{resetReturnsToMenu, "Reset returns from Pong to the menu"},
    };
    bool passed = true;
    for (const auto& [ok, description] : checks) {
        std::printf("%s  %s\n", ok ? "PASS" : "FAIL", description);
        passed &= ok;
    }
    return passed ? 0 : 1;
}

struct App {
    Simulator sim;
    Buttons held;
    Buttons tapped;
    bool resetRequested = false;

    void frame() {
        if (resetRequested) {
            sim.reset();
            resetRequested = false;
        }
        sim.frame({held.up || tapped.up, held.down || tapped.down,
                   held.center || tapped.center});
        tapped = {};
    }
};

void paint(HWND window, const Simulator& sim) {
    PAINTSTRUCT paintState{};
    HDC dc = BeginPaint(window, &paintState);
    RECT client{};
    GetClientRect(window, &client);
    FillRect(dc, &client, static_cast<HBRUSH>(GetStockObject(BLACK_BRUSH)));
    const int clientWidth = client.right;
    const int clientHeight = client.bottom;
    const int drawWidth = std::min(clientWidth, clientHeight * Width / Height);
    const int drawHeight = std::min(clientHeight, clientWidth * Height / Width);

    BITMAPINFO bitmap{};
    bitmap.bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
    bitmap.bmiHeader.biWidth = Width;
    bitmap.bmiHeader.biHeight = -Height;
    bitmap.bmiHeader.biPlanes = 1;
    bitmap.bmiHeader.biBitCount = 32;
    bitmap.bmiHeader.biCompression = BI_RGB;
    SetStretchBltMode(dc, COLORONCOLOR);
    StretchDIBits(dc, (clientWidth - drawWidth) / 2, (clientHeight - drawHeight) / 2,
                  drawWidth, drawHeight, 0, 0, Width, Height,
                  sim.pixels.data(), &bitmap, DIB_RGB_COLORS, SRCCOPY);
    EndPaint(window, &paintState);
}

LRESULT CALLBACK windowProc(HWND window, UINT message, WPARAM key, LPARAM detail) {
    if (message == WM_NCCREATE) {
        const auto* create = reinterpret_cast<const CREATESTRUCTW*>(detail);
        SetWindowLongPtrW(window, GWLP_USERDATA, reinterpret_cast<LONG_PTR>(create->lpCreateParams));
    }
    auto* app = reinterpret_cast<App*>(GetWindowLongPtrW(window, GWLP_USERDATA));
    if (!app)
        return DefWindowProcW(window, message, key, detail);

    switch (message) {
        case WM_PAINT:
            paint(window, app->sim);
            return 0;
        case WM_SIZE:
            InvalidateRect(window, nullptr, FALSE);
            return 0;
        case WM_KILLFOCUS:
            app->held = {};
            app->tapped = {};
            return 0;
        case WM_KEYDOWN:
        case WM_KEYUP: {
            const bool down = message == WM_KEYDOWN;
            const bool firstPress = down && !(detail & (1L << 30));
            switch (key) {
                case VK_UP:
                    app->held.up = down;
                    app->tapped.up |= firstPress;
                    return 0;
                case VK_DOWN:
                    app->held.down = down;
                    app->tapped.down |= firstPress;
                    return 0;
                case VK_RETURN:
                    app->held.center = down;
                    app->tapped.center |= firstPress;
                    return 0;
                case 'R':
                    app->resetRequested |= firstPress;
                    return 0;
                case VK_ESCAPE:
                    if (firstPress)
                        DestroyWindow(window);
                    return 0;
            }
            break;
        }
        case WM_DESTROY:
            PostQuitMessage(0);
            return 0;
    }
    return DefWindowProcW(window, message, key, detail);
}

int runWindow() {
    App app;
    const auto instance = GetModuleHandleW(nullptr);
    WNDCLASSW windowClass{};
    windowClass.lpfnWndProc = windowProc;
    windowClass.hInstance = instance;
    windowClass.hCursor = LoadCursorW(nullptr, MAKEINTRESOURCEW(32512));
    windowClass.lpszClassName = L"ArcadeOSSimulator";
    if (!RegisterClassW(&windowClass))
        return 1;

    RECT initial{0, 0, Width, Height};
    AdjustWindowRect(&initial, WS_OVERLAPPEDWINDOW, FALSE);
    HWND window = CreateWindowW(windowClass.lpszClassName,
                               L"Arcade OS Simulator | Up/Down: Select | Enter: Open | R: Reset",
                               WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT,
                               initial.right - initial.left, initial.bottom - initial.top,
                               nullptr, nullptr, instance, &app);
    if (!window)
        return 1;

    using Clock = std::chrono::steady_clock;
    app.frame();
    ShowWindow(window, SW_SHOW);
    auto nextFrame = Clock::now() + FramePeriod;
    while (true) {
        MSG message{};
        while (PeekMessageW(&message, nullptr, 0, 0, PM_REMOVE)) {
            if (message.message == WM_QUIT)
                return static_cast<int>(message.wParam);
            TranslateMessage(&message);
            DispatchMessageW(&message);
        }

        const auto now = Clock::now();
        if (now >= nextFrame) {
            app.frame();
            InvalidateRect(window, nullptr, FALSE);
            UpdateWindow(window);
            nextFrame = std::max(nextFrame + FramePeriod, Clock::now());
        } else {
            const auto wait = std::chrono::ceil<std::chrono::milliseconds>(nextFrame - now);
            MsgWaitForMultipleObjectsEx(0, nullptr, static_cast<DWORD>(wait.count()),
                                        QS_ALLINPUT, MWMO_INPUTAVAILABLE);
        }
    }
}
}  // namespace

int main(int argc, char** argv) {
    if (argc == 2 && std::strcmp(argv[1], "--self-test") == 0)
        return smokeTest();
    const int result = runWindow();
    if (result != 0)
        std::fprintf(stderr, "Could not open Arcade OS Simulator (error %lu).\n", GetLastError());
    return result;
}
