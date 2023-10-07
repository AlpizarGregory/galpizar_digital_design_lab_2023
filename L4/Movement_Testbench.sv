module Movement_Testbench;

 

  // Signals
  logic clk;
  logic rst;
  logic [1:0] direction;
  logic [7:0] board_in [0:7][0:7];
  logic [7:0] board_out [0:7][0:7];
  /*
  logic [2:0] board_in [0:7][0:7][0:2];
  logic [2:0] board_out [0:7][0:7][0:2];
  */

  // Instantiate the RandomBombs module
  Movement Movement_instance (
    .clk(clk),
    .rst(rst),
	 .direction(direction),
    .board_in(board_in),
    .board_out(board_out)
  );

    // Initial block
    // Initial block
  initial begin
    
    // Inicializa board_in con los valores deseados (ejemplo)
    for (int i = 0; i < 8; i = i + 1) begin
      for (int j = 0; j < 8; j = j + 1) begin
        board_in[i][j] = 8'b00000000; // Asigna el valor 0 (casilla vacía) a cada elemento
      end
    end
	 
	 // Initialize signals and board_in
    clk = 0;
    rst = 1;
	 
	 direction = 2'b00;
	 #10;
	 rst = 0;
	 clk = 1;
    // Reset and apply clock
    #10;
	 clk = 0;
	 direction = 2'b01;
	 #10;
	 clk = 1;

  end



endmodule