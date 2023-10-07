module RandomBombPositionsGenerator(
  input logic [5:0] n,  // Cantidad de bombas
  output logic [5:0] bomb_positions [0:62]  // Array de posiciones de bombas
);

  // Registro para mantener el estado del generador
  logic [5:0] state = 6'b000000;

  // Algoritmo simple de generación de números pseudoaleatorios (LFSR)
  // Puedes personalizar este algoritmo según tus necesidades
  always @* begin
    state[5:0] = state[0] ^ state[5] ^ state[1];
  end

  // Generación de los números aleatorios
  int i = 0;
  generate
    for (i; i < 63; i = i + 1) begin : RANDOM_GEN
      always_comb begin
        random_numbers[i] = state;
        state[5:0] = state[0] ^ state[5] ^ state[1]; // Actualiza el estado sin reloj
      end
    end
  endgenerate

  // Lógica para seleccionar las posiciones de bombas
  always @* begin
    for (int i = 0; i < n; i = i + 1) begin
      bomb_positions[i] = random_numbers[i * 5];
    end
  end

endmodule
