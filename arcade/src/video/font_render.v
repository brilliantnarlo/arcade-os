module font_render #(
    parameter integer TEXT_X   = 100,
    parameter integer TEXT_Y   = 100,
    parameter integer TEXT_LEN = 3,
    parameter [TEXT_LEN * 8 - 1:0] TEXT = "ABC"
)(
    input wire [9:0] x,
    input wire [9:0] y,
    input wire       de,

    output wire [7:0] red,
    output wire [7:0] green,
    output wire [7:0] blue,
    output wire       text_on
);

    localparam integer TEXT_WIDTH = TEXT_LEN * 8;

    wire inside_text;
    wire [9:0] local_x, local_y;
    wire [6:0] char_index;
    wire [2:0] font_row, font_col;
    wire [7:0] character, bitmap;

    assign inside_text =
        (x >= TEXT_X) && (x < TEXT_X + TEXT_WIDTH) &&
        (y >= TEXT_Y) && (y < TEXT_Y + 8);

    assign local_x = x - TEXT_X;
    assign local_y = y - TEXT_Y;

    // Each character is 8 pixels wide.
    assign char_index = local_x[9:3];
    assign font_col   = local_x[2:0];
    assign font_row   = local_y[2:0];

    // The first character is stored in the highest byte.
    assign character = inside_text
                     ? TEXT[(TEXT_LEN - 1 - char_index) * 8 +: 8]
                     : 8'h20;

    font_rom font(
        .character(character),
        .row(font_row),
        .bitmap(bitmap)
    );

    // Bit 7 is the leftmost pixel in each font row.
    assign text_on = de && inside_text && bitmap[7 - font_col];

    assign red   = text_on ? 8'hFF : 8'h00;
    assign green = text_on ? 8'hFF : 8'h00;
    assign blue  = text_on ? 8'hFF : 8'h00;

endmodule