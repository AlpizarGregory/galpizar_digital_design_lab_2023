module bit_comparator_tb;

    logic a, b, eq, aeqb, agtb, altb;

    bit_comparator bit_comparator_inst(
        .a(a),
        .b(b),
        .eq(eq),
        .aeqb(aeqb),
        .agtb(agtb),
        .altb(altb)
    );

    initial begin
        $display("Testing bit_comparator");
        a = 0;
        b = 0;
        #10;
        $display("a = %b, b = %b, eq = %b, aeqb = %b, agtb = %b, altb = %b", a, b, eq, aeqb, agtb, altb);

        a = 0;
        b = 1;
        #10;
        $display("a = %b, b = %b, eq = %b, aeqb = %b, agtb = %b, altb = %b", a, b, eq, aeqb, agtb, altb);

        a = 1;
        b = 0;
        #10;
        $display("a = %b, b = %b, eq = %b, aeqb = %b, agtb = %b, altb = %b", a, b, eq, aeqb, agtb, altb);

        a = 1;
        b = 1;
        #10;
        $display("a = %b, b = %b, eq = %b, aeqb = %b, agtb = %b, altb = %b", a, b, eq, aeqb, agtb, altb);
    end
    
endmodule