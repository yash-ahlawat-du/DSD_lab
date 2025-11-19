`timescale 1ns / 1ps
module tb_priority_decoder_2to4;
    reg EN, A1, A0;
    wire Y3, Y2, Y1, Y0;
    priority_decoder_2to4 dut (
        .EN(EN),
        .A1(A1),
        .A0(A0),
        .Y3(Y3),
        .Y2(Y2),
        .Y1(Y1),
        .Y0(Y0)
    );
    initial begin
        $dumpfile("priority_decoder_2to4_tb.vcd");
        $dumpvars(0, tb_priority_decoder_2to4);
        $display("EN A1 A0 | Y3 Y2 Y1 Y0");
        $display("------------------------");

        EN=0; A1=0; A0=0; #10; display_state;
        EN=1; A1=0; A0=0; #10; display_state;
        EN=1; A1=0; A0=1; #10; display_state;
        EN=1; A1=1; A0=0; #10; display_state;
        EN=1; A1=1; A0=1; #10; display_state;
        EN=0; A1=1; A0=1; #10; display_state;

        $finish;
    end

    task display_state;
        begin
            $display("%b  %b  %b | %b  %b  %b  %b", EN, A1, A0, Y3, Y2, Y1, Y0);
        end
    endtask
endmodule
