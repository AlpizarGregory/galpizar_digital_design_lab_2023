module VGA_controller (
	input clk,
	output Hsync,
	output Vsync
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
endmodule