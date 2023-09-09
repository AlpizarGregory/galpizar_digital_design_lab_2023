module bit_comparator (input a, input b, input eq, output aeqb, output altb, output agtb);

    assign aeqb = !(a ^ b) & eq;
    assign altb = (!a & b);
    assign agtb = (a & !b);
    
endmodule