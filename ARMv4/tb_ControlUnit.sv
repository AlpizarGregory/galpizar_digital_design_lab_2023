module tb_ControlUnit;

    // Inputs
    logic clk, rst;
    logic [3:0] cond, aluFlags, rd;
    logic [1:0] op;
    logic [5:0] funct;

    // Outputs
    logic pcSrc, regWrite, memWrite, memtoReg, aluSrc;
    logic [1:0] immSrc, regSrc, aluControl;

    // Instantiate the ControlUnit module
    ControlUnit uut (
        .clk(clk),
        .rst(rst),
        .cond(cond),
        .aluFlags(aluFlags),
        .rd(rd),
        .op(op),
        .funct(funct),
        .pcSrc(pcSrc),
        .regWrite(regWrite),
        .memWrite(memWrite),
        .memtoReg(memtoReg),
        .aluSrc(aluSrc),
        .immSrc(immSrc),
        .regSrc(regSrc),
        .aluControl(aluControl)
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
        rd = 4'b0000;
        op = 2'b00;
        funct = 6'b000000;

        // Apply reset
        #10 rst = 1;

        // Provide test vectors
        // TODO: Add your test vectors here

        #100 $finish;
    end

endmodule
