`timescale 1ms / 10ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:04:51 05/31/2020
// Design Name:   parking_meter
// Module Name:   /home/ise/m152a-shared/lab5/try.v
// Project Name:  lab5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: parking_meter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module try;

	// Inputs
	reg add1;
	reg add2;
	reg add3;
	reg add4;
	reg rst1;
	reg rst2;
	reg clk;
	reg rst;

	// Outputs
	wire [3:0] val1;
	wire [3:0] val2;
	wire [3:0] val3;
	wire [3:0] val4;
	wire a1, a2, a3, a4;
	wire [7:0] led_seg;

	// Instantiate the Unit Under Test (UUT)
	parking_meter uut (
		.add1(add1), 
		.add2(add2), 
		.add3(add3), 
		.add4(add4), 
		.rst1(rst1), 
		.rst2(rst2), 
		.clk(clk), 
		.rst(rst), 
		.led_seg(led_seg), 
		.val1(val1), 
		.val2(val2), 
		.val3(val3), 
		.val4(val4),
		.a1(a1),
		.a2(a2),
		.a3(a3),
		.a4(a4)
	);

	initial begin
		// Initialize Inputs
		add1 = 0;
		add2 = 0;
		add3 = 0;
		add4 = 0;
		rst1 = 0;
		rst2 = 0;
		clk = 0;
		rst = 0;
		//seconds = 0;
		//clk_1hz = 0;

		// Wait 100 ns for global reset to finish
		
		#100;
        
		// Add stimulus here
		rst = 1;
		repeat (150) #5 clk = ~clk;
		rst = 0;
		repeat (2) #5 clk = ~clk;
		
		rst1 = 1;
		repeat (2) #5 clk = ~clk;
		rst1 = 0;
		repeat(4000) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		repeat (2) #5 clk = ~clk;
		add4 = 1;
		repeat (2) #5 clk = ~clk;
		add4 = 0;
		
		
		repeat (10000) #5 clk = ~clk;

	end
      
endmodule

