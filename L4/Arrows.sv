module Arrows (
input [3:0] arrows,
input clk,
output moving
);
    reg [24:0] counter;

    initial counter = 0;

    reg mtemp;

    always @(posedge clk) begin
        counter <= counter + 1;
        mtemp <= 0;

        if (counter == 25'd25000000) begin
            counter <= 0;
            mtemp <= arrows[0] | arrows[1] | arrows[2] | arrows[3];
        end
    end

    assign moving = mtemp;
	
endmodule