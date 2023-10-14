module Movement_Testbench;

 

  // Signals
  logic flagMovement;
  logic clk;
  logic rst;
  logic [1:0] direction;
  logic [8:0] board_in [0:7][0:7];
  logic [8:0] board_out [0:7][0:7];
  logic movement_done; // Señal de control para indicar finalización
  logic enable; // Señal de habilitación
  /*
  logic [2:0] board_in [0:7][0:7][0:2];
  logic [2:0] board_out [0:7][0:7][0:2];
  */

  // Instantiate the RandomBombs module
  Movement Movement_instance (
    .flagMovement(flagMovement),
    .clk(clk),
    .rst(rst),
	 .direction(direction),
    .board_in(board_in),
    .board_out(board_out),
	 .movement_done(movement_done),
	 .enable(enable)
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
	 enable = 1;
	 direction = 2'b00;
	 #50;
	 enable = 0;
    #50;
	 enable = 1;
	 direction = 2'b01;


  end



endmodule