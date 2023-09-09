module mod_tb;
  logic [3:0] a;
  logic [3:0] b;
  logic [3:0] mod_out;

  mod mod_inst (
    .a(a),
    .b(b),
    .mod_out(mod_out)
  );

  initial begin
    a = 4'b1101; 
    b = 4'b0110; 

    #10;

    // Imprimimos los valores iniciales
    $display("Numerador = %b", a);
    $display("Denominador = %b", b);

	 
    #10;
    $display("Módulo = %b", mod_out);
  end
endmodule