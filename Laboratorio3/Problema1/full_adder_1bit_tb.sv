module full_adder_1bit_tb;

  // Señales de entrada
  logic a, b, cin;
  
  // Señales de salida
  logic sum, cout;

  // Instancia del full adder
  full_adder_1bit adder_inst (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
  );

  // Generación de estímulos
  initial begin
    $display("Testing Full Adder 1-bit");

    a = 1'b0;
    b = 1'b0;
    cin = 1'b0;
    #10;
    $display("a = %b, b = %b, cin = %b, sum = %b, cout = %b", a, b, cin, sum, cout);

    a = 1'b0;
    b = 1'b0;
    cin = 1'b1;
    #10;
    $display("a = %b, b = %b, cin = %b, sum = %b, cout = %b", a, b, cin, sum, cout);

    a = 1'b0;
    b = 1'b1;
    cin = 1'b0;
    #10;
    $display("a = %b, b = %b, cin = %b, sum = %b, cout = %b", a, b, cin, sum, cout);

    a = 1'b0;
    b = 1'b1;
    cin = 1'b1;
    #10;
    $display("a = %b, b = %b, cin = %b, sum = %b, cout = %b", a, b, cin, sum, cout);

    a = 1'b1;
    b = 1'b0;
    cin = 1'b0;
    #10;
    $display("a = %b, b = %b, cin = %b, sum = %b, cout = %b", a, b, cin, sum, cout);

    a = 1'b1;
    b = 1'b0;
    cin = 1'b1;
    #10;
    $display("a = %b, b = %b, cin = %b, sum = %b, cout = %b", a, b, cin, sum, cout);

    a = 1'b1;
    b = 1'b1;
    cin = 1'b0;
    #10;
    $display("a = %b, b = %b, cin = %b, sum = %b, cout = %b", a, b, cin, sum, cout);

    a = 1'b1;
    b = 1'b1;
    cin = 1'b1;
    #10;
    $display("a = %b, b = %b, cin = %b, sum = %b, cout = %b", a, b, cin, sum, cout);

  end

endmodule
