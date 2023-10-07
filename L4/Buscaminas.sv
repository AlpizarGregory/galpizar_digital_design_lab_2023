module Buscaminas(
  input logic clk,       // Señal de reloj
  input logic rst,       // Señal de reinicio
  input logic [7:0] sw,  // Entrada de interruptores para configurar el número de bombas
  input logic [7:0] btn // Entrada de botones para selección de casillas y marcar como posible bomba
  /*
  output logic [7:0] led, // Salida para mostrar el estado del juego en LEDs
  output logic [7:0] [7:0] vga_pixel, // Salida para la pantalla VGA
  output logic vga_clk, // Salida para la señal de reloj de VGA
  output logic vga_hsync, // Salida para la señal de sincronización horizontal de VGA
  output logic vga_vsync  // Salida para la señal de sincronización vertical de VGA*/
);

  // Matriz bidimensional para representar el tablero (8x8)
  logic [7:0] board [0:7][0:7];

  // Variables y parámetros de juego
  localparam BOMB_COUNT_MIN = 1; // Mínimo número de bombas
  localparam BOMB_COUNT_MAX = 63; // Máximo número de bombas
  localparam BOARD_SIZE = 8;     // Tamaño del tablero (8x8)
  localparam BOMB_VALUE = 8'hF;  // Valor que representa una bomba en el tablero
  logic [7:0] bomb_count;        // Número de bombas en el tablero
  logic [7:0] marked_count;      // Número de casillas marcadas como posible bomba

  // Estado de la máquina de estados finitos
  typedef enum logic [1:0] {
    CONFIGURE,  // Estado de configuración
    PLAY,       // Estado de juego
    WIN,        // Estado de victoria
    LOSE        // Estado de derrota
  } GameState;

  logic [1:0] state;      // Estado actual
  logic [1:0] next_state; // Siguiente estado

  // Otras variables auxiliares
  logic [7:0] i, j;

  

  // Inicialización del tablero con casillas vacías
  initial begin
    for (i = 0; i < BOARD_SIZE; i = i + 1) begin
      for (j = 0; j < BOARD_SIZE; j = j + 1) begin
        board[i][j] = 8'h00; // Asigna el valor 0 (casilla vacía) a cada elemento
      end
    end
  end
  
  
  // Señal de habilitación para la generación de bombas
  logic generate_bombs;

  // ...


  // Actual state logic
  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      state <= CONFIGURE;
      bomb_count <= 8'h00;
      marked_count <= 8'h00;
    end else begin
      state <= next_state;
    end
  end

// Next state logic
  // Next state logic
	always_comb begin
		case(state)
			CONFIGURE: begin
				// ...
				if (board[0][0]) begin
					next_state = PLAY; // Transición al estado PLAY una vez configurado
				end else begin
					next_state = CONFIGURE; // Asegúrate de manejar todos los casos
				end
			end
			PLAY: begin
				// Otras transiciones y lógica en el estado PLAY
				next_state = CONFIGURE; // Ejemplo de transición de vuelta a CONFIGURE
			end
			default: next_state = CONFIGURE;
		endcase
	end




  // Implementa la lógica para generar el píxel VGA y las señales de sincronización VGA
  // (Debes implementar esta parte para mostrar el juego en pantalla VGA)

endmodule

