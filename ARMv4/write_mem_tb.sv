`timescale 1 ps / 1 ps
module write_mem_tb();

	logic enable;
	logic [2:0] btn;
	logic [7:0] data;
	logic [7:0] addr;

	write_mem Mmem(btn, enable, addr, data);
	
	initial begin 

		btn = 3'b110;
		#40
		btn = 3'b101;
		#40
		btn = 3'b000;
	end
endmodule