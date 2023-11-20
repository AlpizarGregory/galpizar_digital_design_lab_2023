module alu #(parameter N=32)(input [N-1:0] a, b, input logic[1:0] aluControl, output [N-1:0] resultado, 
									 output cout, zero, neg, overflow);
	logic[N:0] rs, rr;
	reg[N-1:0] r_and, r_or, r_xor, r_shiftR, r_not, r_shiftL, resultado_s, resultado_r, resultado_aux;
	
	logic [N-1:0] shiftR1;
	logic [N-1:0] shiftR2;
	logic cout_aux , neg_aux, zero_aux, overflow_aux;
	logic cout_aux_s, neg_aux_s, zero_aux_s, overflow_aux_s;
	logic cout_aux_r, neg_aux_r, zero_aux_r, overflow_aux_r;
		
	
	
	logic [N-1:0] aux;
	logic_alu LU(a, b, r_and, r_or, r_xor, r_shiftR, r_shiftL, r_not);
	arith_alu AUS(a, b, 0, resultado_s, cout_aux_s, neg_aux_s, zero_aux_s, overflow_aux_s, shiftR1);
	arith_alu AUR(a, b, 1, resultado_r, cout_aux_r, neg_aux_r, zero_aux_r, overflow_aux_r, shiftR2);
	
	
	always @* begin
	case (aluControl)
		2'b00:
			resultado_aux = resultado_s;
		2'b01:
			resultado_aux = resultado_r;
		2'b10:
			resultado_aux = r_and;
		2'b11:
			resultado_aux = resultado_s;
	
		default: resultado_aux = 32'd0;
	endcase
	end
	
	
	always_comb begin
		
		if (aluControl == 2'b00) begin
			cout_aux = cout_aux_s;
			neg_aux = neg_aux_s;
			zero_aux = zero_aux_s;
			overflow_aux = overflow_aux_s;
			
		end else if (aluControl == 2'b01) begin
			cout_aux = cout_aux_r;
			neg_aux = neg_aux_r;
			zero_aux = zero_aux_r;
			overflow_aux = overflow_aux_r;
			
		end else begin
			cout_aux = 0;
			neg_aux = 0;
			zero_aux = 0;
			overflow_aux = 0;
			
		end
		
	end
	
	
	assign resultado = resultado_aux;
	assign cout = cout_aux;
	assign neg = neg_aux;
	assign zero = zero_aux;
	assign overflow = overflow_aux;
	
	
endmodule 


//N_bit_adder



module arith_alu(input1, input2, option, answer, cout, neg, zero, overflow, shiftR);
	parameter N=32;
	
	input [N-1:0] input1, input2;
	input option;
	output [N-1:0] answer;
	output [N-1:0] shiftR;
	output cout, neg, zero, overflow;
	

	reg neg_a = 0;
	reg cout_a = 0;
	reg neg_b = 0;
	reg cout_b = 0;
	reg zero_a = 0;
	reg over_a = 0;
	
	
	reg eq, gr, sm;
	reg eq1, gr1, sm1;
	
	reg [N-1:0] answers;
	reg [N-1:0] answerr;
	reg [N-1:0] answerp;
	
	n_bit_adder U0(.input1(input1), .input2(input2), .answer(answers), .cout(cout_b));
	n_bit_substractor U1(.input1(input1), .input2(input2), .answer(answerr), .neg(neg_b));
	
	always @* begin
	if (option == 0) begin
		answerp = answers;
		cout_a = cout_b;
	end else if (option == 1) begin
		answerp = answerr;
		neg_a = neg_b;
	end
	end
	
	resultado U2(.answerp(answerp), .cout(cout_a), .zero_a(zero_a), .over_a(over_a));
	
	
	shiftR_arith U3(.a(input1), .b(input2), .r_shiftR_gate(shiftR));
	
	assign answer = answerp;
	assign cout = cout_a;
	assign neg = neg_a;
	assign zero = zero_a;
	assign overflow = over_a;
	
endmodule



module resultado(answerp, cout,zero_a, over_a);
	parameter N=32;
	input [N-1:0] answerp;
	input cout;
	output zero_a, over_a;
	reg zero_b = 0;
	reg over_b = 0;
	
	reg[N-1:0] zero_comp = 32'd0;
	reg[N-1:0] overflow_comp = 32'd4294967295;
	reg eq, gr, sm;
	reg eq1, gr1, sm1;
	
	n_bit_compare U2(.a(answerp), .b(zero_comp), .equal(eq), .greater(gr), .smaller(sm));
	n_bit_compare U3(.a(overflow_comp), .b(answerp), .equal(eq1), .greater(gr1), .smaller(sm1));
	
	always @* begin
	if (cout == 0) begin
		zero_b = eq;
		over_b = 0;
	end else begin
		zero_b = 0;
		over_b = eq1;
	end
	end
	
	assign zero_a = zero_b;
	assign over_a = over_b;

endmodule 


module n_bit_substractor(input1, input2, answer, neg);
	parameter N=32;
	input [N-1:0] input1,input2;
   output [N-1:0] answer;
	output neg;
	wire cout;
	reg  neg_assign;
	wire equal, greater, smaller;
	wire eq, gr, sm;
	reg [N-1:0] input1_sub, input2_sub;
	logic cin = 1;
	
	
	
	n_bit_compare U0(.a(input1), .b(input2), .equal(equal), .greater(greater), .smaller(smaller));
	assign eq = equal;
	assign gr = greater;
	assign sm = smaller;
	always @* begin
	if (sm==1) begin
		input1_sub = input2;
		input2_sub = ~(input1);
		neg_assign = 1;
		
	end else begin
		input1_sub = input1;
		input2_sub = ~(input2);
		neg_assign = 0;
	end
	end
	assign neg = neg_assign;
	n_bit_adder_sub U1(.input1(input1_sub),.input2(input2_sub), .cin(cin), .answer(answer), .cout(cout));
	

endmodule

module n_bit_adder(input1, input2, answer, cout);
	parameter N=32;
	input [N-1:0] input1,input2;
   output [N-1:0] answer;
	output cout;
	logic cin = 0;
	n_bit_adder_sub U0(.input1(input1),.input2(input2), .cin(cin), .answer(answer), .cout(cout));
	

endmodule

module n_bit_adder_sub(input1,input2, cin, answer, cout);
	parameter N=32;
	input [N-1:0] input1,input2;
	input cin;
   output [N-1:0] answer;
	output cout;
   wire  carry_out;
   wire [N-1:0] carry;
   genvar i;
   generate 
		for(i=0;i<N;i=i+1)
			begin: generate_N_bit_Adder
				if(i==0) 
					full_adder f(input1[0],input2[0],cin,answer[0],carry[0]);
				else
					full_adder f(input1[i],input2[i],carry[i-1],answer[i],carry[i]);
			end
		assign carry_out = carry[N-1];
		assign cout = carry_out;
   endgenerate
endmodule 





module full_adder(x,y,c_in,s,c_out);
   input x,y,c_in;
   output s,c_out;
	assign s = (x^y) ^ c_in;
	assign c_out = (y&c_in)| (x&y) | (x&c_in);
endmodule // full_adder



module n_bit_compare(a,b,equal,greater, smaller);
	
	parameter N=32;
	input [N-1:0] a, b;
	output equal, greater, smaller;
	
	
	assign equal = (a==b);
	assign greater = (a>b);
	assign smaller = (a<b);
	

endmodule


 

module bit_compare(a, b, equal, greater, smaller);
	input a, b;
	output equal, greater, smaller;
	assign equal = ~(a ^ b);
	assign greater = (~b)&a;
	assign smaller = (~a)&b;
	

endmodule


module shiftR_arith#(parameter N=32)(input [N-1:0] a, b, output [N-1:0] r_shiftR_gate);
    genvar i;
    assign r_shiftR_gate[N-1] = a[N-1];
    generate
    for (i = 0; i < N - 1; i = i + 1) begin: nbit_shiftR
            //shift sh(a[N-1-i], r_shiftR_gate[N-2-i]);
            assign r_shiftR_gate[N-2-i] = a[N-1-i];
     end
  endgenerate 
endmodule



module shift_a#(parameter N=32)(input logic a_i, output logic sh_i);
    assign sh_i = a_i;
endmodule



module AluDecoder(input logic aluOp, func0, input logic [3:0] func41, output logic [1:0] aluControl, flagW);

	assign aluControl[1] = (aluOp == 1'b1)&((func41 == 4'b0000)|(func41 == 4'b1100));
	assign aluControl[0] = (aluOp == 1'b1)&((func41 == 4'b0010)|(func41 == 4'b1100)|func41 == 4'b1010);
	assign flagW[1] = (func0 == 1'b1);
	assign flagW[0] = ((aluOp == 1'b1)&(func41 == 4'b0100)&(func0 == 1'b1))|
						((aluOp == 1'b1)&(func41 == 4'b0010)&(func0 == 1'b1));

endmodule

module logic_alu#(parameter N=32)(input [N-1:0] a, b, 
											output [N-1:0] r_and, r_or, r_xor, r_shiftR, r_shiftL, r_not);
	
	and_gate u1(a, b, r_and);
	or_gate u2(a, b, r_or);
	xor_gate u3(a, b, r_xor);
	shiftR_gate u4(a, b, r_shiftR);
	shiftL_gate u5(a, b, r_shiftL);
	not_gate u6(a, b, r_not);
endmodule

module and_gate#(parameter N=32)(input [N-1:0] a, b, output [N-1:0] r_and_gate);
  genvar i;
  generate
    for (i = 0; i < N; i = i + 1) begin: nbit_and
      and t(r_and_gate[i], a[i], b[i]);
    end
  endgenerate 
endmodule




module or_gate#(parameter N=32)(input [N-1:0] a, b, output [N-1:0] r_or_gate);
	genvar i;
   generate
    for (i = 0; i < N; i = i + 1) begin: nbit_or
      or t(r_or_gate[i], a[i], b[i]);
    end
  endgenerate 
endmodule

module xor_gate#(parameter N=32)(input [N-1:0] a, b, output [N-1:0] r_xor_gate);
	genvar i;
	generate
    for (i = 0; i < N; i = i + 1) begin: nbit_xor
      or t(r_xor_gate[i], a[i], b[i]);
    end
  endgenerate 
endmodule

module not_gate#(parameter N=32)(input [N-1:0] a, b, output [N-1:0] r_not_gate);
    genvar i;
   generate
    for (i = 0; i < N; i = i + 1) begin: nbit_not
      not t(r_not_gate[i], a[i]);
    end
  endgenerate 
endmodule

module shiftR_gate#(parameter N=32)(input [N-1:0] a, b, output [N-1:0] r_shiftR_gate);
	genvar i;
	assign r_shiftR_gate[N-1] = 0;
	generate
    for (i = 0; i < N - 1; i = i + 1) begin: nbit_shiftR
			assign r_shiftR_gate[N-2-i] = a[N-1-i];    
	 end
  endgenerate 
endmodule

module shiftL_gate#(parameter N=32)(input [N-1:0] a, b, output [N-1:0] r_shiftL_gate);
		genvar i;
		assign r_shiftL_gate[0] = 0;
		generate
		for (i = 1; i < N; i = i + 1) begin: nbit_shiftL
			assign r_shiftL_gate[i] = a[i-1];
		end
		endgenerate 
endmodule