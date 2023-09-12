module ALU #(parameter Nbit = 8)(
  input logic [Nbit-1:0] A,
  input logic [Nbit-1:0] B,
  input logic [3:0] operation,
  output logic [Nbit-1:0] result,
  output logic N,
  output logic Z,
  output logic C,
  output logic V,
  output logic [6:0] segOut
);

  
  logic [Nbit-1:0] arith_result;
  logic arith_N, arith_Z, arith_C, arith_V;
  logic [Nbit-1:0] logic_result;
  logic logic_N, logic_Z, logic_C, logic_V;
  logic [6:0] segOutA;

  
  ArithmeticUnit #(Nbit) arith_unit (
    .A(A),
    .B(B),
    .operation(operation[2:0]),
    .result(arith_result),
    .N(arith_N),
    .Z(arith_Z),
    .C(arith_C),
    .V(arith_V)
  );

  
  LogicalUnit #(Nbit) logic_unit (
    .A(A),
    .B(B),
    .operation(operation[2:0]),
    .result(logic_result),
    .N(logic_N),
    .Z(logic_Z),
    .C(logic_C),
    .V(logic_V)
  );
  
  // Conectar la salida de la ALU al módulo del display de 7 segmentos
  Display7Segment display_instance (
    .binary_input(result), 
    .seg(segOut)
  );

  // Lógica para seleccionar la operación basada en 'operation'
  always_comb begin
    case (operation[3])
	   1'b0: begin
        result = arith_result;
        N = arith_N;
        Z = arith_Z;
        C = arith_C;
        V = arith_V;
      end
	   1'b1: begin
        result = logic_result;
        N = logic_N;
        Z = logic_Z;
        C = logic_C;
        V = logic_V;
      end
      default: begin
        
        result = '0;
        N = 1'b0;
        Z = 1'b0;
        C = 1'b0;
        V = 1'b0;
      end
    endcase
  end

endmodule

module Display7Segment(
  input logic [3:0] binary_input, // Entrada binaria
  output logic [6:0] seg    // Salidas para los segmentos 'a' hasta 'g'
);

  // Lógica para convertir la entrada binaria a la representación de 7 segmentos
  always_comb begin
    case (binary_input)
	 //	7 segment display (HEX)
		4'b0000: seg = 7'b0000001;
		4'b0001: seg = 7'b1001111;
		4'b0010: seg = 7'b0010010;
		4'b0011: seg = 7'b0000110;
		4'b0100: seg = 7'b1001100;
		4'b0101: seg = 7'b0100100;
		4'b0110: seg = 7'b0100000;
		4'b0111: seg = 7'b0001111;
		4'b1000: seg = 7'b0000000;
		4'b1001: seg = 7'b0000100;
		4'b1010: seg = 7'b0001000;
		4'b1011: seg = 7'b1100000;
		4'b1100: seg = 7'b0110001;
		4'b1101: seg = 7'b1000010;
		4'b1110: seg = 7'b0110000;
		4'b1111: seg = 7'b0111000;
		default: seg = 7'b1111111;
    endcase
  end

endmodule


