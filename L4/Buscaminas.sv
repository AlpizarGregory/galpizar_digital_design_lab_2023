module Buscaminas(
  input logic clk,       // Señal de reloj
  input logic rst,       // Señal de reinicio
  input logic [5:0] bombs,  // Entrada de interruptores para configurar el número de bombas
  input logic move, select, mark, // Entrada de botones para selección de casillas y marcar como posible bomba
  input logic [1:0] course,
  input logic str,
  output logic [8:0] board_out [0:7][0:7],
  output logic [3:0] boardColors [0:7][0:7],
  output logic [13:0] seg,
  output logic [3:0] crray [0:63]
   
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
  logic [8:0] board3 [0:7][0:7];
  logic [8:0] boardSelection [0:7][0:7];
  logic [3:0] boardColors2 [0:7][0:7];
  logic [3:0] colorsArray [0:63];
  int rtw = 0;
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
  

  // Otras variables auxiliares
  int i, j;

  RandomBombs #(16) RandomBombs_MainInstance (
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
    .board_in(board_out),
    .board_out(boardSelection),
	 .lose(lose),
	 .enable(select)
  );
  ColorMatrix ColorMatrix_instance (
    .rst(rst),
    .board_in(board_out),
    .board_out(boardColors2)
  );
  

  // Inicialización del tablero con casillas vacías
  initial begin
    for (i = 0; i < 8; i = i + 1) begin
      for (j = 0; j < 8; j = j + 1) begin
        board[i][j] = 9'b000000000; // Asigna el valor 0 (casilla vacía) a cada elemento
        board2[i][j] = 9'b000000000;
		  board3[i][j] = 9'b000000000;
		  boardSelection[i][j] = 9'b000000000;
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
	   // SET UP
		3'b000: if (str) next_state = 3'b001; else next_state = 3'b000;
		// WAIT
		3'b001: if (move) next_state = 3'b010; else if (select) next_state = 3'b011; else if (mark) next_state = 3'b100; else if (lose) next_state = 3'b101; else next_state = 3'b001;
		// MOVE
		3'b010: if (move==0) next_state = 3'b001; else next_state = 3'b010;
		// SELECT
		3'b011: if (select==0) next_state = 3'b001; else next_state = 3'b011;
		// MARK
		3'b100: if (mark==0) next_state = 3'b001; else next_state = 3'b100;
		// LOSE
		3'b101: if (rst) next_state = 3'b000; else next_state = 3'b101;
		default: next_state = 3'b001;
	 endcase
  end
  
  
  
  always_comb begin
	  for (int i = 0; i < 8; i = i + 1) begin
		 for (int j = 0; j < 8; j = j + 1) begin
			board_out[i][j] = board[i][j] | board2[i][j] | boardSelection[i][j]; // Perform OR operation element-wise
		   boardColors[i][j] = boardColors2[i][j];
			colorsArray[rtw] = boardColors[i][j];
			//board3[i][j] = board[i][j] | boardSelection[i][j];
			crray[rtw] = boardColors[i][j];
			rtw = rtw + 1;
		 end
	  end
	  case(bombs)
			//			Two 7 segment display (HEX)
			
			'b000000: seg = 14'b1111111_0000001;
			'b000001: seg = 14'b1111111_1001111;
			'b000010: seg = 14'b1111111_0010010;
			'b000011: seg = 14'b1111111_0000110;
			'b000100: seg = 14'b1111111_1001100;
			'b000101: seg = 14'b1111111_0100100;
			'b000110: seg = 14'b1111111_0100000;
			'b000111: seg = 14'b1111111_0001111;
			'b001000: seg = 14'b1111111_0000000;
			'b001001: seg = 14'b1111111_0000100;
			//	
			'b001010: seg = 14'b1001111_0000001;
			'b001011: seg = 14'b1001111_1001111;
			'b001100: seg = 14'b1001111_0010010;
			'b001101: seg = 14'b1001111_0000110;
			'b001110: seg = 14'b1001111_1001100;
			'b001111: seg = 14'b1001111_0100100;
			'b010000: seg = 14'b1001111_0100000;
			'b010001: seg = 14'b1001111_0001111;
			'b010010: seg = 14'b1001111_0000000;
			'b010011: seg = 14'b1001111_0000100;
			//
			'b010100: seg = 14'b0010010_0000001;
			'b010101: seg = 14'b0010010_1001111;
			'b010110: seg = 14'b0010010_0010010;
			'b010111: seg = 14'b0010010_0000110;
			'b011000: seg = 14'b0010010_1001100;
			'b011001: seg = 14'b0010010_0100100;
			'b011010: seg = 14'b0010010_0100000;
			'b011011: seg = 14'b0010010_0001111;
			'b011100: seg = 14'b0010010_0000000;
			'b011101: seg = 14'b0010010_0000100;
			//
			'b011110: seg = 14'b0000110_0000001;
			'b011111: seg = 14'b0000110_1001111;
			'b100000: seg = 14'b0000110_0010010;
			'b100001: seg = 14'b0000110_0000110;
			'b100010: seg = 14'b0000110_1001100;
			'b100011: seg = 14'b0000110_0100100;
			'b100100: seg = 14'b0000110_0100000;
			'b100101: seg = 14'b0000110_0001111;
			'b100110: seg = 14'b0000110_0000000;
			'b100111: seg = 14'b0000110_0000100;
			//
			'b101000: seg = 14'b1001100_0000001;
			'b101001: seg = 14'b1001100_1001111;
			'b101010: seg = 14'b1001100_0010010;
			'b101011: seg = 14'b1001100_0000110;
			'b101100: seg = 14'b1001100_1001100;
			'b101101: seg = 14'b1001100_0100100;
			'b101110: seg = 14'b1001100_0100000;
			'b101111: seg = 14'b1001100_0001111;
			'b110000: seg = 14'b1001100_0000000;
			'b110001: seg = 14'b1001100_0000100;
			//
			'b110010: seg = 14'b0100100_0000001;
			'b110011: seg = 14'b0100100_1001111;
			'b110100: seg = 14'b0100100_0010010;
			'b110101: seg = 14'b0100100_0000110;
			'b110110: seg = 14'b0100100_1001100;
			'b110111: seg = 14'b0100100_0100100;
			'b111000: seg = 14'b0100100_0100000;
			'b111001: seg = 14'b0100100_0001111;
			'b111010: seg = 14'b0100100_0000000;
			'b111011: seg = 14'b0100100_0000100;
			//
			'b111100: seg = 14'b0100000_0000001;
			'b111101: seg = 14'b0100000_1001111;
			'b111110: seg = 14'b0100000_0010010;
			'b111111: seg = 14'b0100000_0000110;
			default: seg = 14'b1111111_1111111;
			
		endcase
	end

endmodule

