module ALU #(parameter Nbit = 8)(
  input logic [Nbit-1:0] A,
  input logic [Nbit-1:0] B,
  input logic [3:0] operation,
  output logic [Nbit-1:0] result,
  output logic N,
  output logic Z,
  output logic C,
  output logic V
);

  
  logic [Nbit-1:0] arith_result;
  logic arith_N, arith_Z, arith_C, arith_V;
  logic [Nbit-1:0] logic_result;
  logic logic_N, logic_Z, logic_C, logic_V;

  
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


