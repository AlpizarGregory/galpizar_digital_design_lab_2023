module middleFilter(input logic clk,output logic [7:0] board_out [0:99][0:99], output logic [7:0] resultFinal);
	logic [13:0] count = 14'b00000000000000;
	logic wren;
	logic [7:0] q;
	logic [7:0] data;
	logic en = 1;
	logic [6:0] x = 7'b0000000;
	logic [6:0] y = 7'b0000000;
	
	logic [7:0] m1,m2,m3,m4,m5,m6,m7,m8,m9;
	
	ram1 memm(count, clk, data, wren, q);
	
	
	logic [6:0] countMedianY = 7'b0000000;
	logic [6:0] countMedian = 7'b0000000;
	Median men(clk, countMedianY, countMedian, en,board_out,resultFinal);
	
	always_ff @(negedge clk) begin
	   $display("count = %0d, x = %0d, y = %0d, q = %h", count, x, y, q);
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
			if (countMedian < 7'b1100011 && countMedianY < 7'b1100011) begin
				/*

				if (board_out[countMedianY][countMedian]==resultFinal) begin //1
					board_out[countMedianY][countMedian] = board_out[countMedianY+1][countMedian+1];
					
				end else if (board_out[countMedianY][countMedian+1]==resultFinal) begin//2
					board_out[countMedianY][countMedian+1] = board_out[countMedianY+1][countMedian+1];
					
				end else if (board_out[countMedianY][countMedian+2]==resultFinal) begin//3
					board_out[countMedianY][countMedian+2] = board_out[countMedianY+1][countMedian+1];
				
				end else if (board_out[countMedianY+1][countMedian]==resultFinal) begin//4
					board_out[countMedianY+1][countMedian] = board_out[countMedianY+1][countMedian+1];
				
				end else if (board_out[countMedianY+1][countMedian+2]==resultFinal) begin//6
					board_out[countMedianY+1][countMedian+2] = board_out[countMedianY+1][countMedian+1];
				
				end else if (board_out[countMedianY+2][countMedian]==resultFinal) begin//7
					board_out[countMedianY+2][countMedian] = board_out[countMedianY+1][countMedian+1];
				
				end else if (board_out[countMedianY+2][countMedian+1]==resultFinal) begin//8
					board_out[countMedianY+2][countMedian+1] = board_out[countMedianY+1][countMedian+1];
				
				end else if (board_out[countMedianY+2][countMedian+2]==resultFinal) begin//9
					board_out[countMedianY+2][countMedian+2] = board_out[countMedianY+1][countMedian+1];
				
				end */

				board_out[countMedianY+1][countMedian+1] = resultFinal;
				countMedian = countMedian + 3;
			end else if (countMedian < 7'b1100011) begin
				countMedian = 7'b0000000;
				countMedianY = countMedianY + 3;
				/*

				if (board_out[countMedianY][countMedian]==resultFinal) begin //1
					board_out[countMedianY][countMedian] = board_out[countMedianY+1][countMedian+1];
					
				end else if (board_out[countMedianY][countMedian+1]==resultFinal) begin//2
					board_out[countMedianY][countMedian+1] = board_out[countMedianY+1][countMedian+1];
					
				end else if (board_out[countMedianY][countMedian+2]==resultFinal) begin//3
					board_out[countMedianY][countMedian+2] = board_out[countMedianY+1][countMedian+1];
				
				end else if (board_out[countMedianY+1][countMedian]==resultFinal) begin//4
					board_out[countMedianY+1][countMedian] = board_out[countMedianY+1][countMedian+1];
				
				end else if (board_out[countMedianY+1][countMedian+2]==resultFinal) begin//6
					board_out[countMedianY+1][countMedian+2] = board_out[countMedianY+1][countMedian+1];
				
				end else if (board_out[countMedianY+2][countMedian]==resultFinal) begin//7
					board_out[countMedianY+2][countMedian] = board_out[countMedianY+1][countMedian+1];
				
				end else if (board_out[countMedianY+2][countMedian+1]==resultFinal) begin//8
					board_out[countMedianY+2][countMedian+1] = board_out[countMedianY+1][countMedian+1];
				
				end else if (board_out[countMedianY+2][countMedian+2]==resultFinal) begin//9
					board_out[countMedianY+2][countMedian+2] = board_out[countMedianY+1][countMedian+1];
				
				end */

				board_out[countMedianY+1][countMedian+1] = resultFinal;
				countMedian = countMedian + 3;
			end	
			
		end
	end
endmodule

module Median(
	input logic clk,
	input logic [6:0] countMedianY,
	input logic [6:0] countMedian,
	input logic enable,
	input logic [7:0] matrix [0:99][0:99],
	output logic [7:0] result
);
	logic [7:0] matrix2 [0:99][0:99];
	 
   // Ejemplo de obtener la mediana sin funciones
	logic [7:0] m1, m2, m3, m4, m5, m6, m7, m8, m9;
	logic [7:0] temp;
	always_ff @(negedge clk) begin
		if (!enable) begin
			m1 = 8'h00;
			m2 = 8'h00;
			m3 = 8'h00;
			m4 = 8'h00;
			m5 = 8'h00;
			m6 = 8'h00;
			m7 = 8'h00;
			m8 = 8'h00;
			m9 = 8'h00;
			
			m1 = matrix[countMedianY][countMedian];
			m2 = matrix[countMedianY][countMedian+1];
			m3 = matrix[countMedianY][countMedian+2];
			m4 = matrix[countMedianY+1][countMedian];
			m5 = matrix[countMedianY+1][countMedian+1];
			m6 = matrix[countMedianY+1][countMedian+2];
			m7 = matrix[countMedianY+2][countMedian];
			m8 = matrix[countMedianY+2][countMedian+1];
			m9 = matrix[countMedianY+2][countMedian+2];
			
			
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
			result = m5;
		end
	end
endmodule	 
  