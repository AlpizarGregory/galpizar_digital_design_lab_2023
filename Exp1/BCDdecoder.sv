module BCDdecoder(input logic [3:0] binary, output logic [8:0] bcd);
	
	logic [8:0 ]dec;
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
			//	1234           bcabcdefg
			4'b0000: dec = 9'b110000001; // 0
			4'b0001: dec = 9'b111001111; // 1
			4'b0010: dec = 9'b110010010; // 2
			4'b0011: dec = 9'b110000110; // 3
			4'b0100: dec = 9'b111001100; // 4
			4'b0101: dec = 9'b110100100; // 5
			4'b0110: dec = 9'b110100000; // 6
			4'b0111: dec = 9'b110001111; // 7
			4'b1000: dec = 9'b110000000; // 8
			4'b1001: dec = 9'b110000100; // 9
			4'b1010: dec = 9'b000000001; //10
			4'b1011: dec = 9'b001001111; //11
			4'b1100: dec = 9'b000010010; //12
			4'b1101: dec = 9'b000000110; //13
			4'b1110: dec = 9'b001001100; //14
			4'b1111: dec = 9'b000100100; //15
			default: dec = 9'bxxxxxxxxx; //16
			
		endcase
			
	assign bcd = dec;
	
endmodule