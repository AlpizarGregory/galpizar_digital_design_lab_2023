module NbitDivider_tb();

	logic [3:0] a;
   logic [3:0] b;
   //logic carry_in;
	logic [3:0] result;
	logic [3:0] count;
	//logic carry_out;
	
	SubtractionCounter #(4) InstanceSubtractionCounter(a, b , result, count);

	
	//always #20 clk = ~clk;
	initial begin
	
	a = 4'b1111;
	b = 4'b0111; 



	#30;

	end

endmodule