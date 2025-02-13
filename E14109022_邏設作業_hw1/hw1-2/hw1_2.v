`timescale 1ns / 1ps

module one_bit_adder( // by one bit adder
    input A,
    input B,
    input C_in,
    output S,
    output C_out
    );
    wire w1,w2,w3;
    xor gate1(S,A,B,C_in); 
    or gate2(w1,B,C_in);
    and gate3(w2,B,C_in);
    and gate4(w3,w1,A);
    or gate5(C_out,w3,w2); 

endmodule

module hw1_2 (A, B, Cin, S, Cout);
    parameter N = 4;
    input [N-1:0] A, B;
    input Cin;
    output [N-1:0] S;
    output Cout;

    wire [N:0] C; // declare carry bits
    wire w1;

    // connect four one-bit adders to be a four bit adder
    one_bit_adder FA0(.A(A[0]), .B(B[0]), .C_in(Cin), .S(S[0]), .C_out(C[1]));
    one_bit_adder FA1(.A(A[1]), .B(B[1]), .C_in(C[1]), .S(S[1]), .C_out(C[2]));
    one_bit_adder FA2(.A(A[2]), .B(B[2]), .C_in(C[2]), .S(S[2]), .C_out(C[3]));
    one_bit_adder FA3(.A(A[3]), .B(B[3]), .C_in(C[3]), .S(S[3]), .C_out(C[4]));
    
    not gate1(w1,C[4]);
    not gate2(Cout,w1);
    
endmodule
