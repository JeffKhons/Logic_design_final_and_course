module mux_dff(
    input r, 
    input L,
    input clk,
    input q,
    output reg Q = 1'b0
);
    always @(posedge clk)begin
        if(L)
            Q = r;
        else
            Q = q;
    end
endmodule

module hw2_1 (
    input [2:0] R, 
    input L,
    input clk,
    output reg [2:0] Qout = 3'b000
);
    wire Q0,Q1,Q2;
    mux_dff M1(
        .clk(clk),
        .r(R[1]),
        .q(Q2),
        .L(L),
        .Q(Q0)
    );
    mux_dff M2(
        .clk(clk),
        .r(R[0]),
        .q(Q0),
        .L(L),
        .Q(Q1)
    );
    mux_dff M3(
        .clk(clk),
        .r(R[2]),
        .q(Q1^Q2),
        .L(L),
        .Q(Q2)
    );
    always @(posedge clk)begin
        if(L)
            Qout = R;
        else
            Qout = {Q2,Q1,Q0};
    end
endmodule



