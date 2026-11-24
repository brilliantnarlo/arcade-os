module menu(
    input wire [10:0] x,
    input wire [9:0]  y,
    input wire        de_in,

    output reg [7:0] red,
    output reg [7:0] green,
    output reg [7:0] blue
);

    wire text_on;
    wire pong_on;
    wire breakout_on;
    wire snake_on;
    wire tic_tac_toe_on;
    wire racing_on;
    wire flappy_on;
    wire tetris_on;
    wire space_invaders_on;
    wire pacman_on;
    wire platformer_on;

    wire [7:0] text_red, text_green, text_blue;

    font_render #(
    .TEXT_X(25),
    .TEXT_Y(25),
    .TEXT_LEN(12),
    .TEXT("ARCADE GAMES")
    ) text(
        .x(x[9:0]),
        .y(y),
        .de(de_in),
        .red(),
        .green(),
        .blue(),
        .text_on(text_on)
    );

    font_render #(
    .TEXT_X(25),
    .TEXT_Y(50),
    .TEXT_LEN(7),
    .TEXT("01 PONG")
    ) pong(
        .x(x[9:0]),
        .y(y),
        .de(de_in),
        .red(),
        .green(),
        .blue(),
        .text_on(pong_on)
    );

    font_render #(
    .TEXT_X(25),
    .TEXT_Y(70),
    .TEXT_LEN(11),
    .TEXT("02 BREAKOUT")
    ) breakout(
        .x(x[9:0]),
        .y(y),
        .de(de_in),
        .red(),
        .green(),
        .blue(),
        .text_on(breakout_on)
    );

    font_render #(
    .TEXT_X(25),
    .TEXT_Y(90),
    .TEXT_LEN(5),
    .TEXT("03 SNAKE")
    ) snake(
        .x(x[9:0]),
        .y(y),
        .de(de_in),
        .red(),
        .green(),
        .blue(),
        .text_on(snake_on)
    );

    font_render #(
    .TEXT_X(25),
    .TEXT_Y(110),
    .TEXT_LEN(12),
    .TEXT("04 TIC TAC TOE")
    ) tic_tac_toe(
        .x(x[9:0]),
        .y(y),
        .de(de_in),
        .red(),
        .green(),
        .blue(),
        .text_on(tic_tac_toe_on)
    );

    font_render #(
    .TEXT_X(25),
    .TEXT_Y(130),
    .TEXT_LEN(7),
    .TEXT("05 RACING")
    ) racing(
        .x(x[9:0]),
        .y(y),
        .de(de_in),
        .red(),
        .green(),
        .blue(),
        .text_on(racing_on)
    );

    always @(*) begin
        {red, green, blue} = 24'h000000;

        if (de_in && x < 11'd640 && y < 10'd480) begin
            if (text_on || pong_on || breakout_on || snake_on || tic_tac_toe_on || racing_on || flappy_on || tetris_on || space_invaders_on || pacman_on || platformer_on)
                {red, green, blue} = 24'hFFFFFF;
            else
                {red, green, blue} = 24'h000000;
        end
    end

endmodule