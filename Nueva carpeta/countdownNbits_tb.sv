module countdownNbits_tb();
	//Testbench de auto-chequeo (self-checking) para el contador. 
	//Muestrar el resultado del testbench para 2, 4 y 6 bits.
	logic clk, reset; 
	//logic [1:0] first;
	//logic [1:0] current;
	logic [3:0] first;
	logic [3:0] current;
	//logic [5:0] first;
	//logic [5:0] current;
	
	countdownNbits #(4) modulo(clk, reset, first, current);
	//
	//
	
	//always #20 clk = ~clk;
	initial begin
	clk = 0;
	reset = 0;
	
	// 2 bit Test
	/*
	#20 first = 2'b11;
	
	clk = 1;
	#20 reset = 1;
	clk = 0;
	#20 reset = 0;
	clk = 1;
	assert (current === first) else $error("El estado actual no es el primero.");
	#20 clk = 0;
	assert (current === 2'b10) else $error("El estado en 80ps no corresponde a 10");
	#20 clk = 1;
	#20 clk = 0;
	assert (current === 2'b01) else $error("El estado en 120ps no corresponde a 01");
	#20 clk = 1;
	assert (current === first-2'b10) else $error("El estado en 140ps no corresponde a 11-10");
	#20 clk = 0;
	#20 clk = 1;
	#20 clk = 0;
	#20 clk = 1;
	#20 reset = 1;
	clk = 0;
	#20 reset = 0;
	clk = 1;
	*/
	
	// 4 bit Test
	
	#20 first = 4'b1111;
	
	clk = 1;
	#20 reset = 1;
	clk = 0;
	#20 reset = 0;
	clk = 1;
	assert (current === first) else $error("El estado actual no es el primero.");
	#20 clk = 0;
	assert (current === 4'b1110) else $error("El estado en 80ps no corresponde a 1110.");
	#20 clk = 1;
	#20 clk = 0;
	assert (current === 4'b1101) else $error("El estado en 120ps no corresponde a 1101.");
	#20 clk = 1;
	assert (current === first-2'b0010) else $error("El estado en 140ps no corresponde a 1111-0010.");
	#20 clk = 0;
	#20 clk = 1;
	#20 clk = 0;
	#20 clk = 1;
	#20 reset = 1;
	clk = 0;
	#20 reset = 0;
	clk = 1;
	
	
	// 6 bit Test
	/*
	#20 first = 6'b111111;
	
	clk = 1;
	#20 reset = 1;
	clk = 0;
	#20 reset = 0;
	clk = 1;
	assert (current === first) else $error("El estado actual no es el primero.");
	#20 clk = 0;
	assert (current === 6'b111110) else $error("El estado en 80ps no corresponde a 111110.");
	#20 clk = 1;
	#20 clk = 0;
	assert (current === 6'b111101) else $error("El estado en 120ps no corresponde a 111101.");
	#20 clk = 1;
	assert (current === first-2'b000010) else $error("El estado en 140ps no corresponde a 111111-000010.");
	#20 clk = 0;
	#20 clk = 1;
	#20 clk = 0;
	#20 clk = 1;
	#20 reset = 1;
	clk = 0;
	#20 reset = 0;
	clk = 1;
	*/
	
	
	//#400 reset = 1;
	//#20 reset = 0;
	//assert (current === first-2'b10) else $error("002 failed.");

	end

endmodule