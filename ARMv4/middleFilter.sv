module middleFilter(input logic clk,output logic [7:0] board_out [0:99][0:99], output logic [7:0] resultFinal);
	logic [13:0] count = 14'b00000000000000;
	logic [13:0] count2 = 14'b00000000000000;
	logic wren;
	logic [7:0] q;
	logic [7:0] data;
	logic en = 1;
	logic en2 = 1;
	logic [6:0] x = 7'b0000000;
	logic [6:0] y = 7'b0000000;
	
	logic [7:0] m1,m2,m3,m4,m5,m6,m7,m8,m9;
	
	ram1 memm(count, clk, data, wren, q);
	//logic [7:0] m1, m2, m3, m4, m5, m6, m7, m8, m9;
	logic [7:0] temp;
	
	logic [6:0] countMedianY = 7'b0000001;
	logic [6:0] countMedian = 7'b0000001;
	//Median men(countMedianY, countMedian, en, board_out,resultFinal);
	
	always_ff @(negedge clk) begin
	   $display("count = %0d, x = %0d, y = %0d, q = %h", count, x, y, q);
		m1 = board_out[countMedianY-1][countMedian-1];
		m2 = board_out[countMedianY-1][countMedian];
		m3 = board_out[countMedianY-1][countMedian+1];
		m4 = board_out[countMedianY][countMedian-1];
		m5 = board_out[countMedianY][countMedian];
		m6 = board_out[countMedianY][countMedian+1];
		m7 = board_out[countMedianY+1][countMedian-1];
		m8 = board_out[countMedianY+1][countMedian];
		m9 = board_out[countMedianY+1][countMedian+1];
		$display("Before sorting: m1=%h, m2=%h, m3=%h, m4=%h, m5=%h, m6=%h, m7=%h, m8=%h, m9=%h", m1, m2, m3, m4, m5, m6, m7, m8, m9);
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
				
		if (m1 > m2) begin temp = m1; m1 = m2; m2 = temp; end
		if (m2 > m3) begin temp = m2; m2 = m3; m3 = temp; end
		if (m3 > m4) begin temp = m3; m3 = m4; m4 = temp; end
		if (m4 > m5) begin temp = m4; m4 = m5; m5 = temp; end
		if (m5 > m6) begin temp = m5; m5 = m6; m6 = temp; end
		if (m6 > m7) begin temp = m6; m6 = m7; m7 = temp; end
			
		if (m1 > m2) begin temp = m1; m1 = m2; m2 = temp; end
		if (m2 > m3) begin temp = m2; m2 = m3; m3 = temp; end
		if (m3 > m4) begin temp = m3; m3 = m4; m4 = temp; end
		if (m4 > m5) begin temp = m4; m4 = m5; m5 = temp; end
		if (m5 > m6) begin temp = m5; m5 = m6; m6 = temp; end
				
		if (m1 > m2) begin temp = m1; m1 = m2; m2 = temp; end
		if (m2 > m3) begin temp = m2; m2 = m3; m3 = temp; end
		if (m3 > m4) begin temp = m3; m3 = m4; m4 = temp; end
		if (m4 > m5) begin temp = m4; m4 = m5; m5 = temp; end
				
		if (m1 > m2) begin temp = m1; m1 = m2; m2 = temp; end
		if (m2 > m3) begin temp = m2; m2 = m3; m3 = temp; end
		if (m3 > m4) begin temp = m3; m3 = m4; m4 = temp; end
				
		if (m1 > m2) begin temp = m1; m1 = m2; m2 = temp; end
		if (m2 > m3) begin temp = m2; m2 = m3; m3 = temp; end
				
		if (m1 > m2) begin temp = m1; m1 = m2; m2 = temp; end		
		if (en) begin
			if (y < 7'b1100100 && x < 7'b1100100) begin
					board_out[y][x] = q;
					x = x + 1;
			  end else if (y < 7'b1100100) begin
					x = 7'b0000000;
					y = y + 1;
					board_out[y][x] = q;
					x = x + 1;
			  end	
			
			if (count != 10000) begin
				count = count + 1;
			end else begin
				en = 0;
				
				
			end
			
			
		end else begin
			if (countMedian < 7'b1100010 && countMedianY < 7'b1100010) begin
				/*
				for (int i = 0; i < 3; i = i + 1) begin
					$write("Row %0d: ", i);
					for (int j = 0; j < 3; j = j + 1) begin
						if (board_out[countMedianY+i][countMedian+j]==resultFinal) begin //1
							board_out[countMedianY+i][countMedian+j] = board_out[countMedianY+1][countMedian+1];	
						end
					end
					$display(""); // Move to the next line after printing a row
				end*/
				
				
				

				board_out[countMedianY][countMedian] = m5;
				countMedian = countMedian + 1;
				//en = 1;
				
			end else if (countMedianY < 7'b1100010) begin
				countMedian = 7'b0000001;
				countMedianY = countMedianY + 1;
				
				
				
				/*
				for (int i = 0; i < 3; i = i + 1) begin
					$write("Row %0d: ", i);
					for (int j = 0; j < 3; j = j + 1) begin
						if (board_out[countMedianY+i][countMedian+j]==resultFinal) begin //1
							board_out[countMedianY+i][countMedian+j] = board_out[countMedianY+1][countMedian+1];	
						end
					end
					$display(""); // Move to the next line after printing a row
				end*/
				board_out[countMedianY][countMedian] = m5;
				countMedian = countMedian + 1;
				//en = 1;
				
			end
			if (count2 != 10000) begin
				count2 = count2 + 1;
			end else begin
				en2 = 0;
				
				
			end
			
		end
	end
endmodule

/*
module Median(
	input logic [6:0] countMedianY,
	input logic [6:0] countMedian,
	input logic enable,
	input logic [7:0] matrix [0:99][0:99],
	output logic [7:0] result
);
	 
   // Ejemplo de obtener la mediana sin funciones
	logic [7:0] m1, m2, m3, m4, m5, m6, m7, m8, m9;
	logic [7:0] temp;
	always_ff @ (negedge enable) begin 
		//if (enable) begin
			
			m1 = matrix[countMedianY-1][countMedian-1];
			m2 = matrix[countMedianY-1][countMedian];
			m3 = matrix[countMedianY-1][countMedian+1];
			m4 = matrix[countMedianY][countMedian-1];
			m5 = matrix[countMedianY][countMedian];
			m6 = matrix[countMedianY][countMedian+1];
			m7 = matrix[countMedianY+1][countMedian-1];
			m8 = matrix[countMedianY+1][countMedian];
			m9 = matrix[countMedianY+1][countMedian+1];
			$display("Before sorting: m1=%h, m2=%h, m3=%h, m4=%h, m5=%h, m6=%h, m7=%h, m8=%h, m9=%h", m1, m2, m3, m4, m5, m6, m7, m8, m9);

			
			// Ordenar valores (burbuja)
			/*
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
			
			if (m1 > m2) begin temp = m1; m1 = m2; m2 = temp; end
			if (m2 > m3) begin temp = m2; m2 = m3; m3 = temp; end
			if (m3 > m4) begin temp = m3; m3 = m4; m4 = temp; end
			if (m4 > m5) begin temp = m4; m4 = m5; m5 = temp; end
			if (m5 > m6) begin temp = m5; m5 = m6; m6 = temp; end
			if (m6 > m7) begin temp = m6; m6 = m7; m7 = temp; end
			
			if (m1 > m2) begin temp = m1; m1 = m2; m2 = temp; end
			if (m2 > m3) begin temp = m2; m2 = m3; m3 = temp; end
			if (m3 > m4) begin temp = m3; m3 = m4; m4 = temp; end
			if (m4 > m5) begin temp = m4; m4 = m5; m5 = temp; end
			if (m5 > m6) begin temp = m5; m5 = m6; m6 = temp; end
			
			if (m1 > m2) begin temp = m1; m1 = m2; m2 = temp; end
			if (m2 > m3) begin temp = m2; m2 = m3; m3 = temp; end
			if (m3 > m4) begin temp = m3; m3 = m4; m4 = temp; end
			if (m4 > m5) begin temp = m4; m4 = m5; m5 = temp; end
			
			if (m1 > m2) begin temp = m1; m1 = m2; m2 = temp; end
			if (m2 > m3) begin temp = m2; m2 = m3; m3 = temp; end
			if (m3 > m4) begin temp = m3; m3 = m4; m4 = temp; end
			
			if (m1 > m2) begin temp = m1; m1 = m2; m2 = temp; end
			if (m2 > m3) begin temp = m2; m2 = m3; m3 = temp; end
			
			if (m1 > m2) begin temp = m1; m1 = m2; m2 = temp; end
			$display("After sorting: m1=%h, m2=%h, m3=%h, m4=%h, m5=%h, m6=%h, m7=%h, m8=%h, m9=%h", m1, m2, m3, m4, m5, m6, m7, m8, m9);

			result = m5;
			$display("Result: %h", result);
		end

	//end
endmodule*/	 
  