module BombFlag (
	input logic rst,
	input logic [8:0] board_in [0:7][0:7],
	output logic [8:0] board_out [0:7][0:7],
	input logic enable,
	input logic posX,
	input logic posY
);

	always_ff @ (posedge enable) begin
	
		if (enable) begin
			for (int i = 0; i < 8; i = i + 1) begin
				for (int j = 0; j < 8; j = j + 1) begin
					board_out[i][j] = board_in[i][j];
					if (board_out[i][j][4] == 1) begin // Posición del jugador
						board_out[i][j][6] = ~board_out[i][j][6];
					end
				end
			end
		end
	
	end

endmodule