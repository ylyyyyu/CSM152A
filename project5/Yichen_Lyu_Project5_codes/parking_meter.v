// Code your design here

//define states
`define RESET	2'b00
`define COUNT_DOWN 	2'b01
`define LESS_180 	2'b10

//input clock is 100Hz
module parking_meter(add1, add2, add3, add4, rst1, rst2, clk, rst, led_seg, val1, val2, val3, val4, a1, a2, a3, a4);
  input add1, add2, add3, add4, rst1, rst2, clk, rst;
  output reg [3:0] val1, val2, val3, val4, a1, a2, a3, a4;
  
  output reg [6:0] led_seg;
  
  reg [1:0] cur_state;
  reg [13:0] seconds;
  reg [5:0] count;
  reg clk_1hz;
  reg [1:0] cnt;
  reg [6:0] count1;
  reg clk_1hz_1;
  
  //counter, count from 0 - 49
  always @(posedge clk or posedge rst) begin
    if(rst || count == 49)
      count <= 6'b0;
    else
      count <= count + 1'b1;
  end
  //counter1, count from 0 - 99
  always @(posedge clk or posedge rst) begin
    if(rst || count1 == 99)
      count1 <= 7'b0;
    else
      count1 <= count1 + 1'b1;
  end
  
  //set clk_1hz
  always @(posedge clk or posedge rst) begin
      if(rst)
        clk_1hz <= 0;
      else if(count == 49)
        clk_1hz <= ~clk_1hz;
      else
        clk_1hz <= clk_1hz;
  end
  
  always @(posedge clk or posedge rst) begin
      if(rst)
        clk_1hz_1 <= 0;
      else if(count1 == 99)
        clk_1hz_1 <= 1;
      else
        clk_1hz_1 <= 0;
  end
  
  always @(posedge clk or negedge clk) begin
	if(rst) begin
		cnt <= 2'b0;
	end
	else begin
		cnt <= cnt+2'b01;
	end
	
	if(cnt == 0) begin
		a2 <= 1;
		a3 <= 1;
		a4 <= 1;
		if (val1 == 0)
			led_seg <= 7'b0000001;
		else if(val1 == 1)
			led_seg <= 7'b1001111;
		else if(val1 == 2)
			led_seg <= 7'b0010010;
		else if(val1 == 3)
			led_seg <= 7'b0000110;
		else if(val1 == 4)
			led_seg <= 7'b1001100;
		else if(val1 == 5)
			led_seg <= 7'b0100100;
		else if(val1 == 6)
			led_seg <= 7'b0100000;
		else if(val1 == 7)
			led_seg <= 7'b0001111;
		else if(val1 == 8)
			led_seg <= 7'b0000000;
		else
			led_seg <= 7'b0000100;
			
		if(cur_state == `COUNT_DOWN) begin
			a1 <= 0;
		end
		else if(cur_state == `RESET) begin
			if(clk_1hz)
				a1 <= 1;
			else
				a1 <= 0;
		end
		else begin
			if(seconds % 2 == 0)
				a1 <= 0;
			else
				a1 <= 1;
		end
	end
	else if (cnt == 1) begin
		a1 <= 1;
		a3 <= 1;
		a4 <= 1;
		if (val2 == 0)
			led_seg <= 7'b0000001;
		else if(val2 == 1)
			led_seg <= 7'b1001111;
		else if(val2 == 2)
			led_seg <= 7'b0010010;
		else if(val2 == 3)
			led_seg <= 7'b0000110;
		else if(val2 == 4)
			led_seg <= 7'b1001100;
		else if(val2 == 5)
			led_seg <= 7'b0100100;
		else if(val2 == 6)
			led_seg <= 7'b0100000;
		else if(val2 == 7)
			led_seg <= 7'b0001111;
		else if(val2 == 8)
			led_seg <= 7'b0000000;
		else
			led_seg <= 7'b0000100;
			
		if(cur_state == `COUNT_DOWN) begin
			a2 <= 0;
		end
		else if(cur_state == `RESET) begin
			if(clk_1hz)
				a2 <= 1;
			else
				a2 <= 0;
		end
		else begin
			if(seconds % 2 == 0)
				a2 <= 0;
			else
				a2 <= 1;
		end
	end
	else if(cnt == 2) begin
		a1 <= 1;
		a2 <= 1;
		a4 <= 1;
		if (val3 == 0)
			led_seg <= 7'b0000001;
		else if(val3 == 1)
			led_seg <= 7'b1001111;
		else if(val3 == 2)
			led_seg <= 7'b0010010;
		else if(val3 == 3)
			led_seg <= 7'b0000110;
		else if(val3 == 4)
			led_seg <= 7'b1001100;
		else if(val3 == 5)
			led_seg <= 7'b0100100;
		else if(val3 == 6)
			led_seg <= 7'b0100000;
		else if(val3 == 7)
			led_seg <= 7'b0001111;
		else if(val3 == 8)
			led_seg <= 7'b0000000;
		else
			led_seg <= 7'b0000100;
		
		if(cur_state == `COUNT_DOWN) begin
			a3 <= 0;
		end
		else if(cur_state == `RESET) begin
			if(clk_1hz)
				a3 <= 1;
			else
				a3 <= 0;
		end
		else begin
			if(seconds % 2 == 0)
				a3 <= 0;
			else 
				a3 <= 1;
		end
	end
	else begin
		a1 <= 1;
		a2 <= 1;
		a3 <= 1;
		if (val4 == 0)
			led_seg <= 7'b0000001;
		else if(val4 == 1)
			led_seg <= 7'b1001111;
		else if(val4 == 2)
			led_seg <= 7'b0010010;
		else if(val4 == 3)
			led_seg <= 7'b0000110;
		else if(val4 == 4)
			led_seg <= 7'b1001100;
		else if(val4 == 5)
			led_seg <= 7'b0100100;
		else if(val4 == 6)
			led_seg <= 7'b0100000;
		else if(val4 == 7)
			led_seg <= 7'b0001111;
		else if(val4 == 8)
			led_seg <= 7'b0000000;
		else
			led_seg <= 7'b0000100;
		
		if(cur_state == `COUNT_DOWN) begin
			a4 <= 0;
		end
		else if(cur_state == `RESET) begin
			if(clk_1hz)
				a4 <= 1;
			else
				a4 <= 0;
		end
		else begin
			if(seconds % 2 == 0)
				a4 <= 0;
			else
				a4 <= 1;
		end
	end
  
  end
  reg [13:0] benchmark;
  always @(posedge clk_1hz_1 or posedge add1 or posedge add2 or posedge add3 or posedge add4 
				or posedge rst or posedge rst2 or posedge rst1) begin
	 
	 if(rst)
		seconds <= 0;
	 else if(rst1)
		seconds <= 15;
	 else if(rst2)
		seconds <= 150;
	 else if(add1 && (benchmark < 9939))
      seconds <= seconds + 60;
    else if(add2 && (benchmark < 9879))
      seconds <= seconds + 120;
    else if(add3 && (benchmark < 9919))
      seconds <= seconds + 180;
    else if(add4 && (benchmark < 9699))
      seconds <= seconds + 300;
	 else if(clk_1hz_1 && benchmark > 0)
		seconds <= seconds - 1;
	 else if (add1 || add2 || add3 || add4)
		seconds <= 9999;
  end
  
  always @(*) begin
    benchmark <= seconds;
	 if(rst) begin
      cur_state <= `RESET;
    end
    
    else if(rst1) begin
      cur_state <= `LESS_180;
    end
    
    else if(rst2) begin
      cur_state <= `LESS_180;
    end
    else if(seconds == 0) begin
      cur_state <= `RESET;
    end
    else if(seconds <= 180) begin
      cur_state <= `LESS_180;
    end
    else begin
      cur_state <= `COUNT_DOWN;
    end
	 
    val4 <= seconds % 10;
    val3 <= (seconds / 10) % 10;
    val2 <= (seconds / 100) % 10;
    val1 <= (seconds / 1000) % 10;

  end
endmodule



