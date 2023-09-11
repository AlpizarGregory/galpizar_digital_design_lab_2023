module n_bit_subtractor (
  input logic [3:0] a,
  input logic [3:0] b,
  input logic aorb,
  input logic doit;
  output logic [3:0] res,
  output logic negout
  
);
  logic [4:0] carry;
  logic [3:0] a2;
  logic [3:0] b2;
  
  always_comb begin
	for (int i = 0; i < 4; i++) begin
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
    for (i = 0; i < 4; i++) begin : adder_gen
      full_adder_1bit adder_inst(
        .a(a2[i]),
        .b(b2[i] & doit),
        .cin(carry[i]),
        .sum(res[i]),
        .cout(carry[i+1])
      );
    end
  endgenerate
  
  assign negout = !carry[4];

endmodule

