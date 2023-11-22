module tb_MainDecoder;

    // Inputs
    logic [1:0] op;
    logic func5, func0;

    // Outputs
    logic branch, memtoReg, memW, aluSrc, regW, aluOp;
    logic [1:0] immSrc, regSrc;

    // Instantiate the MainDecoder module
    MainDecoder uut (
        .op(op),
        .func5(func5),
        .func0(func0),
        .branch(branch),
        .memtoReg(memtoReg),
        .memW(memW),
        .aluSrc(aluSrc),
        .regW(regW),
        .aluOp(aluOp),
        .immSrc(immSrc),
        .regSrc(regSrc)
    );

    // Test stimulus
    initial begin
        // Provide test vectors
        // TODO: Add your test vectors here

        #100 $finish;
    end

endmodule
