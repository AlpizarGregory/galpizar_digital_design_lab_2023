module comparator (
    input [3:0] a, 
    input [3:0] b, 
    output aeqb, 
    output agtb, 
    output altb);


    wire [3:0] eq, gt, lt;

    assign eq[0] = !(a[0] ^ b[0]);
    assign gt[0] = a[0] & ~b[0];
    assign lt[0] = ~a[0] & b[0];

    assign eq[1] = eq[0] & !(a[1] ^ b[1]);
    assign gt[1] = (a[1] & ~b[1]) | (!(a[1] ^ b[1]) & gt[0]);
    assign lt[1] = (~a[1] & b[1]) | (!(a[1] ^ b[1]) & lt[0]);

    assign eq[2] = eq[1] & !(a[2] ^ b[2]);
    assign gt[2] = (a[2] & ~b[2]) | (!(a[2] ^ b[2]) & gt[1]);
    assign lt[2] = (~a[2] & b[2]) | (!(a[2] ^ b[2]) & lt[1]);

    assign eq[3] = eq[2] & !(a[3] ^ b[3]);
    assign gt[3] = (a[3] & ~b[3]) | (!(a[3] ^ b[3]) & gt[2]);
    assign lt[3] = (~a[3] & b[3]) | (!(a[3] ^ b[3]) & lt[2]);


    assign aeqb = eq[3];
    assign agtb = gt[3];
    assign altb = lt[3];

/*
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
*/
endmodule