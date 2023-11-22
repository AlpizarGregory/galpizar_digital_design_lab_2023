module mediaFilter(input logic clk, output logic [7:0] board_out [0:99][0:99]);
	logic [13:0] count = 14'b00000000000000;
	logic [13:0] count2 = 14'b00000000000000;
	logic [13:0] count3 = 14'b00000000000000;
	logic wren;
	logic [7:0] q;
	logic [7:0] data;
	logic en = 1;
	logic en2 = 1;
	logic [6:0] x = 7'b0000000;
	logic [6:0] y = 7'b0000000;
	logic [6:0] x2 = 7'b0000000;
	logic [6:0] y2 = 7'b0000000;
	
	logic [7:0] m1,m2,m3,m4,m5,m6,m7,m8,m9;
	
	ram1 memm(count, clk, data, wren, q);
	logic [7:0] temp;
	
	logic [6:0] countY = 7'b0000001;
	logic [6:0] countX = 7'b0000001;
	logic [7:0] result;
	logic [3:0] divisor = 4'b1001;
	
	always_ff @(negedge clk) begin
	   $display("count = %0d, x = %0d, y = %0d, q = %h", count, x, y, q);
		m1 = board_out[countY-1][countX-1];
		m2 = board_out[countY-1][countX];
		m3 = board_out[countY-1][countX+1];
		m4 = board_out[countY][countX-1];
		m5 = board_out[countY][countX];
		m6 = board_out[countY][countX+1];
		m7 = board_out[countY+1][countX-1];
		m8 = board_out[countY+1][countX];
		m9 = board_out[countY+1][countX+1];
		$display("Values: m1=%d, m2=%d, m3=%d, m4=%d, m5=%d, m6=%d, m7=%d, m8=%d, m9=%d", m1, m2, m3, m4, m5, m6, m7, m8, m9);
		result = (m1+m2+m3+m4+m5+m6+m7+m8+m9)/divisor;	
		$display("Result: %d, m5: %d", result, m5);
		
		if (!en2) begin
			if (y2 < 7'b1100100 && x2 < 7'b1100100) begin
					data = board_out[y2][x2];
					wren = 1;
					x2 = x2 + 1;
			  end else if (y2 < 7'b1100100) begin
					x2 = 7'b0000000;
					y2 = y2 + 1;
					data= board_out[y2][x2];
					wren = 1;
					x2 = x2 + 1;
			  end	

			if (count != 10000) begin
				$display("EL VALOR DE Q: q=%h", q);

				count = count + 1;
			end else begin
				en = 0;


			end
		end
		
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
			if (countX < 7'b1100010 && countY < 7'b1100010) begin
				board_out[countY][countX] = result;
				countX = countX + 1;
				
			end else if (countY < 7'b1100010) begin
				countX = 7'b0000001;
				countY = countY + 1;
				board_out[countY][countX] = result;
				countX = countX + 1;
				
			end
			if (count2 != 9604) begin
				count2 = count2 + 1;
			end else begin
				en2 = 0;
				en = 1;
				count = 14'b00000000000000;
				
			end
			
		end
	end
endmodule