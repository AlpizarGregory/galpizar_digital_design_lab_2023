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
  logic [Nbit-1:0] mult_result;
  logic mult_N, mult_Z, mult_C, mult_V;

	NbitMultiplier #(Nbit) NbitMultiplierInstance (
		 .a(A),
		 .b(B),
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
        N = 0;
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