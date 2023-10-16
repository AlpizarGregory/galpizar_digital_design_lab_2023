module ColorMatrix_Testbench;


  logic rst;
  logic [8:0] board_in [0:7][0:7];
  logic [3:0] board_out [0:7][0:7];
  /*
  logic [2:0] board_in [0:7][0:7][0:2];
  logic [2:0] board_out [0:7][0:7][0:2];
  */

  // Instantiate the RandomBombs module
  ColorMatrix ColorMatrix_instance (
    .rst(rst),
    .board_in(board_in),
    .board_out(board_out)
  );

    // Initial block
    // Initial block
  initial begin
    
    // Inicializa board_in con los valores deseados (ejemplo)
    for (int i = 0; i < 8; i = i + 1) begin
      for (int j = 0; j < 8; j = j + 1) begin
        board_in[i][j] = 9'b000000000; // Asigna el valor 0 (casilla vacía) a cada elemento
		
		end
    end
	 
	 // Initialize signals and board_in
	 rst = 1;
	 #50;
	 rst = 0;
    #50;
	 board_in[1][1] = 9'b010000010;


  end



endmodule