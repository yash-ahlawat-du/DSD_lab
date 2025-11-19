module logic_gates(a, b, and_out, or_out, not_out);
    input a, b;
    output and_out, or_out, not_out;

    assign and_out = a & b;   // AND Gate
    assign or_out  = a | b;   // OR Gate
    assign not_out = ~a;      // NOT Gate
endmodule
