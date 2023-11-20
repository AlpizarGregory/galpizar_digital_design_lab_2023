`timescale 1 ps / 1 ps
module ram_tb();
	//logic clock, en, rst;
	logic clock, wren, rst;
	logic [7:0] address, data, q;
   ram1 mem(address, clock, data, wren, q);
	//Counter ccc(clock, rst, en, Q);
	initial begin 

		clock = 0;
		wren = 0;
		#40
		wren = 1;
		address = 8'b00000000;
		data = 8'b00111100;
		#40
		clock = 1;
		#40
		wren = 0;
		//en = 1;
		clock = 0;
		#40
		clock = 1;
		#40
		clock = 0;
		address = 8'b00000001;
		#40
		clock = 1;
		#40
		clock = 0;
		address = 8'b00000000;
		#40
		clock = 1;
		#40
		clock = 0;
		address = 8'b00000010;
		#40
		clock = 1;
	end
endmodule