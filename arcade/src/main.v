module main(
    input wire button_up,
    input wire button_down,
    input wire button_left,
    input wire button_right,
    input wire button_center,
    output wire up_pressed
);

    a1_bus bus(
        .button_up(button_up),
        .button_down(button_down),
        .button_left(button_left),
        .button_right(button_right),
        .button_center(button_center),
        .up_pressed(up_pressed)
    );

endmodule