module ALU_tb();

	logic [3:0] A;
   logic [3:0] B;
   logic [3:0] operation; // Código de operación (por ejemplo, 000 para suma, 001 para resta, etc.)
   logic [3:0] result;
   logic N; // Bandera Negativo
   logic Z; // Bandera Cero
   logic C; // Bandera Acarreo
   logic V; // Bandera Desbordamiento
	logic [6:0] seg;
	
	ALU #(4) InstanceALU(A, B , operation, result, N,Z,C,V, seg);

	
	//always #20 clk = ~clk;
	initial begin
	  //Prueba resta   resultado esperado = 1001
	A = 4'b1110;
	B = 4'b0101;
	operation = 4'b1001;
	/*
	A = 4'b0011;
	B = 4'b0011;
	operation = 4'b0011;
	
	A = 4'b0010;
	B = 4'b1011;
	operation = 4'b0010;
`	*/


	#30;

	end

endmodule