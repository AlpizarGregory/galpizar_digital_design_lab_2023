module n_bit_subtractor_tb;

	localparam N = 16;
	
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
    a = 4'b1100; // Puedes cambiar estos valores
    b = 4'b1010; // para realizar diferentes pruebas
	doit = 1'b1;

    // Realizar sumas con diferentes valores de entrada
    repeat (8) begin
      #10;
      $display("a = %b, b = %b, doit = %b, res = %b, negout = %b", a, b, doit, res, negout);
      a = a + 1'b1;
      b = b + 1'b1;
	  doit = doit + 1'b1;
		
    end
  end
 
endmodule