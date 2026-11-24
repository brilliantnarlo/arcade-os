module a1_bus(
    input wire button_up,
    input wire button_down,
    input wire button_left,
    input wire button_right,
    input wire button_center,
    output wire [4:0] led
);
    

    input_controller input_ctrl (
        .button_up(button_up),
        .button_down(button_down),
        .button_left(button_left),
        .button_right(button_right),
        .button_center(button_center),
        .led(led)
    );


endmodule