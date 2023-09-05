module n_bit_subtractor #(
  parameter int N = 4
)(
  input logic [N-1:0] a,
  input logic [N-1:0] b,
  input logic aorb,
  output logic [N-1:0] res,
  output logic negout
  
);
  logic [N:0] carry;
  logic [N-1:0] a2;
  logic [N-1:0] b2;
  
  always_comb begin
	for (int i = 0; i < N; i++) begin
		if (aorb == 0) begin
			a2[i] = !a[i];
			b2[i] = b[i];
		end else begin
			a2[i] = a[i];
			b2[i] = !b[i];
		end
	end
  end
  
  assign carry[0] = 1'b1;
  
  generate
    genvar i;
    for (i = 0; i < N; i++) begin : adder_gen
      full_adder_1bit adder_inst(
        .a(a2[i]),
        .b(b2[i]),
        .cin(carry[i]),
        .sum(res[i]),
        .cout(carry[i+1])
      );
    end
  endgenerate
  
  assign negout = !carry[N];

endmodule

