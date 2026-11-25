module sim_top(
    input wire clk,
    input wire reset_n,
    input wire button_up,
    input wire button_down,
    input wire button_center,
    output wire pixel_valid,
    output reg [9:0] pixel_x,
    output reg [9:0] pixel_y,
    output wire [23:0] rgb
);
    wire hsync;
    wire vsync;
    wire de;
    wire [9:0] x;
    wire [9:0] y;

    video_timing timing(
        .clk(clk),
        .reset(reset_n),
        .hsync(hsync),
        .vsync(vsync),
        .de(de),
        .x(x),
        .y(y)
    );

    graphic_render renderer(
        .clk(clk),
        .reset_n(reset_n),
        .hsync_in(hsync),
        .vsync_in(vsync),
        .de_in(de),
        .x({1'b0, x}),
        .y(y),
        .button_up(button_up),
        .button_down(button_down),
        .button_center(button_center),
        .hsync_out(),
        .vsync_out(),
        .de_out(pixel_valid),
        .red(rgb[23:16]),
        .green(rgb[15:8]),
        .blue(rgb[7:0])
    );

    // Match the renderer's one-cycle register stage.
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            pixel_x <= 10'd0;
            pixel_y <= 10'd0;
        end else begin
            pixel_x <= x;
            pixel_y <= y;
        end
    end
endmodule
