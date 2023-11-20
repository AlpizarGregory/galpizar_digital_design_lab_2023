module hhclock (seconds, clk);

	output reg seconds = 1'b0;
	input clk;
	integer count = 1;

	always @(posedge clk)
		begin
			if (count == 15000000) begin
				count <= 1;
				seconds <= ~seconds;
			end else begin
				count <= count + 1;
			end
		end
endmodule

module Counter #(parameter N = 8)(input clk, rst, en, output logic [N-1:0] Q);
	always_ff @ (negedge clk or posedge rst)
		if (rst) Q = 8'h00;
		else
			if (en) Q = Q + 1'b1;

endmodule	