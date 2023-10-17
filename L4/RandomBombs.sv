module RandomBombs #(parameter N = 8)(
  input logic rst,
  input logic [5:0] bomb_count,  // Número de bombas a generar
  input logic [8:0] board_in [0:7][0:7],           // Tablero de entrada
  output logic [8:0] board_out [0:7][0:7],          // Tablero de salida con bombas marcadas
  output logic start,
  output logic random_gen_done, // Señal de control para indicar finalización
  input logic enable // Señal de habilitación
);

// Variables locales
  int x, y;
  logic [5:0] added_bombs = 6'b000000;
  int nearBombsCounter = 0;
  
  logic [2:0] random_seed = 3'b101; // Semilla inicial para generación de números aleatorios
  logic [2:0] random_seed2 = 3'b001;
  logic [7:0] bomb_count2;
  
  
  always_ff @(posedge rst or posedge enable) begin
    //bomb_count2 = bomb_count;
    if (rst) begin
		for (int i = 0; i < 8; i = i + 1) begin
        for (int j = 0; j < 8; j = j + 1) begin
          board_out[i][j] = board_in[i][j]; // Asigna el valor 0 (casilla vacía) a cada elemento
        end
      end
	 end 
	 if (enable) begin
		for (int i = 0; i < 63; i = i + 1) begin : bombs_random_gen
		
			if (added_bombs==bomb_count) begin
				disable bombs_random_gen;
			end
		 
			// Genera números aleatorios para las posiciones X e Y
			if (bomb_count<15) begin
				random_seed = random_seed + bomb_count+3/2;
				random_seed2 = random_seed2 + bomb_count+7/2;
			end else begin
				random_seed = random_seed + bomb_count/3;
				random_seed2 = random_seed2 + bomb_count/4;
			end
			
			for (int u = 0; u < 64; u = u + 1) begin : random_gen
				if (board_out[random_seed[2:0]][random_seed2[2:0]] != 9'b000000000) begin
					// Actualiza la variable de datos en cada iteración
					random_seed = random_seed + 1; // Puedes usar una técnica más avanzada para actualizar la semilla
					random_seed2 = random_seed2 + 1;
				end else begin
					disable random_gen;
				end
			end
			board_out[random_seed[2:0]][random_seed2[2:0]] = 9'b000100000;
			added_bombs = added_bombs + 1;
			bomb_count2 = bomb_count2 - 1;

			// Actualiza la semilla para el próximo número aleatorio
			random_seed = random_seed % 8; // Puedes usar una técnica más avanzada para actualizar la semilla
			random_seed2 = random_seed2 % 8;
			
		 end
		 
		 for (int o = 0; o < 8; o = o + 1) begin
         for (int w = 0; w < 8; w = w + 1) begin
			  if (o == 0 & w == 0) begin // esquina superior izq
			    if (board_out[o][w+1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1; 
				 end
				 if (board_out[o+1][w][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 if (board_out[o+1][w+1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end 
				 
			  
			  end else if (o == 7 & w == 0) begin // esquina inferior izq
			    if (board_out[o-1][w][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1; 
				 end
				 if (board_out[o][w+1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 if (board_out[o-1][w+1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 
			  
			  end else if (o == 0 & w == 7) begin // esquina superior der
			    if (board_out[o][w-1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1; 
				 end
				 if (board_out[o+1][w][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 if (board_out[o+1][w-1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 
			  
			  end else if (o == 7 & w == 7) begin // esquina inferior der
			    if (board_out[o][w-1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1; 
				 end
				 if (board_out[o-1][w][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 if (board_out[o-1][w-1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 
			  
			  end else if (o == 0) begin // casillas borde arriba
			    if (board_out[o][w-1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1; 
				 end
				 if (board_out[o][w+1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 if (board_out[o+1][w][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 if (board_out[o+1][w-1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 if (board_out[o+1][w+1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 
				 
			  end else if (o == 7) begin // casillas borde abajo
			    if (board_out[o][w-1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1; 
				 end
				 if (board_out[o][w+1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 if (board_out[o-1][w][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 if (board_out[o-1][w-1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 if (board_out[o-1][w+1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 
				 
			  end else if (w == 0) begin // casillas borde izquierdo
			    if (board_out[o-1][w][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1; 
				 end
				 if (board_out[o+1][w][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 if (board_out[o][w+1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 if (board_out[o-1][w+1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 if (board_out[o+1][w+1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 
				 
			  end else if (w == 7) begin // casillas borde derecho
			    if (board_out[o-1][w][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1; 
				 end
				 if (board_out[o+1][w][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 if (board_out[o][w-1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 if (board_out[o-1][w-1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 if (board_out[o+1][w-1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 
				 
			  end else begin // Resto de casillas
			    if (board_out[o-1][w][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1; 
				 end
				 if (board_out[o+1][w][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 if (board_out[o][w-1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 if (board_out[o][w+1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 if (board_out[o-1][w-1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 if (board_out[o-1][w+1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 if (board_out[o+1][w-1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
				 if (board_out[o+1][w+1][5]==1) begin
				   nearBombsCounter = nearBombsCounter + 1;
				 end
			  end	 
			  board_out[o][w] = board_out[o][w] + nearBombsCounter;
			  nearBombsCounter = 0;
         end
       end
		 start = 1;
    end		 
 end


  

endmodule


/*
// Registro de desplazamiento de retroalimentación lineal de 3 bits
  logic [2:0] lfsr_reg;

  // Asignar la semilla inicial
  assign lfsr_reg = seed;

  // Lógica para generar números pseudoaleatorios
  always @* begin
    // Actualizar el LFSR utilizando una función de retroalimentación
    lfsr_reg[0] = lfsr_reg[2] ^ lfsr_reg[1];
    lfsr_reg[1] = lfsr_reg[2];
    lfsr_reg[2] = lfsr_reg[0];
  end

  // Asignar el número aleatorio generado
  assign rand_out = lfsr_reg;*/