module bit_comparator (
    input a, 
    input b, 
    input eq, 
    input gt, 
    input lt, 
    output aeqb, 
    output altb, 
    output agtb
);
    /*
    assign eq[1] = eq[0] & !(a[1] ^ b[1]);
    assign gt[1] = (a[1] & ~b[1]) | (!(a[1] ^ b[1]) & gt[0]);
    assign lt[1] = (~a[1] & b[1]) | (!(a[1] ^ b[1]) & lt[0]);
    */
    assign aeqb = eq & !(a ^ b);
    assign agtb = (a & !b) | (!(a ^ b) & gt);
    assign altb = (!a & b) | (!(a ^ b) & lt);
    
endmodule