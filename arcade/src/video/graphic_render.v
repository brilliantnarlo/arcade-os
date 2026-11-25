// GUI Module

module graphic_render(
        input wire clk,
        input wire reset_n,

        input wire hsync_in,
        input wire vsync_in,
        input wire de_in,

        input  wire [10:0] x,
        input  wire [9:0]  y,

        input  wire button_up,
        input  wire button_down,
        input  wire button_center,

        output reg hsync_out,
        output reg vsync_out,
        output reg de_out,

        output reg [7:0] red,
        output reg [7:0] green,
        output reg [7:0] blue
);

    localparam PONG = 1'b1;

    wire [3:0] selected_game;
    wire       mode;
    wire [23:0] menu_rgb;
    wire [23:0] pong_rgb;

    game_manager gm(
        .clk(clk),
        .reset_n(reset_n),
        .button_up(button_up),
        .button_down(button_down),
        // The Center switch input has a pull-up.
        .button_center(~button_center),
        .selected_game(selected_game),
        .mode(mode)
    );

    menu gui_menu(
        .x(x),
        .y(y),
        .de_in(de_in),
        .selected_game(selected_game),
        .red(menu_rgb[23:16]),
        .green(menu_rgb[15:8]),
        .blue(menu_rgb[7:0])
    );

    pong menu_game(
        .clk(clk),
        .reset_n(reset_n),

        .x(x),
        .y(y),

        .button_up(button_up),
        .button_down(button_down),

        .de_in(de_in),

        .red(pong_rgb[23:16]),
        .green(pong_rgb[15:8]),
        .blue(pong_rgb[7:0])
    );


    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            hsync_out <= 1'b0;            
            vsync_out <= 1'b0;            
            de_out    <= 1'b0;            

            red   <= 8'd0;            
            green <= 8'd0;            
            blue  <= 8'd0;
        end

        else begin

            hsync_out <= hsync_in;            
            vsync_out <= vsync_in;            
            de_out    <= de_in; 

            if (de_in)
                {red, green, blue} <= (mode == PONG) ? pong_rgb : menu_rgb;
            else
                {red, green, blue} <= 24'h000000;
        end


    end


endmodule
