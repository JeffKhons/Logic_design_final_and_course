module hw2_2(
    input clk, reset,
    input [7:0] data_in,
    input [8:0] c,
    output reg [7:0] data_out
);
    reg [7:0] r0,r1,r2;
    reg [7:0] src_a,src_b;
    reg [7:0] dest;
    
    always @(posedge clk) begin
        if(~reset) begin
            r0 = 8'b00000000;
            r1 = 8'b00000000;
            r2 = 8'b00000000;
            data_out = 8'b00000000;
        end
        else
            data_out = data_out;
        end
        
    always @(posedge clk) begin
        if(c[4] == 0 && c[3] == 0) 
            src_a = r0;
        else if(c[4] == 0 && c[3] == 1) 
            src_a = r1;
        else if(c[4] == 1 && c[3] == 0) 
            src_a = r2;
        else
            src_a = data_in;
                
        if(c[6] == 0 && c[5] == 0) 
            src_b = r0;
        else if(c[6] == 0 && c[5] == 1) 
            src_b = r1;
        else if(c[6] == 1 && c[5] == 0) 
            src_b = r2;
        else
            src_b = data_in;
    end
        
    always @(posedge clk) begin
        if(c[2] == 0 && c[1] == 0 && c[0] == 0) 
            dest = src_a;
        else if(c[2] == 0 && c[1] == 0 && c[0] == 1) 
            dest = src_a + src_b;
        else if(c[2] == 0 && c[1] == 1 && c[0] == 0) 
            dest = src_a - src_b;
        else if(c[2] == 0 && c[1] == 1 && c[0] == 1) 
            dest = src_a & src_b;
        else if(c[2] == 1 && c[1] == 0 && c[0] == 0) 
            dest = src_a | src_b;
        else if(c[2] == 1 && c[1] == 0 && c[0] == 1) 
            dest = src_a ^ src_b;
        else
             dest = dest;         
    end
    always @(posedge clk) begin
        if(c[8] == 0 && c[7] == 0) 
            r0 = dest;
        else if(c[8] == 0 && c[7] == 1) 
            r1 = dest;
        else if(c[8] == 1 && c[7] == 0) 
            r2 = dest;
        else
            data_out = dest;     
    end
endmodule


