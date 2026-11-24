module input_controller(
    input wire button_up,
    input wire button_down,
    input wire button_left,
    input wire button_right,
    input wire button_center,
    output reg [4:0] led
);



    always @(*) begin
        // Implement your input controller logic here
        // For example, you can assign the button states to output signals
        led[0] = button_up;
        led[1] = button_down;
        led[2] = button_left;
        led[3] = button_right;
        led[4] = button_center;

    end



endmodule