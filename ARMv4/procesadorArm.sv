
module procesadorArm(input logic clk, rst, output logic  [7:0]r,g,b, output logic clk_25,
				output  logic H_SYNC, V_SYNC, SYNC_B, SYNC_BLANK);

	logic [9:0] cuentaX,cuentaY;
	
	logic [7:0] ram_vga;
	
	logic [16:0] vga_addr;
	
	
	
	//--------------Instancia del divisor de clock-------------------------//
	
	divisorClock DV(clk,clk_25);
	

	//--------------Instancia del controlador VGA--------------------------//		
	
	//controladorVGA CNTVGA(clk_25,H_SYNC,V_SYNC,SYNC_B,SYNC_BLANK, cuentaX,cuentaY);
	
	//videocontroller VC(cuentaX,cuentaY, vga_addr);
	
	procesador PR(clk, rst, clk_25, vga_addr, ram_vga);
	
	assign r = ram_vga;
	assign g = ram_vga;
	assign b = ram_vga;					  

endmodule




module divisorClock(input logic clock, 
	               output logic clock_25);

	   reg [15:0] cnt;
	   
		//------------------------------------Divisor de Clock-------------------------------
	   always @(posedge clock)
      {clock_25, cnt} <= cnt + 16'h8000; // El clock de la DE1-SoC es de 50MHz, para llegar a 25MHz se debe dividir por 2-> (2^(16))/2 = 32768 ->Hex = 8000;
		

endmodule