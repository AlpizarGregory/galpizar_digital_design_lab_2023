module colores( input logic [2:0]state,
						input logic inpos,
						output logic [23:0]rgb
						);
						
		logic [23:0]out_rgb;
		//logic inpos;
		 
		//assign inpos = ((minx < hs)&(maxx > hs)&(miny < vs)&(maxy > vs))? 1:0;
		
		always @(*)
			begin
				case({state})
				
				4'b0000 : out_rgb <= 24'b000000000000000000000000; //0     negro
				4'b0001 : out_rgb <= 24'b001111001011001101110001; //2     medium sea green
				4'b0010 : out_rgb <= 24'b111111111000000000000000; //4     naranja
				4'b0011 : out_rgb <= 24'b110000000000000011000000; //8     morado oscuro
				4'b0100 : out_rgb <= 24'b111111111111111100000000; //16    amarillo
				4'b0101 : out_rgb <= 24'b111111110000000000000000; //32    rojo
				4'b0110 : out_rgb <= 24'b000000001111111111111111; //64    cian claro
				4'b0111 : out_rgb <= 24'b111111111001100110011001; //128   rosado
				4'b1000 : out_rgb <= 24'b110011000011001111001100; //256   verde claro
				4'b1001 : out_rgb <= 24'b000000000000000011111111; //512   azul
				4'b1010 : out_rgb <= 24'b100000001000000000000000; //1024  olivo?
				4'b1011 : out_rgb <= 24'b101110001000011000001011; //2048  oro oscuro?
				//4'b1100 : out_rgb <= 24'hB1B1B1; // casilla limpia
				//4'b1101 : out_rgb <= 24'h818181; // casilla seleccionada
				//4'b1110 : out_rgb <= 24'hff0000; // casilla con bomba
				                       //012345670123456701234567 
				default : out_rgb <= 24'b111111111111111111111111; // blanco
				
				endcase
			end
			
		assign rgb = out_rgb; 
			
endmodule
						
						