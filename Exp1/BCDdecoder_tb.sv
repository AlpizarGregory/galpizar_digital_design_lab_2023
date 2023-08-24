module BCDdecoder_tb();

	logic [3:0] binary;
	logic [7:0] bcd;
	
	BCDdecoder modulo(binary,bcd);
	
	initial begin
	binary = 0000;
	#30
	binary = 0010;
	#30
	binary = 0100;
	#30
	binary = 0110;
	#30
	binary = 1000;
	#30
	binary = 1010;
	#30
	binary = 1100;
	#30
	binary = 1110;
	end

endmodule