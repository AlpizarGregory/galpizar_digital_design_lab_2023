module n_bit_adder_tb;

  // Parámetro para definir el tamaño del sumador
  localparam int N = 4;

  // Señales de entrada
  logic [N-1:0] a, b;
  logic cin;

  // Señales de salida
  logic [N-1:0] sum;
  logic cout;

  // Instancia del sumador de N bits
  n_bit_adder #(.N(N)) adder_inst (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  // Generación de estímulos
  initial begin
    $display("Testing %d-bit Adder", N);
    a = 4'b1100; // Puedes cambiar estos valores
    b = 4'b1010; // para realizar diferentes pruebas
    cin = 1'b0;

    // Realizar sumas con diferentes valores de entrada
    repeat (16) begin
      #10;
      $display("a = %b, b = %b, cin = %b, sum = %b, cout = %b", a, b, cin, sum, cout);
      a = a + 1'b1;
      b = b + 1'b1;
    end
  end

endmodule