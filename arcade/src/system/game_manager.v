module game_manager(
    input  wire       clk,
    input  wire       reset_n,
    input  wire       button_up,
    input  wire       button_down,
    output reg  [3:0] selected_game
);

    // Accept a button change after 10 ms at 25.2 MHz.
    localparam [17:0] DEBOUNCE_LAST = 18'd251999;

    reg [1:0] buttons_meta;
    reg [1:0] buttons_sync;
    reg [1:0] buttons_stable;
    reg [17:0] debounce_count;

    wire [1:0] new_press;
    assign new_press = buttons_sync & ~buttons_stable;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            buttons_meta   <= 2'b00;
            buttons_sync   <= 2'b00;
            buttons_stable <= 2'b00;
            debounce_count <= 18'd0;
            selected_game  <= 4'd1;
        end else begin
            // Synchronize the physical buttons to the pixel clock.
            buttons_meta <= {button_up, button_down};
            buttons_sync <= buttons_meta;

            if (buttons_sync == buttons_stable) begin
                debounce_count <= 18'd0;
            end else if (debounce_count == DEBOUNCE_LAST) begin
                debounce_count <= 18'd0;
                buttons_stable <= buttons_sync;

                case (new_press)
                    2'b10: begin // Up
                        if (selected_game == 4'd1)
                            selected_game <= 4'd10;
                        else
                            selected_game <= selected_game - 4'd1;
                    end

                    2'b01: begin // Down
                        if (selected_game == 4'd10)
                            selected_game <= 4'd1;
                        else
                            selected_game <= selected_game + 4'd1;
                    end

                    default: begin
                        // Release or simultaneous press: keep the selection.
                    end
                endcase
            end else begin
                debounce_count <= debounce_count + 18'd1;
            end
        end
    end

endmodule