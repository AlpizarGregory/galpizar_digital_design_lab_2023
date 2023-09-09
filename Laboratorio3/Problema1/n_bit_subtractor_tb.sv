module n_bit_subtractor_tb;
	
	logic [3:0] a, b;
	
	logic [3:0] res;
	logic negout;
	
	logic negpos;
	
	n_bit_subtractor sub_inst(
		.a(a),
		.b(b),
		.aorb(1'b1),
		.doit(1'b1),
		.res(res),
		.negout(negout)
	);
	
	initial begin
    $display("Testing %d-bit Subtractor", N);
    a = 4'b1100; // Puedes cambiar estos valores
    b = 4'b1010; // para realizar diferentes pruebas

    // Realizar sumas con diferentes valores de entrada
    repeat (16) begin
      #10;
      $display("a = %b, b = %b, res = %b, negout = %b", a, b, res, negout);
      a = a + 1'b1;
      b = b + 1'b1;
		
    end
  end
 
endmodule