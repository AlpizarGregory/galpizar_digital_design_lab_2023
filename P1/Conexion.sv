/*
module Conexion(inA, outA);
	input logic [3:0] inA;
	output logic [3:0] outA;

	logic [3:0] outB_to_inC;

	B B_inst(inA, outB_to_inC);

	C C_inst(outB_to_inC, outA);

endmodule

	
module B (inB, outB);
	input logic [3:0] inB;
	output logic [3:0] outB;
	
	assign outB = inB + 4'b0001 ;


endmodule


module C (inC, outC);
	input logic [3:0] inC;
	output logic [3:0] outC;
	
	assign outC = inC + 4'b0010;



endmodule
*/
/*
module Conexion(a, b, y);
	input logic [3:0] a;
	input logic [3:0] b;
	output logic [11:0] y;
	
	logic [11:0] y2;
	
	logic [3:0] individual;
	
	genvar fila;
	
 
	generate
		for (fila=0; fila<=3; fila++) begin : generate_block_identifier
			andMultiplier inst_andMultiplier (a,b[i],individual);
			assign y2 = {y2, individual};
		end
	endgenerate	
	assign y = y2;
	 

endmodule


module andGate2 (a, b, y);
	input logic a, b;
	output logic y;
	
	assign y = a & b;
endmodule	


module Conexion(a, b2, individual2);
	input logic [3:0] a; 
	input logic b2;
	output logic [3:0] individual2;
	logic y2;
	genvar i;
	
	generate
		for (i=0; i<=3; i++) begin : generate_block_identifier2
			andGate whatever_andGate(a[i], b, y2);
			assign y2 = {y2, individual};
		end
	endgenerate
	assign individual2 = y2;
	

endmodule
*/

module AndGate2 #(parameter WIDTH = 1)(
  input logic [WIDTH-1:0] a,
  input logic [WIDTH-1:0] b,
  output logic y
);
  assign y = a & b;
endmodule


module XorGate2 #(parameter WIDTH = 1)(
  input logic [WIDTH-1:0] a,
  input logic [WIDTH-1:0] b,
  output logic y
);
  assign y = a ^ b;
endmodule


module suma #(parameter N = 8)(
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
      AndGate2 #(1) and_gates (
        .a(a[i]),
        .b(b[i]),
        .y(and_outputs[i])
      );
      XorGate2 #(1) xor_gates (
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

module Conexion #(parameter N = 3)(
  input logic [N-1:0] a,
  input logic [N-1:0] b,
  output logic [2*N-1:0] result
);

  // Define intermediate signals for partial products and additions
  logic [2*N-1:0] partial_products[N];
  logic [2*N-1:0] partial_sums[N+1];
  
  logic [2*N-1:0] partial_sS;
  
  //logic [2*N-1:0] resultSum[N+1];
  //logic ci = 0;
  
  //int e;
  // Generate partial products
  genvar i;
  //assign partial_sums[0] = 2'b0;
  generate
    for (i = 0; i < N; i = i + 1) begin : generate_partial_products
      assign partial_products[i] = (a[i] == 1'b1) ? (b << i) : (0 << i);
    end
	 
  endgenerate
  

  // Generate partial sums
  genvar j;
  assign partial_sums[0] = 0;
  generate
    for (j = 0; j < N; j = j + 1) begin : generate_partial_sums
      suma #(2*N) sum_instance (
      .a(partial_sums[j]),
      .b(partial_products[j]),
      .sum(partial_sums[j + 1])
		);

    end
	 
  endgenerate
  
  // Output the result
  assign result = partial_sums[N];

endmodule


module shift_left_with_truncate #(parameter N = 8)(
  input logic [N-1:0] data_in, // Input data vector
  input logic [3:0] shift_count, // Number of positions to shift
  output logic [N-1:0] data_out // Output data vector
);

  always_comb begin
    // Initialize data_out with zeros
    data_out = 0;
    for (int i = 0; i < N; i = i + 1) begin
      if (i >= shift_count) begin
        // Perform the left shift operation and truncate
        data_out[i] = data_in[i - shift_count];
      end
    end
  end

endmodule

















