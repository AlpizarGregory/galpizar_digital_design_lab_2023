module mux_2_to_1_32 #(parameter N=32)(input [N-1:0] i1, i2, input logic sel, output logic [N-1:0] result);
	
	always @(*) begin
    if (sel) begin
      result = i1;
    end else begin
      result = i2;
	end
  end

endmodule
module mux_2_to_1_4 #(parameter N=4)(input [N-1:0] i1, i2, input logic sel, output logic [N-1:0] result);
	
	always @* begin
    if (sel)
      result = i1;
    else
      result = i2;
  end

endmodule

module mux_3_to_1_32 #(parameter N=8)(input [N-1:0] i1, i2, i3, input logic [1:0] sel, output logic [N-1:0] result);
	
	always_comb begin
		case (sel)
		2'b00:
			result = i1;
		2'b01:
			result = i2;
		2'b10:
			result = i3;
		default:
			result = 0;
		endcase
	end

endmodule

module mux_21(input [7:0] A, B,
					input sel,
					output [7:0] C);

assign C = sel ? A : B;					
					
endmodule