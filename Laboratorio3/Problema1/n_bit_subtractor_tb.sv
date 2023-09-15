module n_bit_subtractor_tb;

	localparam N = 32;
	
	logic [N-1:0] a, b;
	
	logic [N-1:0] res;
	logic negout;
	logic doit;
	
	logic negpos;
	
	n_bit_subtractor sub_inst(
		.a(a),
		.b(b),
		.doit(doit),
		.res(res),
		.negout(negout)
	);
	
	initial begin
    $display("Testing %d-bit Subtractor", N);
    a = 32'b00000000001110100010001011010000; // Puedes cambiar estos valores
    b = 32'b00000000001100000011000011101101; // para realizar diferentes pruebas
	 doit = 1'b1;

    // Realizar sumas con diferentes valores de entrada
    repeat (8) begin
      #10;
      $display("a = %d, b = %d, doit = %d, res = %d, negout = %d", a, b, doit, res, negout);
      a = a + 1'b1;
      b = b + 1'b1;
	   doit = doit + 1'b1;
		
    end
  end
 
endmodule