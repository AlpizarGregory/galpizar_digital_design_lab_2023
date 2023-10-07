module GenerateBombs (
  input logic [7:0] bomb_count,  // Número de bombas a generar
  output logic [2:0] positions_x [7:0],  // Array de posiciones X
  output logic [2:0] positions_y [7:0]   // Array de posiciones Y
);

  
  // Declaración de variables lógicas para el LFSR
  logic [2:0] random_seed = bomb_count;
  logic [2:0] random_seed2 = 3'b001;	

  // Lógica para la generación de posiciones aleatorias
  always_comb begin
    for (int i = 0; i < 8; i = i + 1) begin
      // Genera números aleatorios para las posiciones X e Y
      // Generación de números X e Y
		positions_x[i] = random_seed[2:0]; // Utiliza los 3 bits menos significativos de la semilla
      positions_y[i] = random_seed2[2:0];
		
		random_seed = random_seed + 1;
		random_seed2 = random_seed2 + 1;

    end
  end
endmodule

