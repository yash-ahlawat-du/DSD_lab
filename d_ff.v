`timescale 1ns/1ps
module d_ff_neg (
    input  D,
    input  CLK,
    output reg Q
);
    always @(negedge CLK)
        Q <= D;
endmodule

`timescale 1ns/1ps
module tb_d_ff_neg;

    reg D, CLK;
    wire Q;

    d_ff_neg uut (D, CLK, Q);

    initial begin
        $dumpfile("d_ff_neg.vcd");
        $dumpvars(0, tb_d_ff_neg);
    end

    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end
    initial begin
        D = 0; #12;
        D = 1; #10;
        D = 0; #10;
        D = 1; #10;
        D = 0; #10;
        $finish;
    end

endmodule

      
