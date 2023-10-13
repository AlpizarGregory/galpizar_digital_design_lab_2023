module arrowtb;

    logic [3:0] arrows;
    logic clk, moving;

    Arrows arr(.arrows(arrows), .clk(clk), .moving(moving));

    initial begin
        clk = 0;
        arrows = 4'b0010;
		  #75000000 $finish;
    end

    

    always #1 clk = ~clk;

endmodule