// Code your design here
// Code your design here
`define RESET	4'b0000
`define IDLE 	4'b0001
`define RELOAD 	4'b0010
`define TRANSECT1 	4'b0011
`define TRANSECT2 	4'b0100
`define VEND1 	4'b0101
`define VEND2 	4'b0110
`define VALID 	4'b0111
/*`define GAME_ST_CHKV_O 	4'b1000
`define GAME_ST_CHKW_O 	4'b1001
`define GAME_ST_WIN_O 	4'b1010
`define GAME_ST_CATS 	4'b1011*/

//`define reg [2:0] COSTS [19:0]
//`define COSTS[2:0] [19:0] {3'b1, 3'b1, 3'b1, 3'b1, 3'b10, 3'b10, 
//3'b10, 3'b10, 3'b11, 3'b11, 3'b11, 3'b11, 3'b100, 3'b100, 3'b100, 3'b100, 3'b101, 3'b101, 3'b110, 3'b110}


module vending_machine(
  input CLK,
  input RESET,
  input RELOAD,
  input CARD_IN,
  input [3:0] ITEM_CODE,
  input KEY_PRESS,
  input VALID_TRAN,
  input DOOR_OPEN,
  output reg VEND,
  output reg INVALID_SEL,
  output reg [2:0] COST, 
  output reg FAILED_TRAN//,
  //output reg [3:0] vend_state,
  //output reg [3:0] nx_vend_state,
  //output reg [3:0] cycle_count,
  //output reg [4:0] num
  
  );
  
  reg [3:0] cycle_count;
  reg [3:0] vend_state;
  reg [3:0] nx_vend_state;
  reg [3:0] counts [19:0];
  reg [4:0] num;
  reg [2:0] COSTS [19:0];
  
  initial begin
      COSTS[0] = 3'b1;
      COSTS[1] = 3'b1;
      COSTS[2] = 3'b1;
      COSTS[3] = 3'b1;
      COSTS[4] = 3'b10;
      COSTS[5] = 3'b10;
      COSTS[6] = 3'b10;
      COSTS[7] = 3'b10;
      COSTS[8] = 3'b11;
      COSTS[9] = 3'b11;
      COSTS[10] = 3'b11;
      COSTS[11] = 3'b11;
      COSTS[12] = 3'b100;
      COSTS[13] = 3'b100;
      COSTS[14] = 3'b100;
      COSTS[15] = 3'b100;
      COSTS[16] = 3'b101;
      COSTS[17] = 3'b101;
      COSTS[18] = 3'b110;
      COSTS[19] = 3'b110;
  end
  
  always @(posedge CLK or posedge RESET) begin
	if(RESET) begin
		vend_state <= `RESET;
	end
	else begin
    vend_state <= nx_vend_state;
	end
  end
  
  integer index;
  always @(posedge CLK or posedge RESET or negedge CLK) begin
    /*if(RESET) begin
      vend_state = `RESET;
    end*/
    
    case(vend_state)
      `RESET: begin
        num = 0;
      	cycle_count = 0;
      	VEND = 0;
      	INVALID_SEL = 0;
      	COST = 4'b0;
      	FAILED_TRAN = 0;
      	for (index=0; index<20; index=index+1) begin
      	  counts[index] <= 4'b0;
     	 end
		 if(RESET)
			nx_vend_state = `RESET;
		 else 
			nx_vend_state = `IDLE;
      end//END RESET
      `IDLE: begin
        num = 0;
        cycle_count = 0;
        VEND = 0;
      	INVALID_SEL = 0;
      	COST = 4'b0;
      	FAILED_TRAN = 0;
        if(CARD_IN) begin
          nx_vend_state = `TRANSECT1;
        end
        else if(RELOAD) begin
          nx_vend_state = `RELOAD;
        end
        else begin
          nx_vend_state = `IDLE;
        end
      end //END IDLE
      
      `RELOAD: begin
        for (index=0; index<20; index=index+1) begin
          counts[index] <= 4'b1010;
      	end
        nx_vend_state = `IDLE;
      end //END RELOAD
      
      `TRANSECT1: begin
        //if(CARD_IN == 0) begin
        //  nx_vend_state = `IDLE;
        //end
        //else begin
          if(cycle_count >= 7 && VALID_TRAN == 0) begin
            //FAILED_TRAN = 1;
            nx_vend_state = `IDLE;
          end
          else begin
            if(KEY_PRESS) begin
              if(ITEM_CODE == 3'b0) begin
                num = 5'b0;
                nx_vend_state = `TRANSECT2;
                cycle_count = 0;
              end
              else if(KEY_PRESS && ITEM_CODE == 3'b1) begin
                num = 5'b01010;
                nx_vend_state = `TRANSECT2;
                cycle_count = 0;
              end
              else begin
                INVALID_SEL = 1;
                nx_vend_state = `IDLE;
              end
            end
            else begin
              cycle_count = cycle_count + 1;
              nx_vend_state = `TRANSECT1;
            end
          end
        //end
      end //END TRANSECT1
      
      `TRANSECT2: begin
        if(KEY_PRESS) begin
          //num = num + ITEM_CODE;
          COST = COSTS[num + ITEM_CODE];
          cycle_count = 0;
			 
          nx_vend_state = `VALID;
			 if(CLK == 1)
				num = num+ITEM_CODE;
        end
        else begin
          //cycle_count = cycle_count + 1;
          if(cycle_count >= 9 && VALID_TRAN == 0) begin
            //FAILED_TRAN = 1;
            nx_vend_state = `IDLE;
          end
          else begin
				cycle_count = cycle_count + 1;
            nx_vend_state = `TRANSECT2;
          end
        end
          
      end // END TRANSECT2
      
      `VALID: begin
        cycle_count = cycle_count + 1;
        if(VALID_TRAN) begin
			 cycle_count = 0;
          nx_vend_state = `VEND1;
        end
        else begin
          if(cycle_count >= 9) begin
            FAILED_TRAN = 1;
            nx_vend_state = `IDLE;
          end
          else begin
            nx_vend_state = `VALID;
          end
        end
      end //END VALID
		
      `VEND1: begin
			VEND = 1;
			counts[num] <= counts[num]-1;
        cycle_count = cycle_count + 1;
        if(cycle_count >= 9) begin
          nx_vend_state = `IDLE;
        end
        else begin
          if(DOOR_OPEN) begin
            nx_vend_state = `VEND2;
            cycle_count = 0;
          end
          else begin
            nx_vend_state = `VEND1;
          end
        end
     
          
      end //END VEND1
      `VEND2: begin
			VEND = 1;
        
		 
		  
		  
		  
          if(DOOR_OPEN == 0) begin
            nx_vend_state = `IDLE;
          end
          else begin
            nx_vend_state = `VEND2;
          end
        //end
        
      end//END VEND2
    endcase
      
  end //END ALWAYS

endmodule
