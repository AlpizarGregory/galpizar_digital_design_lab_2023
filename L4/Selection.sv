module Selection (
  input logic rst,
  input logic [8:0] board_in [0:7][0:7],           // Tablero de entrada
  output logic [8:0] board_out [0:7][0:7],          // Tablero de salida con bombas marcadas
  output logic lose, 
  input logic enable // Señal de habilitación
);

// Variables locales
  int x, y;
  always_ff @ (posedge enable) begin

	 if (enable) begin
	   for (int i = 0; i < 8; i = i + 1) begin
        for (int j = 0; j < 8; j = j + 1) begin
          board_out[i][j] = board_in[i][j]; // Asigna el valor 0 (casilla vacía) a cada elemento
		  end
		end
	   for (int o = 0; o < 8; o = o + 1) begin : selection_loap
        for (int w = 0; w < 8; w = w + 1) begin	
			 if (board_out[o][w][4] == 1) begin
			 
			   if (board_out[o][w][5] == 1) begin  // Si hay bomba
				  // PIERDE
				  lose = 1;
				  disable selection_loap;
				end else begin
			     board_out[o][w][8] = 1;	
				end
				if (o == 0 & w == 0) begin // esquina superior izq
			     board_out[o][w+1][7]=1;
				  board_out[o+1][w][7]=1;
				  board_out[o+1][w+1][7]=1; 
			   end else if (o == 7 & w == 0) begin // esquina inferior izq
			     board_out[o-1][w][7]=1;
				  board_out[o][w+1][7]=1;
				  board_out[o-1][w+1][7]=1;
			   end else if (o == 0 & w == 7) begin // esquina superior der
			     board_out[o][w-1][7]=1;
				  board_out[o+1][w][7]=1;
				  board_out[o+1][w-1][7]=1;
			   end else if (o == 7 & w == 7) begin // esquina inferior der
			     board_out[o][w-1][7]=1;
				  board_out[o-1][w][7]=1;
				  board_out[o-1][w-1][7]=1;
			   end else if (o == 0) begin // casillas borde arriba
			     board_out[o][w-1][7]=1;
				  board_out[o][w+1][7]=1;
				  board_out[o+1][w][7]=1;
				  board_out[o+1][w-1][7]=1;
				  board_out[o+1][w+1][7]=1;
			   end else if (o == 7) begin // casillas borde abajo
			     board_out[o][w-1][7]=1;
				  board_out[o][w+1][7]=1;
				  board_out[o-1][w][7]=1;
				  board_out[o-1][w-1][7]=1;
				  board_out[o-1][w+1][7]=1;
			   end else if (w == 0) begin // casillas borde izquierdo
			     board_out[o-1][w][7]=1;
				  board_out[o+1][w][7]=1;
				  board_out[o][w+1][7]=1;
				  board_out[o-1][w+1][7]=1;
				  board_out[o+1][w+1][7]=1;
			   end else if (w == 7) begin // casillas borde derecho
			     board_out[o-1][w][7]=1;
				  board_out[o+1][w][7]=1;
				  board_out[o][w-1][7]=1;
				  board_out[o-1][w-1][7]=1;
				  board_out[o+1][w-1][7]=1;
			   end else begin // Resto de casillas
			     board_out[o-1][w][7]=1;
				  board_out[o+1][w][7]=1;
				  board_out[o][w-1][7]=1;
				  board_out[o][w+1][7]=1;
				  board_out[o-1][w-1][7]=1;
				  board_out[o-1][w+1][7]=1;
				  board_out[o+1][w-1][7]=1;
				  board_out[o+1][w+1][7]=1;

			   end
			 end
        end
      end
    end		
  end	
  
endmodule