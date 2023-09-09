module n_bit_subtractor (
  input logic [3:0] a,
  input logic [3:0] b,
  input logic doit,
  output logic [3:0] res,
  output logic negout
  
);
  wire [4:0] carry;
  logic [3:0] a2;
  logic [3:0] b2;
  wire [3:0] res2;
  
  always_comb begin
	  for (int i = 0; i < 4; i++) begin
		  a2[i] = a[i];
		  b2[i] = !b[i];
	  end
  end
  
  assign carry[0] = 1'b1;
  
  generate
    genvar i;
    for (i = 0; i < 4; i++) begin : adder_gen
      full_adder_1bit adder_inst(
        .a(a2[i]),
        .b(b2[i] & doit),
        .cin(carry[i] & doit),
        .sum(res2[i]),
        .cout(carry[i+1])
      );
    end
  endgenerate

  assign res[0] = res2[0] ^ carry[4];
  
  assign negout = !carry[4];

endmodule

