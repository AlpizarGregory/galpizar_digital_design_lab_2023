module ColorMatrix (
  input logic rst,
  input logic [8:0] board_in [0:7][0:7],           // Tablero de entrada
  output logic [3:0] board_out [0:7][0:7]          // Tablero de salida con bombas marcadas
);

  always @ (*) begin
    if (rst) begin
	   for (int i = 0; i < 8; i = i + 1) begin
			for (int j = 0; j < 8; j = j + 1) begin
	        board_out[i][j] = 4'b0000;
			end
		end 
	 end else begin
		 for (int i = 0; i < 8; i = i + 1) begin
			 for (int j = 0; j < 8; j = j + 1) begin
				 board_out[i][j] = 4'b0000;
				 if (board_in[i][j] == 9'b111111111) begin
				   board_out[i][j] = 4'b1100;
				 end else if (board_in[i][j][8] == 1) begin
					board_out[i][j] = 4'b1001;
				 end else if (board_in[i][j][4] == 1) begin
					board_out[i][j] = 4'b1010;//--------------------------
				 end else if (board_in[i][j][7] == 1) begin
					if (board_in[i][j][3:0] == 4'b0000) begin
					  board_out[i][j] = 4'b0000;//--------------------------
					end else if (board_in[i][j][3:0] == 4'b0001) begin
					  board_out[i][j] = 4'b0001;
					end else if (board_in[i][j][3:0] == 4'b0010) begin
					  board_out[i][j] = 4'b0010;
					end else if (board_in[i][j][3:0] == 4'b0011) begin
					  board_out[i][j] = 4'b0011;
					end else if (board_in[i][j][3:0] == 4'b0100) begin
					  board_out[i][j] = 4'b0100;
					end else if (board_in[i][j][3:0] == 4'b0101) begin
					  board_out[i][j] = 4'b0101;
					end else if (board_in[i][j][3:0] == 4'b0110) begin
					  board_out[i][j] = 4'b0110;
					end else if (board_in[i][j][3:0] == 4'b0111) begin
					  board_out[i][j] = 4'b0111;
					end
				 end else begin
					board_out[i][j] = 4'b1000;
				 end
				 
			end
		 end
    end		 
  end	 
  /*
	         4'h0 : out_rgb <= 24'h7673D6; // ninguna bomba adyacente 		azul gris
				4'h1 : out_rgb <= 24'h73B5D6; // una bombas adyacentes 			celeste gris
				4'h2 : out_rgb <= 24'h73D6A2; // dos bombas adyacentes 			verde gris
				4'h3 : out_rgb <= 24'h76D673; // tres bombas adyacentes 		verde amarillo gris
				4'h4 : out_rgb <= 24'hBED673; // cuatro bombas adyacentes 		amarillo gris
				4'h5 : out_rgb <= 24'hD6CA73; // cinco bombas adyacentes 		amarillo naranja gris
				4'h6 : out_rgb <= 24'hD69B73; // seis bombas adyacentes 		naranja gris
				4'h7 : out_rgb <= 24'hD67373; // siete bombas adyacentes 		rojo gris
				4'h8 : out_rgb <= 24'hB1B1B1; // casilla limpia 				gris
				4'h9 : out_rgb <= 24'h818181; // casilla seleccionada 			gris oscuro
				4'hA : out_rgb <= 24'hE8E8E8;// casilla actual					gris claro
				4'hB : out_rgb <= 24'h793960; // casilla con posible bomba 		violeta
				4'hC : out_rgb <= 24'h660000; // juego perdido 					rojo oscuro
				4'hD : out_rgb <= 24'h43C043; // juego ganado	 				verde claro
				default : out_rgb <= 24'h000000; // negro
	 
	 */
endmodule