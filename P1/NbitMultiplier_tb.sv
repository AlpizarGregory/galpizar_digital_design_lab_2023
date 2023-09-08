module NbitMultiplier_tb();

	logic [3:0] a;
   logic [3:0] b;
   //logic carry_in;
	logic [5:0] result;
	//logic carry_out;
	
	NbitMultiplier #(4) InstanceMultiplier(a, b , result);

	
	//always #20 clk = ~clk;
	initial begin
	
	a = 4'b1001;
	b = 4'b0011; 



	#30;

	end

endmodule