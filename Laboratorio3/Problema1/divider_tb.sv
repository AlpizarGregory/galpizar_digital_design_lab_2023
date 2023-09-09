module divider_tb;

  logic [3:0] numerator;
  logic [3:0] denominator;
  logic [3:0] quotient;
  logic [3:0] remainder;

  divider divisor (
    .numerator(numerator),
    .denominator(denominator),
    .quotient(quotient),
    .remainder(remainder)
  );

  initial begin
    numerator = 4'b1101;     // Numerador: 13
    denominator = 4'b0110;   // Denominador: 6

    #10;

    // Imprimimos los valores iniciales
    $display("Numerador = %b", numerator);
    $display("Denominador = %b", denominator);

	 
    #10;

    $display("Cociente = %b", quotient);
    $display("Resto = %b", remainder);
  end

endmodule
