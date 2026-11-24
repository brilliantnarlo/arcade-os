// GUI Module

module graphic_render(
        input wire clk,
        input wire reset,

        input wire hsync_in,
        input wire vsync_in,
        input wire de_in,

        input  wire [10:0] x,
        input  wire [9:0]  y,

        output reg hsync_out,
        output reg vsync_out,
        output reg de_out,

        output reg [7:0] red,
        output reg [7:0] green,
        output reg [7:0] blue
);


    always @(posedge clk or negedge reset) begin
        if (!reset) begin
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

            if (de_in) begin   
                red   <= 8'd255;
                green <= 8'd255;
                blue  <= 8'd255;

            end            
            else begin                
                red   <= 8'd0;                
                green <= 8'd0;                
                blue  <= 8'd0;            
            end
        end


    end


endmodule