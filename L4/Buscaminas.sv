module Buscaminas(
  input logic clk,       // Señal de reloj
  input logic rst,       // Señal de reinicio
  input logic [7:0] bombs,  // Entrada de interruptores para configurar el número de bombas
  input logic move, select, mark, // Entrada de botones para selección de casillas y marcar como posible bomba
  input logic [1:0] course,
  input logic str,
  output logic [7:0] board_out [0:7][0:7]
  
  /*
  output logic [7:0] led, // Salida para mostrar el estado del juego en LEDs
  output logic [7:0] [7:0] vga_pixel, // Salida para la pantalla VGA
  output logic vga_clk, // Salida para la señal de reloj de VGA
  output logic vga_hsync, // Salida para la señal de sincronización horizontal de VGA
  output logic vga_vsync  // Salida para la señal de sincronización vertical de VGA*/
);

  // Matriz bidimensional para representar el tablero (8x8)
  logic [7:0] board [0:7][0:7];
	/*
  // Estado de la máquina de estados finitos
  typedef enum logic [2:0] {
    CONFIGURE,  // Estado de configuración
    WAITING,       // Estado de juego
    WIN,        // Estado de victoria
    LOSE        // Estado de derrota
  } GameState;*/

  logic [2:0] state;      // Estado actual
  logic [2:0] next_state; // Siguiente estado
  logic start = 0;

  // Otras variables auxiliares
  int i, j;

  RandomBombs #(8) RandomBombs_MainInstance (
    .rst(rst),
	 .bomb_count(8),
    .board_in(board),
    .board_out(board),
	 .start(start)
  );

  // Inicialización del tablero con casillas vacías
  initial begin
    for (i = 0; i < 8; i = i + 1) begin
      for (j = 0; j < 8; j = j + 1) begin
        board[i][j] = 8'b00000000; // Asigna el valor 0 (casilla vacía) a cada elemento
      end
    end
  end  

  // Actual state logic
  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      state = 3'b000;
    end else begin
      state <= next_state;
    end
  end
  
  //next state logic
  always_comb begin
    case(state)
		3'b000: if (str) next_state = 3'b001; else next_state = 3'b000; 
		3'b001: if (str) next_state = 3'b001; else next_state = 1'b001;
		default: next_state = 3'b001;
	 endcase
  end
  
  assign board_out = board;

endmodule

