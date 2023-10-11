module mux_dibujar(

	input logic line,
	input logic [23:0]rgb0,rgb1,rgb2,rgb3,rgb4,rgb5,rgb6,rgb7,rgb8,rgb9,rgb10,rgb11,rgb12,rgb13,rgb14,rgb15,
	input logic pos0,pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9,pos10,pos11,pos12,pos13,pos14,pos15,
	input logic win,lose,
	output logic [7:0]r,g,b

);

	logic[23:0]out_rgb;
	
	always_comb begin   
				 // 0    1    2    3     4   5    6    7    8    9    A     B     C     D     E     F     G
			case ({line,pos0,pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9,pos10,pos11,pos12,pos13,pos14,pos15,win,lose})
			
			19'b0000000000000000000 : out_rgb     <= 24'h000000;
			19'b1000000000000000000 : out_rgb     <= 24'hffffff;
			19'b0100000000000000000 : out_rgb     <= rgb0;
			19'b0010000000000000000 : out_rgb     <= rgb1;
			19'b0001000000000000000 : out_rgb     <= rgb2;
			19'b0000100000000000000 : out_rgb     <= rgb3;
			19'b0000010000000000000 : out_rgb     <= rgb4;
			19'b0000001000000000000 : out_rgb     <= rgb5;
			19'b0000000100000000000 : out_rgb     <= rgb6;
			19'b0000000010000000000 : out_rgb     <= rgb7;
			19'b0000000001000000000 : out_rgb     <= rgb8;
			19'b0000000000100000000 : out_rgb     <= rgb9;
			19'b0000000000010000000 : out_rgb     <= rgb10;
			19'b0000000000001000000 : out_rgb     <= rgb11;
			19'b0000000000000100000 : out_rgb     <= rgb12;
			19'b0000000000000010000 : out_rgb     <= rgb13;
			19'b0000000000000001000 : out_rgb     <= rgb14;
			19'b0000000000000000100 : out_rgb     <= rgb15;
			  //0123456789ABCDEFG
			
			//Casos win/lose
			19'b1000000000000000010 : out_rgb     <= 24'b000000000000000011111111;
			19'b1000000000000000001 : out_rgb     <= 24'b111111110000000000000000;
			
			default  : out_rgb <= 24'hffffff;
			
			endcase
		end
		
	assign r = out_rgb[23:16];
	assign g = out_rgb[15:8];
	assign b = out_rgb[7:0];
	
endmodule