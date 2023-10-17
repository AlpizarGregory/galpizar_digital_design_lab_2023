module Buscaminas_TB;

  // Parámetros de simulación
  logic clk;
  logic rst;
  logic [5:0] bombs;  // Entrada de interruptores para configurar el número de bombas
  logic move, select, mark; // Entrada de botones para selección de casillas y marcar como posible bomba
  logic [1:0] course;
  logic str;
  logic [8:0] board_out [0:7][0:7];
  logic [3:0] boardColors [0:7][0:7];

  // Instancia del módulo Buscaminas
  Buscaminas buscaminas (
    .clk(clk),
    .rst(rst),
    .bombs(bombs),
    .move(move),
    .select(select),
    .mark(mark),
    .course(course),
	 .str(str),
    //.board_out(board_out),
	 //.boardColors(boardColors)
  );

  // Testbench
  initial begin
    // Inicialización de entradas
	 rst = 0;
	 clk = 0;
	 bombs = 6'b001000;
	 # 50
	 rst = 1;
	 #50
	 rst = 0;
	 clk = 1;
    #50;
	 str = 1;
	 clk = 0;
	 #50;
	 clk = 1;
	 move = 1;
	 course = 00;
	 #50;
	 move = 0;
	 clk = 0;
	 #50;
	 clk = 1;
	 move = 1;
	 course = 01;
	 #50;
	 move = 0;
	 clk = 0;
	 #50;
	 clk = 1;
	 select = 1;
	 #50;
	 clk = 0;
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