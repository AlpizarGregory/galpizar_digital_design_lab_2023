module divider_tb;

  parameter N = 4;

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
    numerator = 4'b1011;
    denominator = 4'b0011;

    #10;

    // Imprimimos los valores iniciales
    $display("Numerador = %b", numerator);
    $display("Denominador = %b", denominator);

    #10;

    $display("Cociente = %b", quotient);
    $display("Resto = %b", remainder);
  end

endmodule
