module tb_Decoder;

    // Inputs
    logic [1:0] op;
    logic [5:0] funct;
    logic [3:0] Rd;

    // Outputs
    logic [1:0] flagW, immSrc, regSrc, aluControl;
    logic pcs, regW, memW, memtoReg, aluSrc;

    // Instantiate the Decoder module
    Decoder uut (
        .op(op),
        .funct(funct),
        .Rd(Rd),
        .flagW(flagW),
        .immSrc(immSrc),
        .regSrc(regSrc),
        .aluControl(aluControl),
        .pcs(pcs),
        .regW(regW),
        .memW(memW),
        .memtoReg(memtoReg),
        .aluSrc(aluSrc)
    );

    // Test stimulus
    initial begin
        // Provide test vectors
        // TODO: Add your test vectors here

        #100 $finish;
    end

endmodule
