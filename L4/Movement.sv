module Movement(
  input logic clk,
  input logic rst,
  input logic [1:0] direction,  // Número de bombas a generar
  input logic [7:0] board_in [0:7][0:7],           // Tablero de entrada
  output logic [7:0] board_out [0:7][0:7]          // Tablero de salida con bombas marcadas
);

// Variables locales
  int x, y;
  int positionX = 4;
  int positionY = 2;
  always_ff @ (posedge clk or posedge rst) begin
    if (rst) begin
		for (int i = 0; i < 8; i = i + 1) begin
        for (int j = 0; j < 8; j = j + 1) begin
          board_out[i][j] = board_in[i][j]; // Asigna el valor 0 (casilla vacía) a cada elemento
			 board_out[positionY][positionX]= 8'b00010000;
        end
      end
	 end
	 
	 if (clk) begin
		if (direction == 2'b00) begin
			board_out[positionY][positionX] = 8'b00000000;
			board_out[positionY-1][positionX] = 8'b00010000;
			positionY = positionY - 1;
			
		end else if (direction == 2'b01) begin
			board_out[positionY][positionX] = 8'b00000000;
			board_out[positionY][positionX+1] = 8'b00010000;
			positionX = positionX + 1;
		
		end else if (direction == 2'b10) begin
			board_out[positionY][positionX] = 8'b00000000;
			board_out[positionY+1][positionX] = 8'b00010000;
			positionY = positionY + 1;
		
		end else if (direction == 2'b11) begin
			board_out[positionY][positionX] = 8'b00000000;
			board_out[positionY][positionX-1] = 8'b00010000;
			positionX = positionX - 1;
		
		end
		
	 end
		 
  end

  

endmodule