module RandomBombs_Testbench;

  // Parameters
  parameter BOMB_COUNT = 14; // You can change this value

  // Signals
  logic rst;
  logic [5:0] bomb_count = 6'b001000;
  logic [8:0] board_in [0:7][0:7];
  logic [8:0] board_out [0:7][0:7];
  logic start = 0;
  logic random_gen_done; // Señal de control para indicar finalización
  logic enable; // Señal de habilitación


  // Instantiate the RandomBombs module
  RandomBombs #(BOMB_COUNT) RandomBombs_instance (
    .rst(rst),
	 .bomb_count(bomb_count),
    .board_in(board_in),
    .board_out(board_out),
	 .start(start),
	 .random_gen_done(random_gen_done),
	 .enable(enable)
  );

  // Initialize board_in with your desired values (example)
  initial begin
    // You can set up the initial state of board_in here (0 for empty, 1 for bomb, etc.)
    // For example, set some bombs in the middle:
	 rst = 0;
    for (int i = 0; i < 8; i = i + 1) begin
      for (int j = 0; j < 8; j = j + 1) begin
        board_in[i][j] = 9'b000000000; // Asigna el valor 0 (casilla vacía) a cada elemento
      end
    end
	 

    // Start simulation
    $display("Starting simulation with bomb_count = %d", BOMB_COUNT);

    // Add any additional testbench logic here if needed

    // Wait for some time to observe the results
    #100;
	 rst = 1;
	 #100
	 rst = 0;
	 enable = 1;
	 #100
    // Display the resulting board_out
	 /*
    $display("Resulting board_out:");
    for (int x = 0; x < 8; x = x + 1) begin
      for (int y = 0; y < 8; y = y + 1) begin
        $display("board_out[%0d][%0d] = %b", x, y, board_out[x][y]);
      end
    end*/
	 // Muestra el valor de added_bombs
    $display("Valor de added_bombs = %d", RandomBombs_instance.added_bombs);

  end

endmodule




