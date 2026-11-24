module menu(
    input wire [10:0] x,
    input wire [9:0]  y,
    input wire        de_in,

    output reg [7:0] red,
    output reg [7:0] green,
    output reg [7:0] blue
);

    wire text_on;
    wire [7:0] text_red, text_green, text_blue;

    font_render text(
        .x(x[9:0]),
        .y(y),
        .de(de_in),
        .red(text_red),
        .green(text_green),
        .blue(text_blue),
        .text_on(text_on)
    );

    always @(*) begin
        {red, green, blue} = 24'h000000;

        if (de_in && x < 11'd640 && y < 10'd480) begin
            if (text_on)
                {red, green, blue} = {text_red, text_green, text_blue};
            else
                {red, green, blue} = 24'h0000FF;
        end
    end

endmodule