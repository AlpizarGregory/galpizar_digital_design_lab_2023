`timescale 1 ps / 1 ps
module top_module_Filter_tb();

	logic clk, rst;
	logic [2:0] btn;
	logic [7:0] q;
	logic [7:0] address;

	top_module_Filter PPmem(clk, rst, btn, q, address);
	
	initial begin 

		clk = 0;
		rst = 0;
		#200
		rst = 1;
		btn = 3'b101;
		#200
		rst = 0;
		#200
		clk = 1;
		#200
		clk = 0;
		btn = 3'b110;
		#200
		clk = 1;
		#200
		clk = 0;
		btn = 3'b100;
		#200
		clk = 1;
		#200
		clk = 0;
	end
endmodule