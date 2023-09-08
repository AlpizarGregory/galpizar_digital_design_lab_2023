module shift_right_tb();

	logic [5:0] data_in;
   logic [3:0] shift_count;
	logic [5:0] data_out;

	
	shift_right #(6) InstanceShiftRight(data_in, shift_count , data_out);

	
	//always #20 clk = ~clk;
	initial begin
	
	data_in = 6'b110001;
	shift_count = 4'b0100; 



	#30;

	end

endmodule