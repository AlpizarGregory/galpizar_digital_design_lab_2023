module RandomBombPositionsGenerator_Testbench;

  // Parámetros
  parameter NUM_BOMBS = 10; // Número de bombas a generar

  // Señales de entrada
  logic [5:0] n = NUM_BOMBS; // Cantidad de bombas

  // Arrays de salida
  logic [5:0] bomb_positions [0:62];

  // Instancia del módulo bajo prueba
  RandomBombPositionsGenerator uut (
    .n(n),
    .bomb_positions(bomb_positions)
  );

  // Inicialización de señales
  initial begin
    // Inicio de la simulación
    $display("Generando %0d bombas aleatorias:", NUM_BOMBS);
    
    // Simulación de generación de bombas
    #1; // Pequeña espera para asegurar que los datos están listos

    // Mostrar las posiciones de las bombas generadas
    for (int i = 0; i < NUM_BOMBS; i = i + 1) begin
      $display("Bomba %0d: Posición = %0d", i, bomb_positions[i]);
    end

    // Terminar la simulación
    $finish;
  end

endmodule
