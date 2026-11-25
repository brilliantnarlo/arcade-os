module menu(
    input wire clk,
    input wire reset_n,

    input wire [10:0] x,
    input wire [9:0]  y,

    input wire button_up,
    input wire button_down,
    
    input wire de_in,

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

    wire instruction_on;

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
    .TEXT_LEN(8),
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
    .TEXT_LEN(14),
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
    .TEXT_LEN(9),
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

    font_render #(
    .TEXT_X(25),
    .TEXT_Y(150),
    .TEXT_LEN(9),
    .TEXT("06 FLAPPY")
    ) flappy(
        .x(x[9:0]),
        .y(y),
        .de(de_in),
        .red(),
        .green(),
        .blue(),
        .text_on(flappy_on)
    );

    font_render #(
    .TEXT_X(25),
    .TEXT_Y(170),
    .TEXT_LEN(9),
    .TEXT("07 TETRIS")
    ) tetris(
        .x(x[9:0]),
        .y(y),
        .de(de_in),
        .red(),
        .green(),
        .blue(),
        .text_on(tetris_on)
    );

    font_render #(
    .TEXT_X(25),
    .TEXT_Y(190),
    .TEXT_LEN(17),
    .TEXT("08 SPACE INVADERS")
    ) space_invaders(
        .x(x[9:0]),
        .y(y),
        .de(de_in),
        .red(),
        .green(),
        .blue(),
        .text_on(space_invaders_on)
    );

    font_render #(
    .TEXT_X(25),
    .TEXT_Y(210),
    .TEXT_LEN(10),
    .TEXT("09 PAC-MAN")
    ) pacman(
        .x(x[9:0]),
        .y(y),
        .de(de_in),
        .red(),
        .green(),
        .blue(),
        .text_on(pacman_on)
    );

    font_render #(
    .TEXT_X(25),
    .TEXT_Y(230),
    .TEXT_LEN(13),
    .TEXT("10 PLATFORMER")
    ) platformer(
        .x(x[9:0]),
        .y(y),
        .de(de_in),
        .red(),
        .green(),
        .blue(),
        .text_on(platformer_on)
    );

    font_render #(
    .TEXT_X(25),
    .TEXT_Y(270),
    .TEXT_LEN(37),
    .TEXT("SELECT A GAME: UP/DOWN   PLAY: CENTER")
    ) instruction(
        .x(x[9:0]),
        .y(y),
        .de(de_in),
        .red(),
        .green(),
        .blue(),
        .text_on(instruction_on)
    );

    
    wire [3:0] selected_game;

    game_manager gm(
        .clk(clk),
        .reset_n(reset_n),
        .button_up(button_up),
        .button_down(button_down),
        .selected_game(selected_game)
    );

    always @(*) begin
        {red, green, blue} = 24'h000000;

        if (de_in && x < 11'd640 && y < 10'd480) begin
            if ( (pong_on     && selected_game == 4'd1) || 
                 (breakout_on && selected_game == 4'd2) || 
                 (snake_on && selected_game == 4'd3) || 
                 (tic_tac_toe_on && selected_game == 4'd4) || 
                 (racing_on && selected_game == 4'd5) || 
                 (flappy_on && selected_game == 4'd6) || 
                 (tetris_on && selected_game == 4'd7) || 
                 (space_invaders_on && selected_game == 4'd8) || 
                 (pacman_on && selected_game == 4'd9) || 
                 (platformer_on && selected_game == 4'd10))
                {red, green, blue} = 24'hFFFF00;

            else if (text_on || pong_on || breakout_on || snake_on || tic_tac_toe_on || racing_on || flappy_on || tetris_on || space_invaders_on || pacman_on || platformer_on || instruction_on)
                {red, green, blue} = 24'hFFFFFF;
            else
                {red, green, blue} = 24'h000000;
        end
    end

endmodule
