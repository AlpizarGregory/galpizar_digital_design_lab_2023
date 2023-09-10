module comparator #(parameter N = 4) (
    input [N-1:0] a, 
    input [N-1:0] b, 
    output aeqb, 
    output agtb, 
    output altb);


    wire [N-1:0] eq, gt, lt;

    assign eq[0] = !(a[0] ^ b[0]);
    assign gt[0] = a[0] & ~b[0];
    assign lt[0] = ~a[0] & b[0];

    /*
    assign eq[1] = eq[0] & !(a[1] ^ b[1]);
    assign gt[1] = (a[1] & ~b[1]) | (!(a[1] ^ b[1]) & gt[0]);
    assign lt[1] = (~a[1] & b[1]) | (!(a[1] ^ b[1]) & lt[0]);
    */

    generate
        genvar i;
        for (i = 1; i < N; i++) begin : xd
            bit_comparator bit_comp_inst(
                .a(a[i]),
                .b(b[i]),
                .eq(eq[i-1]),
                .gt(gt[i-1]),
                .lt(lt[i-1]),
                .aeqb(eq[i]),
                .agtb(gt[i]),
                .altb(lt[i])
            );
        end
    endgenerate

    assign aeqb = eq[N-1];
    assign agtb = gt[N-1];
    assign altb = lt[N-1];
	 
endmodule