module clk_div_tb;
	
	logic clk;
	logic clk_25MHz;
	
	clock_divider clik_div(
		
		.clk(clk),
		.clk_25MHz(clk_25MHz)
	
	);
	
	initial begin
		clk = 0;
		
	end
	
	always begin
		
		#5 
		clk = ~clk;
		
	
	end
	
endmodule