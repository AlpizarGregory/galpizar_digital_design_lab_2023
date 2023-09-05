module n_bit_subtractor_tb;

	localparam N = 4;
	
	logic [N-1:0] a, b;
	logic aorb;
	
	logic [N-1:0] res;
	logic negout;
	
	logic negpos;
	
	n_bit_subtractor #(.N(N)) sub_inst(
		.a(a),
		.b(b),
		.aorb(aorb),
		.res(res),
		.negout(negout)
	);
	
	initial begin
    $display("Testing %d-bit Subtractor", N);
    a = 4'b1100; // Puedes cambiar estos valores
    b = 4'b1010; // para realizar diferentes pruebas
    aorb = 1'b0;

    // Realizar sumas con diferentes valores de entrada
    repeat (16) begin
      #10;
      $display("a = %b, b = %b, aorb = %b, res = %b, negout = %b", a, b, aorb, res, negout);
      a = a + 1'b1;
      b = b + 1'b1;
		aorb = !aorb;
		
    end
  end
 
endmodule