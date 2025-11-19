`timescale 1ns / 1ps

module tb_boolean_expression;
    reg  A, B, C;
    wire Y;

    boolean_expression uut (A, B, C, Y);

    initial begin
      
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_boolean_expression);

        A=0; B=0; C=0; #10;
        A=0; B=0; C=1; #10;
        A=0; B=1; C=0; #10;
        A=0; B=1; C=1; #10;
        A=1; B=0; C=0; #10;
        A=1; B=0; C=1; #10;
        A=1; B=1; C=0; #10;
        A=1; B=1; C=1; #10;

        $finish;
    end
endmodule
