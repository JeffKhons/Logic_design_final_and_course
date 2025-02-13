module testbench;

    reg [2:0] R;
    reg L,clk;
    wire [2:0] Qout;

hw2_1 test (
        .R(R), 
        .L(L), 
        .clk(clk), 
        .Qout(Qout)
    );
    initial begin
        clk = 0;
        L = 1;
        R <= 3'b000;
        #5 R <= 3'b000;
        #5 R <= 3'b001;
        #5 R <= 3'b010;L = 0;
        #5 R <= 3'b011;     
        #5 R <= 3'b100;L = 1;
        #5 R <= 3'b101;
        #5 R <= 3'b110;
        #5 R <= 3'b111;
        #5 $finish;
    end

    always #1 clk= ~clk;

endmodule
