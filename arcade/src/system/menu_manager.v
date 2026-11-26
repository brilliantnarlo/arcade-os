module menu_manager(
    input  wire       clk,
    input  wire       reset_n,
    input  wire       button_up,
    input  wire       button_down,
    input  wire       button_center,
    output reg  [3:0] selected_game,
    output reg        mode
);

    localparam MENU = 1'b0;
    localparam PONG = 1'b1;

    // Accept a button change after 10 ms at 25.2 MHz.
    localparam [17:0] DEBOUNCE_LAST = 18'd251999;

    reg [2:0] buttons_meta;
    reg [2:0] buttons_sync;
    reg [2:0] buttons_stable;
    reg [17:0] debounce_count;

    wire [2:0] new_press;
    assign new_press = buttons_sync & ~buttons_stable;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            buttons_meta   <= 3'b000;
            buttons_sync   <= 3'b000;
            buttons_stable <= 3'b000;
            debounce_count <= 18'd0;
            selected_game  <= 4'd1;
            mode           <= MENU;
        end else begin
            // Synchronize the physical buttons to the pixel clock.
            buttons_meta <= {button_up, button_down, button_center};
            buttons_sync <= buttons_meta;

            if (buttons_sync == buttons_stable) begin
                debounce_count <= 18'd0;
            end else if (debounce_count == DEBOUNCE_LAST) begin
                debounce_count <= 18'd0;
                buttons_stable <= buttons_sync;

                if (mode == MENU) begin
                    case (new_press)
                        3'b100: begin // Up
                            if (selected_game == 4'd1)
                                selected_game <= 4'd10;
                            else
                                selected_game <= selected_game - 4'd1;
                        end

                        3'b010: begin // Down
                            if (selected_game == 4'd10)
                                selected_game <= 4'd1;
                            else
                                selected_game <= selected_game + 4'd1;
                        end

                        3'b001: begin // Center
                            if (selected_game == 4'd1)
                                mode <= PONG;
                        end

                        default: begin
                            // Release or simultaneous press: keep the selection.
                        end
                    endcase
                end
            end else begin
                debounce_count <= debounce_count + 18'd1;
            end
        end
    end

endmodule
