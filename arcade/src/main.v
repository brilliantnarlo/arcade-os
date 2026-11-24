module main(
    input wire board_clk,

    input wire button_up,
    input wire button_down,
    input wire button_left,
    input wire button_right,
    input wire button_center,
    output wire [4:0] led,

    output wire       tmds_clk_p,
    output wire       tmds_clk_n,
    output wire [2:0] tmds_data_p,
    output wire [2:0] tmds_data_n
);



    a1_bus bus(

        .board_clk(board_clk),

        .button_up(button_up),
        .button_down(button_down),
        .button_left(button_left),
        .button_right(button_right),
        .button_center(button_center),
        .led(led),

        .tmds_clk_p(tmds_clk_p),
        .tmds_clk_n(tmds_clk_n),
        .tmds_data_p(tmds_data_p),
        .tmds_data_n(tmds_data_n)
    );

endmodule