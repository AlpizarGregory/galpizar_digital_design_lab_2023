module MedianFilter(
    input logic clk,
    output logic [7:0] result
);
    logic [7:0] matrix [0:7][0:7];
	 
    // Ejemplo de obtener la mediana sin funciones
    logic [7:0] m1, m2, m3, m4, m5, m6, m7, m8, m9;
    logic [7:0] temp;
	 

    always_ff @(posedge clk) begin
		 
		  m1 = 8'h00;
		  m2 = 8'h00;
		  m3 = 8'h00;
		  m4 = 8'h00;
		  m5 = 8'h00;
		  m6 = 8'h00;
		  m7 = 8'h00;
		  m8 = 8'h00;
		  m9 = 8'h00;
			  
			// Imprimir valores de la matriz
			$display("Matrix values: %h %h %h %h %h %h %h %h %h", matrix[2][2], matrix[2][3], matrix[2][4], matrix[3][2], matrix[3][3], matrix[3][4], matrix[4][2], matrix[4][3], matrix[4][4]);
        // Obtener valores de la submatriz
        m1 = matrix[2][2];
        m2 = matrix[2][3];
        m3 = matrix[2][4];
        m4 = matrix[3][2];
        m5 = matrix[3][3];
        m6 = matrix[3][4];
        m7 = matrix[4][2];
        m8 = matrix[4][3];
        m9 = matrix[4][4];	  		  
		  
		  // Imprimir valores antes de la ordenación
        $display("Before sorting: m1=%h, m2=%h, m3=%h, m4=%h, m5=%h, m6=%h, m7=%h, m8=%h, m9=%h", m1, m2, m3, m4, m5, m6, m7, m8, m9);

       // Ordenar valores (burbuja)
        if (m1 > m2) begin temp = m1; m1 = m2; m2 = temp; end
        if (m2 > m3) begin temp = m2; m2 = m3; m3 = temp; end
        if (m3 > m4) begin temp = m3; m3 = m4; m4 = temp; end
        if (m4 > m5) begin temp = m4; m4 = m5; m5 = temp; end
        if (m5 > m6) begin temp = m5; m5 = m6; m6 = temp; end
        if (m6 > m7) begin temp = m6; m6 = m7; m7 = temp; end
        if (m7 > m8) begin temp = m7; m7 = m8; m8 = temp; end
        if (m8 > m9) begin temp = m8; m8 = m9; m9 = temp; end
        if (m1 > m2) begin temp = m1; m1 = m2; m2 = temp; end
        if (m2 > m3) begin temp = m2; m2 = m3; m3 = temp; end
        if (m3 > m4) begin temp = m3; m3 = m4; m4 = temp; end
        if (m4 > m5) begin temp = m4; m4 = m5; m5 = temp; end
        if (m5 > m6) begin temp = m5; m5 = m6; m6 = temp; end
        if (m6 > m7) begin temp = m6; m6 = m7; m7 = temp; end
        if (m7 > m8) begin temp = m7; m7 = m8; m8 = temp; end
        if (m8 > m9) begin temp = m8; m8 = m9; m9 = temp; end

        // Imprimir valores después de la ordenación
        $display("After sorting: m1=%h, m2=%h, m3=%h, m4=%h, m5=%h, m6=%h, m7=%h, m8=%h, m9=%h", m1, m2, m3, m4, m5, m6, m7, m8, m9);

        // Obtener el valor central (mediana)
        result = m5;

        // Imprimir el resultado
        $display("Result: %h", result);
    end
endmodule

