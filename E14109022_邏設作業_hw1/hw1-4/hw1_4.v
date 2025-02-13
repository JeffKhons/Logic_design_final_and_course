`timescale 1ns / 1ps

module hw1_4(
    input [3:0] bcd,
    output [6:0] seg
    );
    wire w1,w2,w4,w5,w8,w9,w10,w12,w13,w15,w16,w17,w19,w20,A,B,C,D;
    
    buf u1(A,bcd[0]); // use A,B,C,D to simpify input bcd 
    buf u2(B,bcd[1]);
    buf u3(C,bcd[2]);
    buf u4(D,bcd[3]);
    
    and gate1(w1,(~A),C); // seg[0] ~ seg[6] , respectively by gate level
    and gate2(w2,A,(~B),(~C),(~D));
    or gate3(seg[0],w1,w2);
    
    and gate4(w4,A,(~B),C);
    and gate5(w5,(~A),B,C);
    or gate6(seg[1],w4,w5);
    
    and gate7(seg[2],~(A),B,~(C));
    
    and gate8(w8,(~A),(~B),C);
    and gate9(w9,A,B,C);
    and gate10(w10,A,(~B),(~C));
    or gate11(seg[3],w8,w9,w10);
    
    and gate12(w12,A);
    and gate13(w13,(~B),C);
    or gate14(seg[4],w12,w13);
    
    and gate15(w15,A,B);
    and gate16(w16,B,(~C),(~D));
    and gate17(w17,A,(~C),(~D));
    or gate18(seg[5],w17,w16,w15);
    
    and gate19(w19,(~B),(~C),(~D));
    and gate20(w20,A,B,C);
    or gate21(seg[6],w20,w19);
    
endmodule
