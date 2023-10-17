module colores( input logic [3:0]state,
						input logic inpos,
						output logic [23:0]rgb
						);
						
		logic [23:0]out_rgb;
		//logic inpos;
		 
		//assign inpos = ((minx < hs)&(maxx > hs)&(miny < vs)&(maxy > vs))? 1:0;
		
		always @(*) begin
			case({state})
				
				4'h0 : out_rgb <= 24'h7673D6; // ninguna bomba adyacente 		azul gris
				4'h1 : out_rgb <= 24'h73B5D6; // una bombas adyacentes 			celeste gris
				4'h2 : out_rgb <= 24'h73D6A2; // dos bombas adyacentes 			verde gris
				4'h3 : out_rgb <= 24'h76D673; // tres bombas adyacentes 		verde amarillo gris
				4'h4 : out_rgb <= 24'hBED673; // cuatro bombas adyacentes 		amarillo gris
				4'h5 : out_rgb <= 24'hD6CA73; // cinco bombas adyacentes 		amarillo naranja gris
				4'h6 : out_rgb <= 24'hD69B73; // seis bombas adyacentes 		naranja gris
				4'h7 : out_rgb <= 24'hD67373; // siete bombas adyacentes 		rojo gris
				4'h8 : out_rgb <= 24'hB1B1B1; // casilla limpia 				gris
				4'h9 : out_rgb <= 24'h818181; // casilla seleccionada 			gris oscuro
				4'hA : out_rgb <= 24'hE8E8E8;// casilla actual					gris claro
				4'hB : out_rgb <= 24'h793960; // casilla con posible bomba 		violeta
				4'hC : out_rgb <= 24'h660000; // juego perdido 					rojo oscuro
				4'hD : out_rgb <= 24'h43C043; // juego ganado	 				verde claro
				default : out_rgb <= 24'h000000; // negro
				
			endcase
		end
			
		assign rgb = out_rgb; 
			
endmodule
						
			