/*
module and_gate(input logic a, input logic b, output logic y);
  assign y = a & b;
endmodule

module or_gate(input logic a, input logic b, output logic y);
  assign y = a | b;
endmodule

module xor_gate(input logic a, input logic b, output logic y);
  assign y = a ^ b;
endmodule

module adder_subtractor(input logic [3:0] a, input logic [3:0] b, input logic subtract,
                        output logic [3:0] result_as, output logic zero, output logic overflow);
  logic carry;

  assign result = subtract ? a - b : a + b;
  assign zero = (result == 4'b0000);
  assign overflow = (a[3] & b[3] & ~result_as[3]) | (~a[3] & ~b[3] & result_as[3]);
endmodule

module multiplier(input logic [3:0] a, input logic [3:0] b, output logic [7:0] product);
  assign product = a * b;
endmodule

module divider(input logic [7:0] dividend, input logic [3:0] divisor,
               output logic [3:0] quotient, output logic [3:0] remainder);
  assign {quotient, remainder} = dividend / divisor;
endmodule

module modulo(input logic [7:0] dividend, input logic [3:0] divisor,
              output logic [3:0] remainder);
  assign remainder = dividend % divisor;
endmodule

module shift_left(input logic [7:0] a, input logic [1:0] amount,
                  output logic [7:0] result_sl);
  assign result_sl = a << amount;
endmodule

module shift_right(input logic [7:0] a, input logic [1:0] amount,
                   output logic [7:0] result_sr);
  assign result_sr = a >> amount;
endmodule



module ALU(input logic [3:0] a, input logic [3:0] b, input logic [3:0] opcode,
           output logic [7:0] result, output logic zero, output logic overflow);
  
  logic [3:0] add_result, subtract_result, multiplier_result;
  logic [3:0] divisor, modulo_result, and_result, or_result, xor_result;
  logic [7:0] shift_left_result, shift_right_result;

  adder_subtractor add_sub_inst(.a(a), .b(b), .subtract(opcode[0]),
                                 .result_as(add_result), .zero(zero), .overflow(overflow));
											
  multiplier mult_inst(.a(a), .b(b), .product(multiplier_result));
  
  divider div_inst(.dividend(a), .divisor(b[3:0]),
                   .quotient(divisor), .remainder(result[3:0]));
  modulo mod_inst(.dividend(a), .divisor(b[3:0]), .remainder(modulo_result));
  
  and_gate and_inst(.a(a), .b(b), .y(and_result));
  
  or_gate or_inst(.a(a), .b(b), .y(or_result));
  
  xor_gate xor_inst(.a(a), .b(b), .y(xor_result));
  
  shift_left shl_inst(.a(a), .amount(b[1:0]), .result_sl(shift_left_result));
  
  shift_right shr_inst(.a(a), .amount(b[1:0]), .result_sr(shift_right_result));

*/
/*
module ALu
	#(parameter Nbits = 3)
		(input logic A, B, Op,
		output logic Output);
	
	input logic [Nbits-1:0] A, [Nbits-1:0] B, Op;
	output logic [Nbits-1:0] current; 
	
	
	
endmodule


module mux2
	#(parameter width = 8)
	(input logic [width–1:0] d0, d1,
	input logic s,
	output logic [width–1:0] y);
	
	assign y = s ? d1 : d0;
endmodule

module ALU(input logic [3:0] A, [3:0] B ,input logic [3:0] Op, input logic [1:0] s,
	output logic [7:0] y);
	logic [7:0] low, hi;
	
	mux2 Amux(d0, d1, s[0], low);
	mux2 Lmux(d2, d3, s[0], hi);
	mux2 outmux(low, hi, s[1], y);
endmodule*/




