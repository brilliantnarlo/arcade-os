# Arcade OS Simulator

A native Windows preview of the Arcade OS Verilog. The simulator compiles the live RTL from `arcade/src`, feeds it keyboard input, and displays the 640×480 RGB output in a resizable window.

## Build and run

Use MSYS2 with the UCRT64 toolchain. In the MSYS2 UCRT64 shell, install the build dependencies if needed.

```bash
pacman -S --needed make perl mingw-w64-ucrt-x86_64-gcc mingw-w64-ucrt-x86_64-verilator
```

From the repository root in PowerShell, run the following. Adjust the MSYS2 path if you installed it elsewhere.

```powershell
& C:/msys64/usr/bin/bash.exe simulator/build.sh
.\simulator\build\arcade-sim.exe
```

You can also open the built `arcade-sim.exe` from Explorer. Run the build again after editing the Verilog to load your changes. If you add a separate RTL module used by the preview, include its source in `build.sh`.

| Key | Action |
| --- | --- |
| Up / Down | Navigate the menu |
| Enter | Open the selected game when supported |
| R | Reset to the menu |
| Esc | Close the window |

The current RTL opens the Pong title screen. Paddles, ball movement, and scoring will appear as those features are implemented in the game's Verilog.

## Verify without a window

```powershell
.\simulator\build\arcade-sim.exe --self-test
```

The check drives the same simulated GPIO as the window and inspects rendered pixels for menu navigation, Pong entry, and reset.

`sim_top.v` connects the original video timing and render modules. It registers pixel coordinates alongside the renderer's RGB and display-enable outputs. The preview supplies its own clock and excludes the board PLL, pin constraints, and DVI serializer.
