`timescale 1ns / 1ps

module tb_boolean_expression_3;
    reg  A, B, C, D;
    wire Y;

    boolean_expression_3 uut (A, B, C, D, Y);
    initial begin
        $dumpfile("wave.vcd");
      $dumpvars(0, tb_boolean_expression_3);
        A=0; B=0; C=0; D=0; #10;
        A=0; B=0; C=0; D=1; #10;
        A=0; B=0; C=1; D=0; #10;
        A=0; B=0; C=1; D=1; #10;
        A=0; B=1; C=0; D=0; #10;
        A=0; B=1; C=0; D=1; #10;
        A=0; B=1; C=1; D=0; #10;
        A=0; B=1; C=1; D=1; #10;
        A=1; B=0; C=0; D=0; #10;
        A=1; B=0; C=0; D=1; #10;
        A=1; B=0; C=1; D=0; #10;
        A=1; B=0; C=1; D=1; #10;
        A=1; B=1; C=0; D=0; #10;
        A=1; B=1; C=0; D=1; #10;
        A=1; B=1; C=1; D=0; #10;
        A=1; B=1; C=1; D=1; #10;
        $finish;
    end
endmodule
