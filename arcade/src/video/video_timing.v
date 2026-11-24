module video_timing #(
    parameter H_ACTIVE = 640,
    parameter H_FRONT_PORCH = 16,
    parameter H_SYNC_PULSE = 96,
    parameter H_BACK_PORCH = 48,

    parameter V_ACTIVE = 480,
    parameter V_FRONT_PORCH = 10,
    parameter V_SYNC_PULSE = 2,
    parameter V_BACK_PORCH = 33,

    parameter H_TOTAL = H_ACTIVE + H_FRONT_PORCH + H_SYNC_PULSE + H_BACK_PORCH,
    parameter V_TOTAL = V_ACTIVE + V_FRONT_PORCH + V_SYNC_PULSE + V_BACK_PORCH,

    parameter H_START = H_SYNC_PULSE + H_BACK_PORCH,
    parameter H_END = H_START + H_ACTIVE,

    parameter V_START = V_SYNC_PULSE + V_BACK_PORCH,
    parameter V_END = V_START + V_ACTIVE
)(
    input wire clk,
    input wire reset,

    output reg hsync,
    output reg vsync,
    output reg de,

    output reg [9:0] x,
    output reg [9:0] y

);


    // Timing parameters for 640x480 @ 60Hz
    reg [9:0]h_counter;
    reg [9:0]v_counter;

    // Horizontal and vertical timing counters.
    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            h_counter <= 10'd0;
            v_counter <= 10'd0;
            x <= 10'd0;
            y <= 10'd0;
        end

        else if (h_counter == H_TOTAL - 1) begin
            h_counter <= 10'd0;

            if (v_counter == V_TOTAL - 1) begin
                v_counter <= 10'd0;
            end
            else begin
                v_counter <= v_counter + 10'd1;
            end

        end
        else begin
            h_counter <= h_counter + 10'd1;
        end
    end

    wire h_active = (h_counter >= H_START) && (h_counter <= H_END);
    wire v_active = (v_counter >= V_START) && (v_counter <= V_END);

    wire active = v_active && h_active;

    always @(posedge clk or negedge reset) begin
        if (!reset) begin
            hsync <= 1'b0;
            vsync <= 1'b0;
            x <= 10'd0;
            y <= 10'd0;
        end else begin
            hsync <= !(h_counter < H_SYNC_PULSE);
            vsync <= !(v_counter < V_SYNC_PULSE);
            de <= active;
            if (active) begin
                x <= h_counter - H_START;
                y <= v_counter - V_START;
            end else begin
                x <= 10'd0;
                y <= 10'd0;
            end
        end
    end




endmodule