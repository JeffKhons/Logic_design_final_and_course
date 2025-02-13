module topp (
    input  [3:0] btn,
    input [1:0] sw,
    input sysclk,
    output wire [13:0] ar,
    output wire [3:0] led,
    output wire led4_b,
    output wire led4_g,
    output wire led4_r
);   

    wire [2:0] btn_debounced;
    reg [3:0] btn_reg;

    debounce_cir deb1 (
        .clk_i(sysclk),
        .rst_i(btn_reg[3]),
        .in_i(btn[0]),
        .out_o(btn_debounced[0])
    );

    debounce_cir deb2 (
        .clk_i(sysclk),
        .rst_i(btn_reg[3]),
        .in_i(btn[1]),
        .out_o(btn_debounced[1])
    );
    
    debounce_cir deb3 (
        .clk_i(sysclk),
        .rst_i(btn_reg[3]),
        .in_i(btn[2]),
        .out_o(btn_debounced[2])
    );

    always @(posedge sysclk) begin
        btn_reg <= {btn[3], btn_debounced};
    end

    seg7 u_seg7_1 (
        .sw(sw),
        .num_i(btn_reg),
        .clk(sysclk),
        .led_light(led),
        .seg7_a(ar[6:0]),
        .seg7_b(ar[13:7]),
        .led_b(led4_b),
        .led_g(led4_g),
        .led_r(led4_r)
    );
endmodule