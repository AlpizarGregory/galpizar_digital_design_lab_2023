module comparator (
    input [3:0] a, 
    input [3:0] b, 
    output aeqb, 
    output agtb, 
    output altb);

    logic [4:0] eq, gt, lt;

    assign eq[0] = 1'b1;
    assign gt[0] = 1'b0;
    assign lt[0] = 1'b0;

    generate
        genvar i;
        for (i = 0; i < 4; i++) begin : bit_comparation
            bit_comparator bit_comp_inst(
                .a(a[i]),
                .b(b[i]),
                .eq(eq[i+1]),
                .aeqb(eq[i]),
                .agtb(gt[i]),
                .altb(lt[i])
            );
        end
    endgenerate

    assign aeqb = eq[4];
    assign agtb = gt[3];
    assign altb = lt[3];

endmodule