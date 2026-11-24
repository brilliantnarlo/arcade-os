module font_rom(
    input wire [7:0] character,
    input wire [2:0] row,

    output reg [7:0] bitmap
);


    always @(*) begin
        case (character)
            
            8'h41: begin // A
                case (row)
                    3'b000: bitmap = 8'b00011000;
                    3'b001: bitmap = 8'b00100100;
                    3'b010: bitmap = 8'b01000010;
                    3'b011: bitmap = 8'b01111110;
                    3'b100: bitmap = 8'b01000010;
                    3'b101: bitmap = 8'b01000010;
                    3'b110: bitmap = 8'b01000010;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end
        endcase
    end

endmodule