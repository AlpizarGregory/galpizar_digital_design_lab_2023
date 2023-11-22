module topFilter(
    input logic clk,
    input logic [1:0] filterSelector//,
    //output logic [7:0] board_out [0:99][0:99]
);
	 logic [7:0] board_out [0:99][0:99];

    logic [7:0] board_outAUX [0:99][0:99];
    // logic [7:0] resultFinal;

    middleFilter dut (
        .clk(clk),
        .board_out(board_outAUX)
    );

    always_ff @(posedge clk) begin
        // Asignar la salida del filtro al resultado final basado en filterSelector
        if (filterSelector == 2'b10) begin
            // Si filterSelector es 2'b00, selecciona board_outAUX del filtro
            for (int i = 0; i < 100; i = i + 1) begin
                for (int j = 0; j < 100; j = j + 1) begin
                    board_out[i][j] = board_outAUX[i][j];
                end
            end
        end else if (filterSelector == 2'b01) begin
            // Otra lógica o filtro puede ser seleccionado aquí
            // Puedes agregar más condiciones según sea necesario
        end
    end
endmodule
