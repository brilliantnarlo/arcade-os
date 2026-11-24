module menu(
    input wire [10:0] x,
    input wire [9:0]  y,

    output reg [7:0] red,
    output reg [7:0] green,
    output reg [7:0] blue
);


    always @(*) begin
        if (x < 640 && y < 480) begin
            red   = 8'd0;
            green = 8'd0;
            blue  = 8'd255;
        end
        else begin
            red   = 8'd0;
            green = 8'd0;
            blue  = 8'd0;
        end
    end


endmodule