`timescale 1ns / 1ps
module tb_xor_gate;
    reg  A, B;
    wire Y;
    xor_gate dut (
        .A(A),
        .B(B),
        .Y(Y)
    );
    initial begin
        $dumpfile("xor_gate_tb.vcd");
        $dumpvars(0, tb_xor_gate, tb_xor_gate.dut);
    end
    initial begin
        $display("Time | A B | Y");
        $display("----------------");
        A=0; B=0; #10; $display("%0t | %b %b | %b", $time, A, B, Y);
        A=0; B=1; #10; $display("%0t | %b %b | %b", $time, A, B, Y);
        A=1; B=0; #10; $display("%0t | %b %b | %b", $time, A, B, Y);
        A=1; B=1; #10; $display("%0t | %b %b | %b", $time, A, B, Y);

        $display("Simulation complete.");
        #10;
        $finish;
    end
endmodule
