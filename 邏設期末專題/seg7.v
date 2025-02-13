module seg7 (
    input [1:0] sw,            // switch for ALU compute  
    input [3:0] num_i,         // 7_seg display
    input clk,                 // clock signal
    output reg [3:0] led_light,  
    output reg [6:0] seg7_a,     // {g, f, e, d, c, b, a}
    output reg [6:0] seg7_b,     // {g, f, e, d, c, b, a}\
    output reg led_b,
    output reg led_g,
    output reg led_r
);

    // define parameter
    parameter IDLE = 2'b00;            // initial state
    parameter COMPUTE1 = 2'b01;        // compute ALU state
    parameter COMPUTE2 = 2'b10;        // compute ALU state
    parameter RESULT = 2'b11;          // output state
    
    reg [1:0] state;
    reg [3:0] reg_a, reg_b;            // input by num_i[2] ~ num_i[0]
    reg [7:0] final;                   // compute from reg_a, reg_b
    reg [3:0] a, b;                    // delayed values of a and b
    
    always @(state) begin       
            case (state)
                IDLE: led_light <= 4'b0001;
                COMPUTE1: led_light <= 4'b0011;
                COMPUTE2: led_light <= 4'b0111;
                RESULT: led_light <= 4'b1111;
                default: led_light <= 4'b1111;
            endcase
 
    end
    
    always @(posedge clk) begin
        if (num_i == 4'b1111) begin
            reg_a <= 4'b0;
            reg_b <= 4'b0;
            final <= 8'b0;
            state <= IDLE;
        end
        else begin
            case (state)
                IDLE: begin
                    if (num_i == 4'b1000) begin
                        reg_a <= 4'b0;
                        reg_b <= 4'b0;
                        final <= 8'b0;
                        seg7_a <= 7'b1000000;
                        seg7_b <= 7'b1000000;
                        state <= IDLE; 
                    end
                    else if (num_i[3] == 1'b0 && num_i[2:0] == 3'b001) begin
                        reg_a <= reg_a + 1'b1;
                        state <= IDLE;
                        case (reg_a)
                            4'b0000: seg7_a = 7'b1000000;  // Display '0'
                            4'b0001: seg7_a = 7'b1111001;  // Display '1'
                            4'b0010: seg7_a = 7'b0100100;  // Display '2'
                            4'b0011: seg7_a = 7'b0110000;  // Display '3'
                            4'b0100: seg7_a = 7'b0011001;  // Display '4'
                            4'b0101: seg7_a = 7'b0010010;  // Display '5'
                            4'b0110: seg7_a = 7'b0000010;  // Display '6'
                            4'b0111: seg7_a = 7'b1111000;  // Display '7'
                            4'b1000: seg7_a = 7'b0000000;  // Display '8'
                            4'b1001: seg7_a = 7'b0010000;  // Display '9'
                            4'b1010: seg7_a = 7'b0001000;  // Display 'A'
                            4'b1011: seg7_a = 7'b0000011;  // Display 'B'
                            4'b1100: seg7_a = 7'b1000110;  // Display 'C'
                            4'b1101: seg7_a = 7'b0100001;  // Display 'D'
                            4'b1110: seg7_a = 7'b0000110;  // Display 'E'
                            4'b1111: seg7_a = 7'b0001110;  // Display 'F'
                            default: seg7_a = 7'b1111111;   // Display nothing
                        endcase
                    end
                    else if (num_i[3] == 1'b0 && num_i[2:0] == 3'b010) begin
                        reg_a <= reg_a - 1'b1;
                        state <= IDLE;
                    end
                    else if (num_i[3] == 1'b0 && num_i[2:0] == 3'b100) begin
                        state <= COMPUTE1;
                    end                    
                    else  state <= IDLE;
                        
                end
                
                COMPUTE1: begin
                    if (num_i == 4'b1000) begin
                        reg_a <= 4'b0;
                        reg_b <= 4'b0;
                        final <= 8'b0;
                        state <= IDLE; 
                    end
                    else if (num_i[3] == 1'b0 && num_i[2:0] == 3'b001) begin
                        reg_b <= reg_b + 1'b1;
                        state <= COMPUTE1;
                        case (reg_b)
                            4'b0000: seg7_b = 7'b1000000;  // Display '0'
                            4'b0001: seg7_b = 7'b1111001;  // Display '1'
                            4'b0010: seg7_b = 7'b0100100;  // Display '2'
                            4'b0011: seg7_b = 7'b0110000;  // Display '3'
                            4'b0100: seg7_b = 7'b0011001;  // Display '4'
                            4'b0101: seg7_b = 7'b0010010;  // Display '5'
                            4'b0110: seg7_b = 7'b0000010;  // Display '6'
                            4'b0111: seg7_b = 7'b1111000;  // Display '7'
                            4'b1000: seg7_b = 7'b0000000;  // Display '8'
                            4'b1001: seg7_b = 7'b0010000;  // Display '9'
                            4'b1010: seg7_b = 7'b0001000;  // Display 'A'
                            4'b1011: seg7_b = 7'b0000011;  // Display 'B'
                            4'b1100: seg7_b = 7'b1000110;  // Display 'C'
                            4'b1101: seg7_b = 7'b0100001;  // Display 'D'
                            4'b1110: seg7_b = 7'b0000110;  // Display 'E'
                            4'b1111: seg7_b = 7'b0001110;  // Display 'F'
                            default: seg7_b = 7'b1111111;   // Display nothing
                        endcase
                    end
                    else if (num_i[3] == 1'b0 && num_i[2:0] == 3'b010) begin
                        reg_b <= reg_b - 1'b1;
                        state <= COMPUTE1;
                    end
                    else if (num_i[3] == 1'b0 && num_i[2:0] == 3'b100) begin
                        state <= COMPUTE2;
                    end
                    else  state <= COMPUTE1;
                end
                
                COMPUTE2: begin
                    if (num_i == 4'b1000) begin
                        reg_a <= 4'b0;
                        reg_b <= 4'b0;
                        final <= 8'b0;
                        state <= IDLE; 
                    end
                    // led_blue >> +,-,*,/
                    else if(num_i == 4'b0100)begin
                        if (reg_a != 4'b0 && reg_b != 4'b0) begin
                            case (sw)
                                2'b00: final <= reg_a + reg_b - 2'b10;
                                2'b01: final <= reg_a - reg_b;
                                2'b10: final <= (reg_a - 1'b1) * (reg_b - 1'b1);
                                2'b11: final <= (reg_a - 1'b1) / (reg_b - 1'b1);
                                default: final <= 8'b0;
                            endcase
                            led_b <= 1'b1;
                            led_g <= 1'b0;
                            led_r <= 1'b0;  
                        state <= RESULT;
                        end
                        else begin
                            state <= COMPUTE2;
                        end
                    end
                    // led_green >> or,and,xor,xnor
                    else if(num_i == 4'b0010)begin
                        if (reg_a != 4'b0 && reg_b != 4'b0) begin
                            case (sw)
                                2'b00: final <= (reg_a - 1'b1) | (reg_b - 1'b1);
                                2'b01: final <= (reg_a - 1'b1) & (reg_b - 1'b1);
                                2'b10: final <= (reg_a - 1'b1) ^ (reg_b - 1'b1);
                                2'b11: final <= ~((reg_a - 1'b1) ^ (reg_b - 1'b1));
                                default: final <= 8'b0;
                            endcase
                            led_b <= 1'b0;
                            led_g <= 1'b1;
                            led_r <= 1'b0;  
                        state <= RESULT;
                        end
                        else begin
                            state <= COMPUTE2;
                        end
                    end
                    // led_red >> shifter operator
                    else if(num_i == 4'b0001)begin
                        if (reg_a != 3'b0 && reg_b != 3'b0) begin
                            case (sw)
                                2'b00: final <= (reg_a - 1'b1) << (reg_b - 1'b1);
                                2'b01: final <= (reg_a - 1'b1) >> (reg_b - 1'b1);
                                2'b10: final <= ~(reg_a - 1'b1) << (reg_b - 1'b1);
                                2'b11: final <= ~((reg_a - 1'b1) >> (reg_b - 1'b1));
                                default: final <= 8'b0;
                            endcase
                            led_b <= 1'b0;
                            led_g <= 1'b0;
                            led_r <= 1'b1;  
                        state <= RESULT;
                        end
                        else begin
                            state <= COMPUTE2;
                        end
                    end

                    else  state <= COMPUTE2; 
                end
                
                RESULT: begin
                    if(num_i == 4'b1000) begin
                        reg_a <= 4'b0;
                        reg_b <= 4'b0;
                        final <= 8'b0;
                        state <= IDLE;
                    end
                    else if (num_i == 4'b0100)begin
                        a <= final[7:4];
                        b <= final[3:0];
                        case (a)
                            4'b0000: seg7_a = 7'b1000000;  // Display '0'
                            4'b0001: seg7_a = 7'b1111001;  // Display '1'
                            4'b0010: seg7_a = 7'b0100100;  // Display '2'
                            4'b0011: seg7_a = 7'b0110000;  // Display '3'
                            4'b0100: seg7_a = 7'b0011001;  // Display '4'
                            4'b0101: seg7_a = 7'b0010010;  // Display '5'
                            4'b0110: seg7_a = 7'b0000010;  // Display '6'
                            4'b0111: seg7_a = 7'b1111000;  // Display '7'
                            4'b1000: seg7_a = 7'b0000000;  // Display '8'
                            4'b1001: seg7_a = 7'b0010000;  // Display '9'
                            4'b1010: seg7_a = 7'b0001000;  // Display 'A'
                            4'b1011: seg7_a = 7'b0000011;  // Display 'B'
                            4'b1100: seg7_a = 7'b1000110;  // Display 'C'
                            4'b1101: seg7_a = 7'b0100001;  // Display 'D'
                            4'b1110: seg7_a = 7'b0000110;  // Display 'E'
                            4'b1111: seg7_a = 7'b0001110;  // Display 'F'
                            default: seg7_a = 7'b1111111;   // Display nothing
                        endcase
                        state <= RESULT;
                        case (b)
                            4'b0000: seg7_b = 7'b1000000;  // Display '0'
                            4'b0001: seg7_b = 7'b1111001;  // Display '1'
                            4'b0010: seg7_b = 7'b0100100;  // Display '2'
                            4'b0011: seg7_b = 7'b0110000;  // Display '3'
                            4'b0100: seg7_b = 7'b0011001;  // Display '4'
                            4'b0101: seg7_b = 7'b0010010;  // Display '5'
                            4'b0110: seg7_b = 7'b0000010;  // Display '6'
                            4'b0111: seg7_b = 7'b1111000;  // Display '7'
                            4'b1000: seg7_b = 7'b0000000;  // Display '8'
                            4'b1001: seg7_b = 7'b0010000;  // Display '9'
                            4'b1010: seg7_b = 7'b0001000;  // Display 'A'
                            4'b1011: seg7_b = 7'b0000011;  // Display 'B'
                            4'b1100: seg7_b = 7'b1000110;  // Display 'C'
                            4'b1101: seg7_b = 7'b0100001;  // Display 'D'
                            4'b1110: seg7_b = 7'b0000110;  // Display 'E'
                            4'b1111: seg7_b = 7'b0001110;  // Display 'F'
                            default: seg7_b = 7'b1111111;   // Display nothing
                        endcase
                        state <= RESULT; 
                    end
                    else  state <= RESULT;                   
                        
                end
                
                default: state <= IDLE;
            endcase
        end
    end

endmodule