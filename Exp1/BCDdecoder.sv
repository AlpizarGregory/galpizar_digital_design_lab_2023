module BCDdecoder(input logic [3:0] binary, output logic [7:0] bcd);
	
	logic [7:0 ]dec;
	//logic [7:0 ]dec2;
	
	/*
	if (dec[3]) y = 4'b1000;
	else if (a[2]) y = 4'b0100;
	else if (a[1]) y = 4'b0010;
	else if (a[0]) y = 4'b0001;
	else y = 4'b0000;
	*/
	
	always_comb
		case(binary)
			4'b0000: dec = 4'b0000;
			4'b0001: dec = 4'b0001;
			4'b0010: dec = 4'b0010;
			4'b0011: dec = 4'b0011;
			4'b0100: dec = 4'b0100;
			4'b0101: dec = 4'b0101;
			4'b0110: dec = 4'b0110;
			4'b0111: dec = 4'b0111;
			4'b1000: dec = 4'b1000;
			4'b1001: dec = 4'b1001;
			4'b1010: dec = 8'b00010000;	
			4'b1011: dec = 8'b00010001;
			4'b1100: dec = 8'b00010010;
			4'b1101: dec = 8'b00010011;
			4'b1110: dec = 8'b00010100;
			4'b1111: dec = 8'b00010101;
			default: dec = 8'bxxxxxxxx;
			
		endcase
			
	assign bcd = dec;
	
endmodule