module Movement(
  input logic flagMovement,
  input logic clk,
  input logic rst,
  input logic [1:0] direction,  // Número de bombas a generar
  input logic [7:0] board_in [0:7][0:7],           // Tablero de entrada
  output logic [7:0] board_out [0:7][0:7],          // Tablero de salida con bombas marcadas
  output logic movement_done, // Señal de control para indicar finalización
  input logic enable // Señal de habilitación
);

// Variables locales
  int x, y;
  int positionX = 4;
  int positionY = 4;
  
  always_ff @ (posedge enable) begin

	 if (enable) begin
	   for (int i = 0; i < 8; i = i + 1) begin
        for (int j = 0; j < 8; j = j + 1) begin
          board_out[i][j] = board_in[i][j]; // Asigna el valor 0 (casilla vacía) a cada elemento
			 board_out[i][j] = 8'b00000000;
			 board_out[positionY][positionX][4] = 1;
        end
      end
	 
		if (direction == 2'b00) begin
			board_out[positionY][positionX][4] = 0;
			board_out[positionY-1][positionX][4] = 1;
			positionY = positionY - 1;
			
		end else if (direction == 2'b01) begin
			board_out[positionY][positionX][4] = 0;
			board_out[positionY][positionX+1][4] = 1;
			positionX = positionX + 1;
		
		end else if (direction == 2'b10) begin
			board_out[positionY][positionX][4] = 0;
			board_out[positionY+1][positionX][4] = 1;
			positionY = positionY + 1;
		
		end else if (direction == 2'b11) begin
			board_out[positionY][positionX][4] = 0;
			board_out[positionY][positionX-1][4] = 1;
			positionX = positionX - 1;
		
		end
		
	 end
		 
  end

  

endmodule