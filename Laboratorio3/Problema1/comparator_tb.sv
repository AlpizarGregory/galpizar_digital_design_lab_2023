module comparator_tb;

    /*logic [3:0] a, b;
    
    logic aeqb, agtb, altb;

    comparator comp_inst(
        .a(a),
        .b(b),
        .aeqb(aeqb),
        .agtb(agtb),
        .altb(altb)
    );

    initial begin
        $display("Testing comparator");
        a = 4'b0000;
        b = 4'b0000;
        aeqb = 1'b1;
        altb = 1'b0;
        agtb = 1'b0;

        repeat (34) begin
            #10;
            $display("a = %b, b = %b, aeqb = %b, altb = %b, agtb = %b", a, b, aeqb, altb, agtb);
            a = a + 1'b1;
            b = b + 2'b10;
            aeqb = 1'b1;
            altb = 1'b0;
            agtb = 1'b0;

        end

    end
    */

    parameter N = 32;

  // Definir señales de entrada y salida
  reg [N-1:0] a;
  reg [N-1:0] b;
  wire aeqb;
  wire altb;
  wire agtb;

    // Instanciar el módulo del comparador
  comparator #(N) uut (
    .a(a),
    .b(b),
    .aeqb(aeqb),
    .altb(altb),
    .agtb(agtb)
  );



  // Simulación
  initial begin
    $display("Simulation started");
    $monitor("a = %b, b = %b, aeqb = %b, altb = %b, agtb = %b", a, b, aeqb, altb, agtb);

    if (N == 2) begin

      // Realizar pruebas con diferentes combinaciones de entrada
      a = 2'b00; b = 2'b00; #10;
      a = 2'b01; b = 2'b00; #10;
      a = 2'b10; b = 2'b11; #10;
      a = 2'b11; b = 2'b11; #10;
      a = 2'b01; b = 2'b10; #10;
    end else if (N == 4) begin

      // Realizar pruebas con diferentes combinaciones de entrada
      a = 4'b0000; b = 4'b0000; #10;
      a = 4'b0010; b = 4'b0001; #10;
      a = 4'b1100; b = 4'b1111; #10;
      a = 4'b1000; b = 4'b1000; #10;
      a = 4'b0101; b = 4'b1010; #10;
    end else if (N == 8) begin

      // Realizar pruebas con diferentes combinaciones de entrada
      a = 8'b00000000; b = 8'b00000000; #10;
      a = 8'b00100000; b = 8'b00010000; #10;
      a = 8'b11000000; b = 8'b11110000; #10;
      a = 8'b10000000; b = 8'b10000000; #10;
      a = 8'b01010000; b = 8'b10100000; #10;
    end else if (N == 16) begin

      // Realizar pruebas con diferentes combinaciones de entrada
      a = 16'b0000000000000000; b = 16'b0000000000000000; #10;
      a = 16'b0010000000000000; b = 16'b0001000000000000; #10;
      a = 16'b1100000000000000; b = 16'b1111000000000000; #10;
      a = 16'b1000000000000000; b = 16'b1000000000000000; #10;
      a = 16'b0101000000000000; b = 16'b1010000000000000; #10;
    end else if (N == 32) begin

      // Realizar pruebas con diferentes combinaciones de entrada
      a = 32'b00000000000000000000000000000000; b = 32'b00000000000000000000000000000000; #10;
      a = 32'b00100000000000000000000000000000; b = 32'b00010000000000000000000000000000; #10;
      a = 32'b11000000000000000000000000000000; b = 32'b11110000000000000000000000000000; #10;
      a = 32'b10000000000000000000000000000000; b = 32'b10000000000000000000000000000000; #10;
      a = 32'b01010000000000000000000000000000; b = 32'b10100000000000000000000000000000; #10;
    
    end


    $display("Simulation finished");

  end

endmodule