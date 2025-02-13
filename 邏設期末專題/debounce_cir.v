module debounce_cir (
    input  clk_i,
    input  rst_i,
    input  in_i,  // bouncing button input
    output reg out_o  // 1 cycle pulse for every button press
);

    reg [1:0] state;

    always @(posedge clk_i or posedge rst_i) begin
        if (rst_i)
            state <= 2'b00;
        else begin
            case (state)
                2'b00: if (in_i) state <= 2'b01;
                2'b01: if (in_i) state <= 2'b11; else state <= 2'b00;
                2'b11: if (!in_i) state <= 2'b00;
            endcase
        end
    end

    always @(posedge clk_i) begin
        if (rst_i)
            out_o <= 1'b0;
        else begin
            if (state == 2'b01)
                out_o <= 1'b1;
            else
                out_o <= 1'b0;
        end
    end

endmodule
