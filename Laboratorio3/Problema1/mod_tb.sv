module mod_tb;
	
	parameter N = 2;

  logic [N-1:0] a;
  logic [N-1:0] b;
  logic [N-1:0] mod_out;

  mod #(N) mod_inst (
    .a(a),
    .b(b),
    .mod_out(mod_out)
  );

  initial begin
    a = 16'b01; 
    b = 16'b01; 

    #10;

    // Imprimimos los valores iniciales
    $display("Numerador = %b", a);
    $display("Denominador = %b", b);

	 
    #10;

    $display("Modulo = %b", mod_out);
  end
endmodule