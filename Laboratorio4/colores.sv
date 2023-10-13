module colores( input logic [3:0]state,
						input logic inpos,
						output logic [23:0]rgb
						);
						
		logic [23:0]out_rgb;
		//logic inpos;
		 
		//assign inpos = ((minx < hs)&(maxx > hs)&(miny < vs)&(maxy > vs))? 1:0;
		
		always @(*) begin
			case({state})
				
				4'h0 : out_rgb <= 24'h88B0B1; // una bomba adyacente 		aqua gris
				4'h1 : out_rgb <= 24'h88B19F; // dos bombas adyacentes 		esmeralda gris
				4'h2 : out_rgb <= 24'h8DB188; // tres bombas adyacentes 	verde gris
				4'h3 : out_rgb <= 24'hA0B188; // cuatro bombas adyacentes 	lima gris
				4'h4 : out_rgb <= 24'hADB188; // cinco bombas adyacentes 	amarillo gris
				4'h5 : out_rgb <= 24'hB19D88; // seis bombas adyacentes 	naranja gris
				4'h6 : out_rgb <= 24'hB18888; // siete bombas adyacentes 	rojo gris
				4'h7 : out_rgb <= 24'hB1B1B1; // casilla limpia 			gris
				4'h8 : out_rgb <= 24'h818181; // casilla seleccionada 		gris oscuro
				4'h9 : out_rgb <= 24'h8E3030; // juego perdido 				rojo
				4'hA : out_rgb <= 24'h43C043; // juego ganado	 			verde
				default : out_rgb <= 24'h000000; // negro
				
			endcase
		end
			
		assign rgb = out_rgb; 
			
endmodule
						
						