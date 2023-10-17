module VGA_controller (
	input clk,
	output Hsync,
	output Vsync,
	output [7:0] Red,
	output [7:0] Green,
	output [7:0] Blue
	);

	wire clk_25MHz;
	wire enable_V_Counter;
	wire [15:0] H_Count_Value;
	wire [15:0] V_Count_Value;

	clock_divider clock_divider_25MHz(clk, clk_25MHz);
	horizontal_counter horizontal_counter_640x480(clk_25MHz, enable_V_Counter, H_Count_Value);
	vertical_counter vertical_counter_640x480(clk_25MHz, enable_V_Counter, V_Count_Value);

	// outputs

	assign Hsync = (H_Count_Value < 96) ? 1'b1: 1'b0;
	assign Vsync = (V_Count_Value < 2) ? 1'b1: 1'b0;
	
	// pantalla en blanco
	assign Red  = (H_Count_Value < 784) && H_Count_Value > 143 && V_Count_Value < 515 && V_Count_Value > 34 ? 4'hF: 4'h0;
	assign Green = (H_Count_Value < 784) && H_Count_Value > 143 && V_Count_Value < 515 && V_Count_Value > 34 ? 4'hF: 4'h0;
	assign Blue = (H_Count_Value < 784) && H_Count_Value > 143 && V_Count_Value < 515 && V_Count_Value > 34 ? 4'hF: 4'h0;
	
endmodule