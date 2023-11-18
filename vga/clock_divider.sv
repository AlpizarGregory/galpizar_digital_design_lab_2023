module clock_divider (
	input clk,
	output reg clk_25MHz = 0);

	always @(posedge clk) clk_25MHz <= ~clk_25MHz;
	
endmodule