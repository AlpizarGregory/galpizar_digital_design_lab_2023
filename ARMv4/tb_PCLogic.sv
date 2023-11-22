module tb_PCLogic;

    // Inputs
    logic [3:0] Rd;
    logic branch, regW;

    // Outputs
    logic pcs;

    // Instantiate the PCLogic module
    PCLogic uut (
        .Rd(Rd),
        .branch(branch),
        .regW(regW),
        .pcs(pcs)
    );

    // Test stimulus
    initial begin
        // Provide test vectors
        // TODO: Add your test vectors here

        #100 $finish;
    end

endmodule
