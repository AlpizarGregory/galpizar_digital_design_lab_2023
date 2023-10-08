module Buscaminas_TB;

  // Parámetros de simulación
  logic clk = 0;
  logic rst = 0;
  logic [7:0] sw = 8'h00;
  logic [7:0] btn = 8'h00;
  logic [7:0] led;
  logic [7:0] [7:0] vga_pixel;
  logic vga_clk;
  logic vga_hsync;
  logic vga_vsync;

  // Instancia del módulo Buscaminas
  Buscaminas buscaminas (
    .clk(clk),
    .rst(rst),
    .sw(sw),
    .btn(btn),
    .led(led),
    .vga_pixel(vga_pixel),
    .vga_clk(vga_clk),
    .vga_hsync(vga_hsync),
    .vga_vsync(vga_vsync)
  );

  // Generación de clock
  always #5 clk = ~clk;

  // Testbench
  initial begin
    // Inicialización de entradas
    rst = 1; // Activamos el reset
    sw = 8'h00;
    btn = 8'h00;
    #10 rst = 0; // Desactivamos el reset después de 10 unidades de tiempo

    // Esperamos un poco para asegurarnos de que el estado se haya configurado
    #20;

    // Imprimimos el tablero
    $display("Tablero Inicial:");
    for (int i = 0; i < 8; i = i + 1) begin
      for (int j = 0; j < 8; j = j + 1) begin
        $write("%2h ", buscaminas.board[i][j]);
      end
      $display("");
    end
  end

endmodule