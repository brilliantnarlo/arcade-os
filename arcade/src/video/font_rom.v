module font_rom(
    input wire [7:0] character,
    input wire [2:0] row,

    output reg [7:0] bitmap
);


    always @(*) begin
        case (character)

            8'h20: bitmap = 8'b00000000; // space
            // 1
            
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

            8'h42: begin // B
                case (row)
                    3'b000: bitmap = 8'b01111100;
                    3'b001: bitmap = 8'b01000010;
                    3'b010: bitmap = 8'b01000010;
                    3'b011: bitmap = 8'b01111100;
                    3'b100: bitmap = 8'b01000010;
                    3'b101: bitmap = 8'b01000010;
                    3'b110: bitmap = 8'b01111100;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h43: begin // C
                case (row)
                    3'b000: bitmap = 8'b00111100;
                    3'b001: bitmap = 8'b01000010;
                    3'b010: bitmap = 8'b01000000;
                    3'b011: bitmap = 8'b01000000;
                    3'b100: bitmap = 8'b01000000;
                    3'b101: bitmap = 8'b01000010;
                    3'b110: bitmap = 8'b00111100;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h44: begin // D
                case (row)
                    3'b000: bitmap = 8'b01111000;
                    3'b001: bitmap = 8'b01000100;
                    3'b010: bitmap = 8'b01000010;
                    3'b011: bitmap = 8'b01000010;
                    3'b100: bitmap = 8'b01000010;
                    3'b101: bitmap = 8'b01000100;
                    3'b110: bitmap = 8'b01111000;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h45: begin // E
                case (row)
                    3'b000: bitmap = 8'b01111110;
                    3'b001: bitmap = 8'b01000000;
                    3'b010: bitmap = 8'b01000000;
                    3'b011: bitmap = 8'b01111100;
                    3'b100: bitmap = 8'b01000000;
                    3'b101: bitmap = 8'b01000000;
                    3'b110: bitmap = 8'b01111110;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h46: begin // F
                case (row)
                    3'b000: bitmap = 8'b01111110;
                    3'b001: bitmap = 8'b01000000;
                    3'b010: bitmap = 8'b01000000;
                    3'b011: bitmap = 8'b01111100;
                    3'b100: bitmap = 8'b01000000;
                    3'b101: bitmap = 8'b01000000;
                    3'b110: bitmap = 8'b01000000;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h47: begin // G
                case (row)
                    3'b000: bitmap = 8'b00111100;
                    3'b001: bitmap = 8'b01000010;
                    3'b010: bitmap = 8'b01000000;
                    3'b011: bitmap = 8'b01001110;
                    3'b100: bitmap = 8'b01000010;
                    3'b101: bitmap = 8'b01000010;
                    3'b110: bitmap = 8'b00111100;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h48: begin // H
                case (row)
                    3'b000: bitmap = 8'b01000010;
                    3'b001: bitmap = 8'b01000010;
                    3'b010: bitmap = 8'b01000010;
                    3'b011: bitmap = 8'b01111110;
                    3'b100: bitmap = 8'b01000010;
                    3'b101: bitmap = 8'b01000010;
                    3'b110: bitmap = 8'b01000010;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h49: begin // I
                case (row)
                    3'b000: bitmap = 8'b00111100;
                    3'b001: bitmap = 8'b00010000;
                    3'b010: bitmap = 8'b00010000;
                    3'b011: bitmap = 8'b00010000;
                    3'b100: bitmap = 8'b00010000;
                    3'b101: bitmap = 8'b00010000;
                    3'b110: bitmap = 8'b00111100;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h4A: begin // J
                case (row)
                    3'b000: bitmap = 8'b00011110;
                    3'b001: bitmap = 8'b00000100;
                    3'b010: bitmap = 8'b00000100;
                    3'b011: bitmap = 8'b00000100;
                    3'b100: bitmap = 8'b01000100;
                    3'b101: bitmap = 8'b01000100;
                    3'b110: bitmap = 8'b00111000;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h4B: begin // K
                case (row)
                    3'b000: bitmap = 8'b01000010;
                    3'b001: bitmap = 8'b01000100;
                    3'b010: bitmap = 8'b01001000;
                    3'b011: bitmap = 8'b01110000;
                    3'b100: bitmap = 8'b01001000;
                    3'b101: bitmap = 8'b01000100;
                    3'b110: bitmap = 8'b01000010;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h4C: begin // L
                case (row)
                    3'b000: bitmap = 8'b01000000;
                    3'b001: bitmap = 8'b01000000;
                    3'b010: bitmap = 8'b01000000;
                    3'b011: bitmap = 8'b01000000;
                    3'b100: bitmap = 8'b01000000;
                    3'b101: bitmap = 8'b01000000;
                    3'b110: bitmap = 8'b01111110;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h4D: begin // M
                case (row)
                    3'b000: bitmap = 8'b01000010;
                    3'b001: bitmap = 8'b01100110;
                    3'b010: bitmap = 8'b01011010;
                    3'b011: bitmap = 8'b01000010;
                    3'b100: bitmap = 8'b01000010;
                    3'b101: bitmap = 8'b01000010;
                    3'b110: bitmap = 8'b01000010;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h4E: begin // N
                case (row)
                    3'b000: bitmap = 8'b01000010;
                    3'b001: bitmap = 8'b01100010;
                    3'b010: bitmap = 8'b01010010;
                    3'b011: bitmap = 8'b01001010;
                    3'b100: bitmap = 8'b01000110;
                    3'b101: bitmap = 8'b01000010;
                    3'b110: bitmap = 8'b01000010;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h4F: begin // O
                case (row)
                    3'b000: bitmap = 8'b00111100;
                    3'b001: bitmap = 8'b01000010;
                    3'b010: bitmap = 8'b01000010;
                    3'b011: bitmap = 8'b01000010;
                    3'b100: bitmap = 8'b01000010;
                    3'b101: bitmap = 8'b01000010;
                    3'b110: bitmap = 8'b00111100;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h50: begin // P
                case (row)
                    3'b000: bitmap = 8'b01111100;
                    3'b001: bitmap = 8'b01000010;
                    3'b010: bitmap = 8'b01000010;
                    3'b011: bitmap = 8'b01111100;
                    3'b100: bitmap = 8'b01000000;
                    3'b101: bitmap = 8'b01000000;
                    3'b110: bitmap = 8'b01000000;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h51: begin // Q
                case (row)
                    3'b000: bitmap = 8'b00111100;
                    3'b001: bitmap = 8'b01000010;
                    3'b010: bitmap = 8'b01000010;
                    3'b011: bitmap = 8'b01000010;
                    3'b100: bitmap = 8'b01001010;
                    3'b101: bitmap = 8'b01000100;
                    3'b110: bitmap = 8'b00111010;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h52: begin // R
                case (row)
                    3'b000: bitmap = 8'b01111100;
                    3'b001: bitmap = 8'b01000010;
                    3'b010: bitmap = 8'b01000010;
                    3'b011: bitmap = 8'b01111100;
                    3'b100: bitmap = 8'b01001000;
                    3'b101: bitmap = 8'b01000100;
                    3'b110: bitmap = 8'b01000010;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h53: begin // S
                case (row)
                    3'b000: bitmap = 8'b00111100;
                    3'b001: bitmap = 8'b01000010;
                    3'b010: bitmap = 8'b01000000;
                    3'b011: bitmap = 8'b00111100;
                    3'b100: bitmap = 8'b00000010;
                    3'b101: bitmap = 8'b01000010;
                    3'b110: bitmap = 8'b00111100;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h54: begin // T
                case (row)
                    3'b000: bitmap = 8'b01111110;
                    3'b001: bitmap = 8'b00010000;
                    3'b010: bitmap = 8'b00010000;
                    3'b011: bitmap = 8'b00010000;
                    3'b100: bitmap = 8'b00010000;
                    3'b101: bitmap = 8'b00010000;
                    3'b110: bitmap = 8'b00010000;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h55: begin // U
                case (row)
                    3'b000: bitmap = 8'b01000010;
                    3'b001: bitmap = 8'b01000010;
                    3'b010: bitmap = 8'b01000010;
                    3'b011: bitmap = 8'b01000010;
                    3'b100: bitmap = 8'b01000010;
                    3'b101: bitmap = 8'b01000010;
                    3'b110: bitmap = 8'b00111100;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h56: begin // V
                case (row)
                    3'b000: bitmap = 8'b01000010;
                    3'b001: bitmap = 8'b01000010;
                    3'b010: bitmap = 8'b01000010;
                    3'b011: bitmap = 8'b01000010;
                    3'b100: bitmap = 8'b00100100;
                    3'b101: bitmap = 8'b00100100;
                    3'b110: bitmap = 8'b00011000;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h57: begin // W
                case (row)
                    3'b000: bitmap = 8'b01000010;
                    3'b001: bitmap = 8'b01000010;
                    3'b010: bitmap = 8'b01000010;
                    3'b011: bitmap = 8'b01011010;
                    3'b100: bitmap = 8'b01011010;
                    3'b101: bitmap = 8'b01100110;
                    3'b110: bitmap = 8'b01000010;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h58: begin // X
                case (row)
                    3'b000: bitmap = 8'b01000010;
                    3'b001: bitmap = 8'b00100100;
                    3'b010: bitmap = 8'b00011000;
                    3'b011: bitmap = 8'b00011000;
                    3'b100: bitmap = 8'b00100100;
                    3'b101: bitmap = 8'b01000010;
                    3'b110: bitmap = 8'b01000010;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h59: begin // Y
                case (row)
                    3'b000: bitmap = 8'b01000010;
                    3'b001: bitmap = 8'b00100100;
                    3'b010: bitmap = 8'b00011000;
                    3'b011: bitmap = 8'b00010000;
                    3'b100: bitmap = 8'b00010000;
                    3'b101: bitmap = 8'b00010000;
                    3'b110: bitmap = 8'b00010000;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h5A: begin // Z
                case (row)
                    3'b000: bitmap = 8'b01111110;
                    3'b001: bitmap = 8'b00000010;
                    3'b010: bitmap = 8'b00000100;
                    3'b011: bitmap = 8'b00001000;
                    3'b100: bitmap = 8'b00010000;
                    3'b101: bitmap = 8'b00100000;
                    3'b110: bitmap = 8'b01111110;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h30: begin // 0
                case (row)
                    3'b000: bitmap = 8'b00111100;
                    3'b001: bitmap = 8'b01000010;
                    3'b010: bitmap = 8'b01000110;
                    3'b011: bitmap = 8'b01001010;
                    3'b100: bitmap = 8'b01010010;
                    3'b101: bitmap = 8'b01100010;
                    3'b110: bitmap = 8'b00111100;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h31: begin // 1
                case (row)
                    3'b000: bitmap = 8'b00010000;
                    3'b001: bitmap = 8'b00110000;
                    3'b010: bitmap = 8'b00010000;
                    3'b011: bitmap = 8'b00010000;
                    3'b100: bitmap = 8'b00010000;
                    3'b101: bitmap = 8'b00010000;
                    3'b110: bitmap = 8'b00111000;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h32: begin // 2
                case (row)
                    3'b000: bitmap = 8'b00111100;
                    3'b001: bitmap = 8'b01000010;
                    3'b010: bitmap = 8'b00000010;
                    3'b011: bitmap = 8'b00001100;
                    3'b100: bitmap = 8'b00110000;
                    3'b101: bitmap = 8'b01000000;
                    3'b110: bitmap = 8'b01111110;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h33: begin // 3
                case (row)
                    3'b000: bitmap = 8'b00111100;
                    3'b001: bitmap = 8'b01000010;
                    3'b010: bitmap = 8'b00000010;
                    3'b011: bitmap = 8'b00011100;
                    3'b100: bitmap = 8'b00000010;
                    3'b101: bitmap = 8'b01000010;
                    3'b110: bitmap = 8'b00111100;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h34: begin // 4
                case (row)
                    3'b000: bitmap = 8'b00000100;
                    3'b001: bitmap = 8'b00001100;
                    3'b010: bitmap = 8'b00010100;
                    3'b011: bitmap = 8'b00100100;
                    3'b100: bitmap = 8'b01111110;
                    3'b101: bitmap = 8'b00000100;
                    3'b110: bitmap = 8'b00000100;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h35: begin // 5
                case (row)
                    3'b000: bitmap = 8'b01111110;
                    3'b001: bitmap = 8'b01000000;
                    3'b010: bitmap = 8'b01111100;
                    3'b011: bitmap = 8'b00000010;
                    3'b100: bitmap = 8'b00000010;
                    3'b101: bitmap = 8'b01000010;
                    3'b110: bitmap = 8'b00111100;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h36: begin // 6
                case (row)
                    3'b000: bitmap = 8'b00111100;
                    3'b001: bitmap = 8'b01000000;
                    3'b010: bitmap = 8'b01111100;
                    3'b011: bitmap = 8'b01000010;
                    3'b100: bitmap = 8'b01000010;
                    3'b101: bitmap = 8'b01000010;
                    3'b110: bitmap = 8'b00111100;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h37: begin // 7
                case (row)
                    3'b000: bitmap = 8'b01111110;
                    3'b001: bitmap = 8'b00000010;
                    3'b010: bitmap = 8'b00000100;
                    3'b011: bitmap = 8'b00001000;
                    3'b100: bitmap = 8'b00010000;
                    3'b101: bitmap = 8'b00100000;
                    3'b110: bitmap = 8'b00100000;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h38: begin // 8
                case (row)
                    3'b000: bitmap = 8'b00111100;
                    3'b001: bitmap = 8'b01000010;
                    3'b010: bitmap = 8'b01000010;
                    3'b011: bitmap = 8'b00111100;
                    3'b100: bitmap = 8'b01000010;
                    3'b101: bitmap = 8'b01000010;
                    3'b110: bitmap = 8'b00111100;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end


            8'h39: begin // 9
                case (row)
                    3'b000: bitmap = 8'b00111100;
                    3'b001: bitmap = 8'b01000010;
                    3'b010: bitmap = 8'b01000010;
                    3'b011: bitmap = 8'b00111110;
                    3'b100: bitmap = 8'b00000010;
                    3'b101: bitmap = 8'b00000010;
                    3'b110: bitmap = 8'b00111100;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h2E: begin // .
                case (row)
                    3'b000: bitmap = 8'b00000000;
                    3'b001: bitmap = 8'b00000000;
                    3'b010: bitmap = 8'b00000000;
                    3'b011: bitmap = 8'b00000000;
                    3'b100: bitmap = 8'b00000000;
                    3'b101: bitmap = 8'b00011000;
                    3'b110: bitmap = 8'b00011000;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h2D: begin // -
                case (row)
                    3'b000: bitmap = 8'b00000000;
                    3'b001: bitmap = 8'b00000000;
                    3'b010: bitmap = 8'b00000000;
                    3'b011: bitmap = 8'b01111110;
                    3'b100: bitmap = 8'b00000000;
                    3'b101: bitmap = 8'b00000000;
                    3'b110: bitmap = 8'b00000000;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h5F: begin // _
                case (row)
                    3'b000: bitmap = 8'b00000000;
                    3'b001: bitmap = 8'b00000000;
                    3'b010: bitmap = 8'b00000000;
                    3'b011: bitmap = 8'b00000000;
                    3'b100: bitmap = 8'b00000000;
                    3'b101: bitmap = 8'b00000000;
                    3'b110: bitmap = 8'b01111110;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h3A: begin // :
                case (row)
                    3'b000: bitmap = 8'b00000000;
                    3'b001: bitmap = 8'b00000000;
                    3'b010: bitmap = 8'b00011000;
                    3'b011: bitmap = 8'b00011000;
                    3'b100: bitmap = 8'b00000000;
                    3'b101: bitmap = 8'b00011000;
                    3'b110: bitmap = 8'b00011000;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h2F: begin // /
                case (row)
                    3'b000: bitmap = 8'b00000010;
                    3'b001: bitmap = 8'b00000100;
                    3'b010: bitmap = 8'b00001000;
                    3'b011: bitmap = 8'b00010000;
                    3'b100: bitmap = 8'b00100000;
                    3'b101: bitmap = 8'b01000000;
                    3'b110: bitmap = 8'b10000000;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h5C: begin // \
                case (row)
                    3'b000: bitmap = 8'b10000000;
                    3'b001: bitmap = 8'b01000000;
                    3'b010: bitmap = 8'b00100000;
                    3'b011: bitmap = 8'b00010000;
                    3'b100: bitmap = 8'b00001000;
                    3'b101: bitmap = 8'b00000100;
                    3'b110: bitmap = 8'b00000010;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h21: begin // !
                case (row)
                    3'b000: bitmap = 8'b00010000;
                    3'b001: bitmap = 8'b00010000;
                    3'b010: bitmap = 8'b00010000;
                    3'b011: bitmap = 8'b00010000;
                    3'b100: bitmap = 8'b00010000;
                    3'b101: bitmap = 8'b00000000;
                    3'b110: bitmap = 8'b00010000;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h3F: begin // ?
                case (row)
                    3'b000: bitmap = 8'b00111100;
                    3'b001: bitmap = 8'b01000010;
                    3'b010: bitmap = 8'b00000010;
                    3'b011: bitmap = 8'b00001100;
                    3'b100: bitmap = 8'b00010000;
                    3'b101: bitmap = 8'b00000000;
                    3'b110: bitmap = 8'b00010000;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h40: begin // @
                case (row)
                    3'b000: bitmap = 8'b00111100;
                    3'b001: bitmap = 8'b01000010;
                    3'b010: bitmap = 8'b01011010;
                    3'b011: bitmap = 8'b01010110;
                    3'b100: bitmap = 8'b01011110;
                    3'b101: bitmap = 8'b01000000;
                    3'b110: bitmap = 8'b00111100;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h23: begin // #
                case (row)
                    3'b000: bitmap = 8'b00010100;
                    3'b001: bitmap = 8'b00010100;
                    3'b010: bitmap = 8'b01111110;
                    3'b011: bitmap = 8'b00010100;
                    3'b100: bitmap = 8'b01111110;
                    3'b101: bitmap = 8'b00010100;
                    3'b110: bitmap = 8'b00010100;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h24: begin // $
                case (row)
                    3'b000: bitmap = 8'b00011100;
                    3'b001: bitmap = 8'b00101010;
                    3'b010: bitmap = 8'b00101000;
                    3'b011: bitmap = 8'b00011100;
                    3'b100: bitmap = 8'b00001010;
                    3'b101: bitmap = 8'b00101010;
                    3'b110: bitmap = 8'b00011100;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h25: begin // %
                case (row)
                    3'b000: bitmap = 8'b01100010;
                    3'b001: bitmap = 8'b01100100;
                    3'b010: bitmap = 8'b00001000;
                    3'b011: bitmap = 8'b00010000;
                    3'b100: bitmap = 8'b00100011;
                    3'b101: bitmap = 8'b01000110;
                    3'b110: bitmap = 8'b00000000;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h26: begin // &
                case (row)
                    3'b000: bitmap = 8'b00110000;
                    3'b001: bitmap = 8'b01001000;
                    3'b010: bitmap = 8'b00110000;
                    3'b011: bitmap = 8'b01010100;
                    3'b100: bitmap = 8'b00101010;
                    3'b101: bitmap = 8'b01000110;
                    3'b110: bitmap = 8'b00111101;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h27: begin // '
                case (row)
                    3'b000: bitmap = 8'b00010000;
                    3'b001: bitmap = 8'b00010000;
                    3'b010: bitmap = 8'b00010000;
                    3'b011: bitmap = 8'b00000000;
                    3'b100: bitmap = 8'b00000000;
                    3'b101: bitmap = 8'b00000000;
                    3'b110: bitmap = 8'b00000000;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h28: begin // (
                case (row)
                    3'b000: bitmap = 8'b00001000;
                    3'b001: bitmap = 8'b00010000;
                    3'b010: bitmap = 8'b00100000;
                    3'b011: bitmap = 8'b00100000;
                    3'b100: bitmap = 8'b00100000;
                    3'b101: bitmap = 8'b00010000;
                    3'b110: bitmap = 8'b00001000;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

            8'h29: begin // )
                case (row)
                    3'b000: bitmap = 8'b00100000;
                    3'b001: bitmap = 8'b00010000;
                    3'b010: bitmap = 8'b00001000;
                    3'b011: bitmap = 8'b00001000;
                    3'b100: bitmap = 8'b00001000;
                    3'b101: bitmap = 8'b00010000;
                    3'b110: bitmap = 8'b00100000;
                    3'b111: bitmap = 8'b00000000;
                endcase
            end

        endcase
    end

endmodule