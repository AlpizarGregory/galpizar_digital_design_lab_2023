module divider_tb;

  parameter N = 32;

  logic [N-1:0] numerator;
  logic [N-1:0] denominator;
  logic [N-1:0] quotient;
  logic [N-1:0] remainder;

  divider #(N) divisor (
    .numerator(numerator),
    .denominator(denominator),
    .quotient(quotient),
    .remainder(remainder)
  );

  initial begin
    numerator = 32'b0000001000011100;
    denominator = 32'b0000000000000110;

    #10;

    // Imprimimos los valores iniciales
    $display("Numerador = %b", numerator);
    $display("Denominador = %b", denominator);

    #10;

    $display("Cociente = %b", quotient);
    $display("Resto = %b", remainder);
  end

endmodule
