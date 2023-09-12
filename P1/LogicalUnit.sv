module LogicalUnit #(parameter Nbit = 8)(
  input logic [Nbit-1:0] A,
  input logic [Nbit-1:0] B,
  input logic [2:0] operation, 
  output logic [Nbit-1:0] result,
  output logic N, // Bandera Negativo
  output logic Z, // Bandera Cero
  output logic C, // Bandera Acarreo
  output logic V // Bandera Desbordamiento
);
	logic [Nbit-1:0] and_result;
   logic and_N, and_Z, and_C, and_V;

	logic [Nbit-1:0] or_result;
   logic or_N, or_Z, or_C, or_V;

	logic [Nbit-1:0] xor_result;
   logic xor_N, xor_Z, xor_C, xor_V;
	
	logic [Nbit-1:0] sl_result;
   logic sl_N, sl_Z, sl_C, sl_V;
	
	logic [Nbit-1:0] sr_result;
   logic sr_N, sr_Z, sr_C, sr_V;

	XorGate XorGateInstance [Nbit-1:0](
		 .a(A),
		 .b(B),
		 .y(xor_result)
		 /*
		 .N(N),
		 .Z(Z),
		 .C(C),
		 .V(V)*/
	  );
	  
	shift_left #(Nbit) shift_leftInstance(
		 .data_in(A),
		 .shift_count(B),
		 .V(slV),
		 .data_out(sl_result)
		 /*
		 .N(N),
		 .Z(Z),
		 .C(C),
		 .V(V)*/
	  );
	
	shift_right #(Nbit) shift_rightInstance(
		 .data_in(A),
		 .shift_count(B),
		 .V(srV),
		 .data_out(sr_result)
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
      3'b000: // AND
        
      3'b001: // OR
        
		*/  
      3'b010: begin// XOR
		  result = xor_result;
        N = 0;
        Z = 0;
        C = 0;
        V = 0;
        end
		  
		  
      3'b011: begin// Shift Left
		  result = sl_result;
        N = 0;
        Z = 0;
        C = 0;
        V = slV;
        end
		
		
		3'b100: begin// Shift Right
		  result = sr_result;
        N = 0;
        Z = 0;
        C = 0;
        V = srV;
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
