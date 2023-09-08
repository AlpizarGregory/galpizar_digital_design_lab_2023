module conexion_tb();

	logic [5:0] a;
   logic [3:0] b;
   //logic carry_in;
	logic [5:0] result;
	//logic carry_out;
	
	shift_left_with_truncate #(6) InstanceConexion(a, b , result);

	
	//always #20 clk = ~clk;
	initial begin
	
	a = 101011; // Initialize 'a' with 4 bits (e.g., 100)
	b = 4'b0011; // Initialize 'b' with 4 bits (e.g., 101)

  // Add any other initialization or test cases here

	#30; // Delay before any other actions
	//#30 a = 100; b = 101;
	//#30 a = 0; b = 10101; carry_in = 0;
	//#30 a = 3'b111; b = 4'b000; carry_in = 0;

	end

endmodule