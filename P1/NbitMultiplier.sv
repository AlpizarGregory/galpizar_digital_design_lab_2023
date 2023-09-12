module And #(parameter WIDTH = 1)(
  input logic [WIDTH-1:0] a,
  input logic [WIDTH-1:0] b,
  output logic y
);
  assign y = a & b;
endmodule


module Xor #(parameter WIDTH = 1)(
  input logic [WIDTH-1:0] a,
  input logic [WIDTH-1:0] b,
  output logic y
);
  assign y = a ^ b;
endmodule


module PartialAdder #(parameter N = 8)(
  input logic [N-1:0] a,
  input logic [N-1:0] b,
  //input logic carry_in,
  output logic [N:0] sum  // Increased width for the sum
);

  logic [N-1:0] and_outputs;
  logic [N-1:0] xor_outputs;
  logic [N:0] carry;  // Increased width for carry handling
  logic carry_out = 0;
  logic carry_in = 0;

  // Generate AND and XOR outputs
  
  genvar i;
  generate
    for (i = 0; i < N; i = i + 1) begin : generate_gates
      AndGate #(1) and_gates (
        .a(a[i]),
        .b(b[i]),
        .y(and_outputs[i])
      );
      XorGate #(1) xor_gates (
        .a(a[i]),
        .b(b[i]),
        .y(xor_outputs[i])
      );
    end
  endgenerate

  // Calculate sum and carry
  always_comb begin
    carry = 1'b0; // Reset carry
    for (int i = 0; i < N; i = i + 1) begin
      logic carry_out_i;

      // Calculate carry-out of this stage
      carry_out_i = (and_outputs[i] | (carry & xor_outputs[i]));

      // Calculate sum of this stage
      sum[i] = xor_outputs[i] ^ carry;

      // Update carry for the next stage
      carry = carry_out_i;
    end
    // Set the extra bit in sum for possible overflow
    sum[N] = carry;
  end

  //assign carry_out = carry;

endmodule

module NbitMultiplier #(parameter N = 3)(
  input logic [N-1:0] a,
  input logic [N-1:0] b,
  output logic result_negative,
  output logic [2*N-1:0] result
);

  
  logic [2*N-1:0] partial_products[N-1];
  logic [2*N-1:0] partial_sums[N];
  
  //logic [2*N-1:0] partial_sS;
  logic a_is_negative;
  logic b_is_negative;
  
  genvar i;
  
  generate
	 assign a_is_negative = a[N-1];
	 assign b_is_negative = b[N-1];
    for (i = 0; i < N-1; i = i + 1) begin : generate_partial_products
      assign partial_products[i] = (a[i] == 1'b1) ? (b << i) : (0 << i);
    end
	 
  endgenerate
  

  
  genvar j;
  assign partial_sums[0] = 0;
  generate
    for (j = 0; j < N-1; j = j + 1) begin : generate_partial_sums
      suma #(2*N) sum_instance (
      .a(partial_sums[j]),
      .b(partial_products[j]),
      .sum(partial_sums[j + 1])
		);

    end
	 
  endgenerate
  
 
  assign result = partial_sums[N-1];
  assign result_negative = a_is_negative ^ b_is_negative;

endmodule