module a1_bus(
    input wire board_clk,

    input wire button_up,
    input wire button_down,
    input wire button_left,
    input wire button_right,
    input wire button_center,
    output wire [4:0] led,

    output wire       tmds_clk_p,
    output wire       tmds_clk_n,
    output wire [2:0] tmds_data_p,
    output wire [2:0] tmds_data_n
);

    wire serial_clk;
    wire pll_locked;
    wire pixel_clk;

    wire video_reset_n;

    wire        raw_hsync;
    wire        raw_vsync;
    wire        raw_de;
    wire [9:0] x;
    wire [9:0] y;

    wire [7:0]  red;
    wire [7:0]  green;
    wire [7:0]  blue;

    wire [7:0]  text_red;
    wire [7:0]  text_green;
    wire [7:0]  text_blue;

    wire gui_hsync;
    wire gui_vsync;
    wire gui_de;

    assign video_reset_n = pll_locked;


    Gowin_rPLL rpll(
        .clkout(serial_clk), //output clkout
        .lock(pll_locked), //output lock
        .clkin(board_clk) //input clkin
    );

    Gowin_CLKDIV clkdiv(
        .clkout(pixel_clk), //output clkout
        .hclkin(serial_clk), //input hclkin
        .resetn(pll_locked) //input resetn
    );


    input_controller input_ctrl (
        .button_up(button_up),
        .button_down(button_down),
        .button_left(button_left),
        .button_right(button_right),
        .button_center(button_center),
        .led(led)
    );


    video_timing vt(
        .clk(pixel_clk),
        .reset(video_reset_n),

        .hsync(raw_hsync),
        .vsync(raw_vsync),
        .de(raw_de),

        .x(x),
        .y(y)
    );

    graphic_render gr(
        .clk(pixel_clk),
        .reset(video_reset_n),
        .hsync_in(raw_hsync),
        .vsync_in(raw_vsync),
        .de_in(raw_de),

        .x(x),
        .y(y),
        
        .hsync_out(gui_hsync),
        .vsync_out(gui_vsync),
        .de_out(gui_de),

        .red(red),
        .green(green),
        .blue(blue)
    );


    DVI_TX_Top your_instance_name(
		.I_rst_n(video_reset_n), //input I_rst_n
		.I_serial_clk(serial_clk), //input I_serial_clk
		.I_rgb_clk(pixel_clk), //input I_rgb_clk

		.I_rgb_vs(raw_vsync), //input I_rgb_vs
		.I_rgb_hs(raw_hsync), //input I_rgb_hs
		.I_rgb_de(raw_de), //input I_rgb_de

		.I_rgb_r(red), //input [7:0] I_rgb_r
		.I_rgb_g(green), //input [7:0] I_rgb_g
		.I_rgb_b(blue), //input [7:0] I_rgb_b

		.O_tmds_clk_p(tmds_clk_p), //output O_tmds_clk_p
		.O_tmds_clk_n(tmds_clk_n), //output O_tmds_clk_n
		.O_tmds_data_p(tmds_data_p), //output [2:0] O_tmds_data_p
		.O_tmds_data_n(tmds_data_n) //output [2:0] O_tmds_data_n
	);





endmodule