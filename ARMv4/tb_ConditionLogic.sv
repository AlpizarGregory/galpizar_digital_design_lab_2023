module tb_ConditionLogic;

    // Inputs
    logic [3:0] cond, aluFlags;
    logic [1:0] flagW;
    logic pcs, regW, memW, clk, rst;

    // Outputs
    logic pcSrc, regWrite, memWrite;

    // Instantiate the ConditionLogic module
    ConditionLogic uut (
        .cond(cond),
        .aluFlags(aluFlags),
        .flagW(flagW),
        .pcs(pcs),
        .regW(regW),
        .memW(memW),
        .clk(clk),
        .rst(rst),
        .pcSrc(pcSrc),
        .regWrite(regWrite),
        .memWrite(memWrite)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        rst = 0;
        cond = 4'b0000;
        aluFlags = 4'b0000;
        flagW = 2'b00;

        // Apply reset
        #10 rst = 1;

        // Provide test vectors
        // TODO: Add your test vectors here

        #100 $finish;
    end

endmodule
