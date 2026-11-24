module font_render(
    input wire [9:0] x,
    input wire [9:0] y,
    input wire de,

    output wire [7:0] red,
    output wire [7:0] green,
    output wire [7:0] blue,

    output wire       text_on
);

    parameter TEXT_X = 100;
    parameter TEXT_Y = 100;

    wire inside_text;

    assign inside_text =
        (x >= TEXT_X) && (x < TEXT_X + 8) &&
        (y >= TEXT_Y) && (y < TEXT_Y + 8);

    wire [2:0] font_row;
    wire [2:0] font_col;

    assign font_row = y - TEXT_Y;
    assign font_col = x - TEXT_X;

    wire [7:0] bitmap;

    font_rom font(
        .character(8'h41),
        .row(font_row),
        .bitmap(bitmap)
    );

    wire pixel_on;

    assign pixel_on = de && inside_text &&
                      bitmap[7 - font_col];

    assign text_on = pixel_on;

    // White text on a black background
    assign red   = pixel_on ? 8'hFF : 8'h00;
    assign green = pixel_on ? 8'hFF : 8'h00;
    assign blue  = pixel_on ? 8'hFF : 8'h00;

endmodule