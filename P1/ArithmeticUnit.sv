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
  logic div_N, div_Z, div_C, div_V;
  
  logic [Nbit-1:0] mod_result;
  logic mod_N, mod_Z, mod_C, mod_V;

	NbitMultiplier #(Nbit) NbitMultiplierInstance (
		 .a(A),
		 .b(B),
		 .result_negative(mult_N),
		 .result(mult_result)
		 /*
		 .N(N),
		 .Z(Z),
		 .C(C),
		 .V(V)*/
	  );

// Lógica para seleccionar la operación basada en 'operation'
  always_comb begin
    case (operation)
	 /*
      3'b000: // Suma
        
      3'b001: // Resta
        
		*/  
      3'b010: begin// Multiplicación
		  result = mult_result;
        N = mult_N;
        Z = 0;
        C = 0;
        V = 0;
        end
		  
		/*  
      3'b011: // División
        
		3'b101: // Modulo
        
		*/  
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