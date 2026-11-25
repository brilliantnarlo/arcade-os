module pong(
    input wire clk,
    input wire reset_n,

    input wire [10:0] x,
    input wire [9:0] y,

    input wire de_in,

    input wire button_up,
    input wire button_down,

    output wire [7:0] red,
    output wire [7:0] green,
    output wire [7:0] blue

);

    font_render #(
    .TEXT_X(25),
    .TEXT_Y(25),
    .TEXT_LEN(9),
    .TEXT("PONG MENU")
    ) pong_title(
        .x(x[9:0]),
        .y(y),
        .de(de_in),
        .red(red),
        .green(green),
        .blue(blue),
        .text_on()
    );


endmodule
