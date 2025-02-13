module seg7_tb;

    parameter PERIOD = 5; // clk period¡]ns¡^

    reg clk;
    reg [1:0] sw;
    reg [3:0] num_i;
    wire [6:0] seg7_a;
    wire [6:0] seg7_b;
    wire led_b;
    wire led_g;
    wire led_r;
    wire [3:0] led_light;

    seg7 dut (
        .clk(clk),
        .sw(sw),
        .num_i(num_i),
        .seg7_a(seg7_a),
        .seg7_b(seg7_b),
        .led_b(led_b),
        .led_g(led_g),
        .led_r(led_r),
        .led_light(led_light)
    );

    // clk signal
    always begin
        #5 clk = ~clk;
    end

    initial begin
        // initial signal
        sw <= 2'b00;
        num_i <= 4'b0000;
        clk <= 0;

        // wait input signal time 
        #50;
        
        //   case1 : 4*2 = 8

        //  IDLE state
        $display("State: IDLE");
        #50;
        
        // reset   
        num_i <= 4'b1000;
        $display("State: IDLE");
        #10;
        
        // IDLE    input = 4    
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        //  COMPUTE1   input = 2
        num_i <= 4'b0100;
        $display("State: COMPUTE1");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: COMPUTE1");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: COMPUTE1");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: COMPUTE1");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: COMPUTE1");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: COMPUTE1");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: COMPUTE1");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: COMPUTE1");
        #PERIOD;
 
        //   COMPUTE2  
        sw <= 2'b10;
        num_i <= 4'b0100;
        $display("State: COMPUTE2");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: COMPUTE2");
        #PERIOD;
        
        //   RESULT 
        num_i <= 4'b0100;
        $display("State: RESULT");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: RESULT");
        #PERIOD;

        //  display result
        num_i <= 4'b0100;
        $display("State: RESULT");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: RESULT");
        #PERIOD;
        num_i <= 4'b0100;
        $display("State: RESULT");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: RESULT");
        #PERIOD;
        
        // reset   
        num_i <= 4'b1000;
        $display("State: IDLE");
        #10;
        num_i <= 4'b0000;
        $display("State: IDLE");
        #10;
        
        //  result : seg_a = 7'h40 (0) , seg_b = 7'h00 (8)  ,  led is blue
        
        //   case2 : 4 & 2 = 00
        
        //  IDLE  input = 4   
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        //  COMPUTE1   input = 3
        num_i <= 4'b0100;
        $display("State: COMPUTE1");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: COMPUTE1");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: COMPUTE1");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: COMPUTE1");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: COMPUTE1");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: COMPUTE1");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: COMPUTE1");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: COMPUTE1");
        #PERIOD;
 
        //  COMPUTE2 
        sw <= 2'b00;
        num_i <= 4'b0100;
        $display("State: COMPUTE2");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: COMPUTE2");
        #PERIOD;
        
        //  RESULT 
        num_i <= 4'b0010;
        $display("State: RESULT");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: RESULT");
        #PERIOD;

        //  display result
        num_i <= 4'b0100;
        $display("State: RESULT");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: RESULT");
        #PERIOD;
        num_i <= 4'b0100;
        $display("State: RESULT");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: RESULT");
        #PERIOD;
        
        // reset   
        num_i <= 4'b1000;
        $display("State: IDLE");
        #10;
        num_i <= 4'b0000;
        $display("State: IDLE");
        #10;
        
        //  result : seg_a = 7'h40 (0) , seg_b = 7'h02 (6)  ,  led is green
        
        //   case3 : 8 << 2 = 20
        
        //  IDLE  input = 8   
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        //  COMPUTE1   input = 2
        
        num_i <= 4'b0100;
        $display("State: COMPUTE1");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: COMPUTE1");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: COMPUTE1");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: COMPUTE1");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: COMPUTE1");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: COMPUTE1");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: COMPUTE1");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: COMPUTE1");
        #PERIOD;
 
        //  COMPUTE2 
        sw <= 2'b00;
        num_i <= 4'b0100;
        $display("State: COMPUTE2");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: COMPUTE2");
        #PERIOD;
        
        //  RESULT 
        num_i <= 4'b0001;
        $display("State: RESULT");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: RESULT");
        #PERIOD;

        //  display result
        num_i <= 4'b0100;
        $display("State: RESULT");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: RESULT");
        #PERIOD;
        num_i <= 4'b0100;
        $display("State: RESULT");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: RESULT");
        #PERIOD;
        
        // reset   
        num_i <= 4'b1000;
        $display("State: IDLE");
        #10;
        num_i <= 4'b0000;
        $display("State: IDLE");
        #10;
        
        //  result : seg_a = 7'h24 (2) , seg_b = 7'h40 (0)  ,  led is red 
        
        //   case4 : ~(8 ^ 2) = 09
        
        //  IDLE  input = 8   
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: IDLE");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: IDLE");
        #PERIOD;
        
        //  COMPUTE1   input = 2
        
        num_i <= 4'b0100;
        $display("State: COMPUTE1");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: COMPUTE1");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: COMPUTE1");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: COMPUTE1");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: COMPUTE1");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: COMPUTE1");
        #PERIOD;
        
        num_i <= 4'b0001;
        $display("State: COMPUTE1");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: COMPUTE1");
        #PERIOD;
 
        //  COMPUTE2 
        sw <= 2'b11;
        num_i <= 4'b0100;
        $display("State: COMPUTE2");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: COMPUTE2");
        #PERIOD;
        
        //  RESULT 
        num_i <= 4'b0010;
        $display("State: RESULT");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: RESULT");
        #PERIOD;

        //  display result
        num_i <= 4'b0100;
        $display("State: RESULT");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: RESULT");
        #PERIOD;
        num_i <= 4'b0100;
        $display("State: RESULT");
        #PERIOD;
        num_i <= 4'b0000;
        $display("State: RESULT");
        #PERIOD;
        
        // reset   
        num_i <= 4'b1000;
        $display("State: IDLE");
        #10;
        num_i <= 4'b0000;
        $display("State: IDLE");
        #10;
        
        //  result : seg_a = 7'h24 (2) , seg_b = 7'h40 (0)  ,  led is green        
              
        // °±¤î¼ÒÀÀ
        $finish;
    end

endmodule
