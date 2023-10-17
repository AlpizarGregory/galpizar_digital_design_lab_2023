module Buscaminas(
  input logic clk,       // Señal de reloj
  input logic rst,       // Señal de reinicio
  input logic [7:0] bombs,  // Entrada de interruptores para configurar el número de bombas
  input logic move, select, mark, // Entrada de botones para selección de casillas y marcar como posible bomba
  input logic [1:0] course,
  input logic str,
  output logic [8:0] board_out [0:7][0:7]
  
  /*
  output logic [7:0] led, // Salida para mostrar el estado del juego en LEDs
  output logic [7:0] [7:0] vga_pixel, // Salida para la pantalla VGA
  output logic vga_clk, // Salida para la señal de reloj de VGA
  output logic vga_hsync, // Salida para la señal de sincronización horizontal de VGA
  output logic vga_vsync  // Salida para la señal de sincronización vertical de VGA*/
);

  // Matriz bidimensional para representar el tablero (8x8)
  logic [8:0] board [0:7][0:7];
  logic [8:0] board2 [0:7][0:7];
  logic [8:0] boardSelection [0:7][0:7];
  logic [8:0] boardFlags [0:7][0:7];
	/*
  // Estado de la máquina de estados finitos
  typedef enum logic [2:0] {
    CONFIGURE,  // Estado de configuración
    WAITING,       // Estado de juego
    WIN,        // Estado de victoria
    LOSE        // Estado de derrota
  } GameState;*/
  logic randombombs_enable;  // Señal de habilitación para RandomBombs_MainInstance
  logic movement_enable;     // Señal de habilitación para Movement_MainInstance
  logic random_gen_done;     // Señal de control para indicar finalización de RandomBombs_MainInstance
  logic movement_done;       // Señal de control para indicar finalización de Movement_MainInstance


  logic [2:0] state;      // Estado actual
  logic [2:0] next_state; // Siguiente estado
  logic start = 0;
  logic lose = 0;
  logic win = 0;
  

  // Otras variables auxiliares
  int i, j, win_aux;

  RandomBombs #(8) RandomBombs_MainInstance (
    .rst(rst),
	 .bomb_count(bombs),
    .board_in(board),
    .board_out(board),
	 .start(start),
	 .random_gen_done(random_gen_done), // Señal de control para indicar finalización
    .enable(randombombs_enable) // Señal de habilitación para controlar la instancia
  );
  Movement Movement_instance (
    .flagMovement(move),
    .clk(clk),
    .rst(rst),
	 .direction(course),
    .board_in(board2),
    .board_out(board2),
	 .movement_done(movement_done),
	 .enable(move)
  );
  Selection Selection_instance (
    .rst(rst),
    .board_in(board2),
    .board_out(boardSelection),
	 .lose(lose),
	 .enable(select)
  );
  BombFlag BombFlag_instance (
    .rst(rst),
    .board_in(board2),
    .board_out(boardFlags),
	 .enable(mark)
  );
  

  // Inicialización del tablero con casillas vacías
  initial begin
    for (i = 0; i < 8; i = i + 1) begin
      for (j = 0; j < 8; j = j + 1) begin
        board[i][j] = 9'b000000000; // Asigna el valor 0 (casilla vacía) a cada elemento
        board2[i][j] = 9'b000000000;
		  boardSelection[i][j] = 9'b000000000;
		  boardFlags[i][j] = 9'b000000000;
		end
    end
  end  

  // Actual state logic
  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      state = 3'b000;
		randombombs_enable = 1;
		//board_out = board;
    end else begin
      state <= next_state;
		randombombs_enable = 0;
    end
  end
  
  //next state logic
  always_comb begin
    case(state)
		3'b000: if (str) next_state = 3'b001; else next_state = 3'b000;  //SETUP
		3'b001: if (move) next_state = 3'b010; else next_state = 3'b001; //wAIT
		3'b010: if (move) next_state = 3'b010; else next_state = 3'b001; //MOVE
		default: next_state = 3'b001;
	 endcase
  end
  
  
  
  always_comb begin
	  for (int i = 0; i < 8; i = i + 1) begin
		 for (int j = 0; j < 8; j = j + 1) begin
			board_out[i][j] = board[i][j] | board2[i][j] | boardSelection[i][j] | boardFlags[i][j]; // Perform OR operation element-wise
		 end
	  end
	  win_aux = 1;
	  for (int i = 0; i < 8; i = i + 1) begin : win_check_loop
	    for (int j = 0; j < 8; j = j + 1) begin
		   if (board_out[i][j][5] == 1) begin // La casilla contiene bomba
				if (board_out[i][j][6] == 0) begin // La casilla no esta marcada como posible bomba
					win_aux = 0;
					disable win_check_loop;
				end
			end else if (board_out[i][j][8] == 0) begin // Si no la casilla tampoco ha sido seleccionada
				win_aux = 0;
				disable win_check_loop;
			end
		 end
	  end
	  
	  if (win_aux == 1) begin
	    win = 1;
	  end
	  $display("Win:");
	  $display(win);
	end

endmodule

