`timescale 1 ps / 1 ps
module mediaFilter_tb;

    logic clk, wren;
    logic [7:0] board_out [0:99][0:99];

    mediaFilter dut (
        .clk(clk),
        .board_out(board_out)
    );

    initial begin
        clk = 1;
        wren = 0;

        #10; // Wait a bit before starting the clock

        // Simulate until the counter reaches 64
        repeat (49804) begin
            #5 clk = ~clk;
        end

        // Print the matrix
        /*$display("Matrix at Counter = 10000:");
        for (int i = 0; i < 100; i = i + 1) begin
            $write("Row %0d: ", i);
            for (int j = 0; j < 100; j = j + 1) begin
                $write("%02X ", board_out[i][j]);
            end
            $display(""); // Move to the next line after printing a row
        end*/

        $stop; // Stop simulation
    end

    

endmodule