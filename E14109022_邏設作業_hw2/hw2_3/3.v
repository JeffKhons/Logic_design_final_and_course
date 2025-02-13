module hw2_3(
  input clk,
  input areset,
  input turn_left,
  input turn_right,
  input ground,
  output reg walk_left,
  output reg walk_right,
  output reg aaah
);
  // ©w???
    parameter WALK_LEFT = 2'b00;
    parameter WALK_RIGHT = 2'b01;
    parameter AAAH = 2'b10;

    reg [1:0] state, next;
    always @(posedge clk or posedge areset) begin
        if (areset)
          state = WALK_LEFT;
        else
          state = next;
    end
    // 
    always @(*) begin
        case (state)
          WALK_LEFT: begin
            if (ground == 0)
              next = AAAH;  // 
            else if (turn_right && !turn_left)
              next = WALK_RIGHT;  // 
            else if (turn_left && !turn_right)
              next = WALK_LEFT;  // 
            else if (turn_left && turn_right)
              next = WALK_RIGHT;  // 
            else
              next = WALK_LEFT;  //
          end
          
          WALK_RIGHT: begin
            if (ground == 0)
              next = AAAH;  
            else if (turn_left && !turn_right)
              next = WALK_LEFT;  
            else if (turn_right && !turn_left)
              next = WALK_RIGHT;  
            else if (turn_left && turn_right)
              next = WALK_LEFT;  // 
            else
              next = WALK_RIGHT;  // 
          end
          
          AAAH: begin
            if (ground == 1)
              next = WALK_LEFT;  //
            else
              next = AAAH;  // 
          end
        endcase
    end
    
      // 
    always @(*) begin
        walk_left = (state == WALK_LEFT);
        walk_right = (state == WALK_RIGHT);
        aaah = (state == AAAH);
    end
    
endmodule

