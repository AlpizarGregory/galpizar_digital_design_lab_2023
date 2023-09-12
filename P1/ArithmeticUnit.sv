module ArithmeticUnit #(parameter Nbit = 8)(
  input logic [Nbit-1:0] A,
  input logic [Nbit-1:0] B,
  input logic [2:0] operation, 
  output logic [Nbit-1:0] result,
  output logic N, // Bandera Negativo
  output logic Z, // Bandera Cero
  output logic C, // Bandera Acarreo
  output logic V // Bandera Desbordamiento
);

  logic [Nbit-1:0] sum_result;
  logic sum_N, sum_Z, sum_C, sum_V;
  
  logic [Nbit-1:0] rest_result;
  logic rest_N, rest_Z, rest_C, rest_V;
  
  logic [Nbit-1:0] mult_result;
  logic mult_N, mult_Z, mult_C, mult_V;
  
  logic [Nbit-1:0] div_result;
  logic [Nbit-1:0] div_remainder;
  logic div_N, div_Z, div_C, div_V;
  
  logic [Nbit-1:0] mod_result;
  logic mod_N, mod_Z, mod_C, mod_V;
	
	
	n_bit_adder #(Nbit) n_bit_adderInstance (
		 .a(A),
		 .b(B),
		 .cin(0),
		 .sum(sum_result),
		 .cout(sum_C)
		 /*
		 .Z(Z),
		 .C(C),
		 .V(V)*/
	  );
	  
	n_bit_subtractor #(Nbit) n_bit_subtractorInstance (
		 .a(A),
		 .b(B),
		 .doit(1),
		 .res(rest_result),
		 .negout(rest_N)
		 /*
		 .Z(Z),
		 .C(C),
		 .V(V)*/
	  );  
	  
	NbitMultiplier #(Nbit) NbitMultiplierInstance (
		 .a(A),
		 .b(B),
		 .result_negative(mult_N),
		 .result(mult_result)
		 /*
		 .Z(Z),
		 .C(C),
		 .V(V)*/
	  );
	  
	 divider #(Nbit) dividerInstance (
		 .numerator(A),
		 .denominator(B),
		 .quotient(div_result),
		 .remainder(div_remainder)
		 /*
		 .Z(Z),
		 .C(C),
		 .V(V)*/
	  );
	  
	 mod #(Nbit) modInstance (
		 .a(A),
		 .b(B),
		 .mod_out(mod_result)
		 /*
		 .Z(Z),
		 .C(C),
		 .V(V)*/
	  );


// Lógica para seleccionar la operación basada en 'operation'
  always_comb begin
    case (operation)
	 
      3'b000: begin// Suma
		  result = sum_result;
        N = 0;
        Z = 0;
        C = sum_C;
        V = 0;
        end
        
      3'b001: begin// Resta
		  result = rest_result;
        N = rest_N;
        Z = 0;
        C = 0;
        V = 0;
        end
      
		  
      3'b010: begin// Multiplicación
		  result = mult_result;
        N = mult_N;
        Z = 0;
        C = 0;
        V = 0;
        end
		  
		 
      3'b011: begin// División
		  result = div_result;
        N = 0;
        Z = 0;
        C = 0;
        V = 0;
        end
         
		3'b101: begin// Modulo
		  result = mod_result;
        N = 0;
        Z = 0;
        C = 0;
        V = 0;
        end
        
		 
      default: begin// Caso por defecto si la operación no se reconoce
        
        result = '0;
        N = 1'b0;
        Z = 1'b0;
        C = 1'b0;
        V = 1'b0;
		  end
    endcase
  end

  // Lógica de la operación lógica aquí
  // ...
endmodule