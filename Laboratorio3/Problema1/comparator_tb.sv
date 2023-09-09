module comparator_tb;

    logic [3:0] a, b;
    
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
    /*

  // Definir señales de entrada y salida
  reg [3:0] a;
  reg [3:0] b;
  wire aeqb;
  wire altb;
  wire agtb;

    // Instanciar el módulo del comparador
  comparator uut (
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

    // Realizar pruebas con diferentes combinaciones de entrada
    a = 4'b0000; b = 4'b0000; #10;
    a = 4'b0010; b = 4'b0001; #10;
    a = 4'b1100; b = 4'b1111; #10;
    a = 4'b1000; b = 4'b1000; #10;
    a = 4'b0101; b = 4'b1010; #10;

    $display("Simulation finished");

  end*/

endmodule