`timescale 1ps / 1ps


module MedianFilter_tb;
    logic clk;
    logic [7:0] result;
    logic [7:0] matrix [0:7][0:7];

    MedianFilter uut (
        .clk(clk),
        .result(result)
    );

    initial begin
			 // Inicialización de la matriz con ceros
        for (int i = 0; i < 8; i = i + 1) begin
            for (int j = 0; j < 8; j = j + 1) begin
                matrix[i][j] = 8'h00;
            end
        end
        // Inicialización de la matriz con valores específicos
        matrix[2][2] = 8'h04;
        matrix[2][3] = 8'h05;
        matrix[2][4] = 8'h03;
        matrix[3][2] = 8'h07;
        matrix[3][3] = 8'h08;
        matrix[3][4] = 8'h0C;
        matrix[4][2] = 8'h01;
        matrix[4][3] = 8'h02;
        matrix[4][4] = 8'h0A;
        // Puedes añadir más valores según tus necesidades
		  #40 clk = 0;
		  #40 clk = 1;
        // Imprimir resultado
        $display("Result: %h", result);
        $stop;
    end
endmodule

