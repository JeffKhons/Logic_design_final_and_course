`timescale 1ns / 1ps

module hw1_1(
    input A,
    input B,
    input C,
    input D,
    input E,
    input F,
    input G,
    output O   
    );
    
    wire w1,w2,w3,w4,w5,w6,w7; // recalre wire
    
    and gate1(w1,A,B);
    or gate2(w2,C,D);
    and gate3(w3,E,F);
    not gate4(w4,w2);
    and gate5(w5,w1,w4);
    or gate6(w6,G,w3);
    not gate7(w7,w6);
    or gate8(O,w5,w7);
      
endmodule
