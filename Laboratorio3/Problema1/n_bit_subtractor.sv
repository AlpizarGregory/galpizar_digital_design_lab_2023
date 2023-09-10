module n_bit_subtractor #(parameter N = 4) (
  input logic [N-1:0] a,
  input logic [N-1:0] b,
  input logic doit,
  output logic [N-1:0] res,
  output logic negout
  
);
  wire [N:0] carry;
  logic [N-1:0] a2;
  logic [N-1:0] b2;
  wire [N-1:0] res2;
  
  always_comb begin
	  for (int i = 0; i < N; i++) begin
		  a2[i] = a[i];
		  b2[i] = !b[i];
	  end
  end
  
  assign carry[0] = 1'b1;
  
  generate
    genvar i;
    for (i = 0; i < N; i++) begin : adder_gen
      full_adder_1bit adder_inst(
        .a(a2[i]),
        .b(b2[i] & doit),
        .cin(carry[i] & doit),
        .sum(res2[i]),
        .cout(carry[i+1])
      );
    end

    for (i = 0; i < N; i++) begin : assignation_when_finished
      assign res[i] = res2[i] ^ (!carry[N] & doit);
    end

  endgenerate

  //assign res = res2;
  
  assign negout = !carry[4] & doit;

endmodule

