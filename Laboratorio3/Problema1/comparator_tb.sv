module comparator_tb;

    logic [3:0] a, b;
    
    logic aeqb, agtb, altb;

    comparator comp_inst(
        .a(a),
        .b(b),
        .aeqb(aeqb),
        .agtb(agtb),
        .altb(altb)
    );

    initial begin
        $display("Testing comparator");
        a = 4'b0000;
        b = 4'b0000;
        aeqb = 1'b1;
        altb = 1'b0;
        agtb = 1'b0;

        repeat (34) begin
            #10;
            $display("a = %b, b = %b, aeqb = %b, altb = %b, agtb = %b", a, b, aeqb, altb, agtb);
            a = a + 1'b1;
            b = b + 2'b10;
            aeqb = 1'b1;
            altb = 1'b0;
            agtb = 1'b0;

        end

    end

endmodule