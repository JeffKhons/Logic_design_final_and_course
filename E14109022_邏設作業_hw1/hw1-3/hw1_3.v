`timescale 1ns / 1ps

module hw1_3(
        input S,
        input D0,
        input D1,
        output Y
    );
    wire w1,w2,w3;
    
    and gate1(w1,D1,S);
    not gate2(w2,S);
    and gate3(w3,w2,D0);
    or gate4(Y,w1,w3);
    
endmodule
