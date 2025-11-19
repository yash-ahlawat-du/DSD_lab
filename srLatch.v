// Code your design here
`timescale 1ns/1ps
module sr_latch(
    input  S, R,
    output Q, Qbar
);

    assign #1 Q    = ~(S & Qbar);
    assign #1 Qbar = ~(R & Q);

endmodule
// Code your testbench here
// or browse Examples
`timescale 1ns/1ps
module tb_sr_latch;

    reg S, R;
    wire Q, Qbar;

    sr_latch uut (S, R, Q, Qbar);

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_sr_latch);
    end

    initial begin
        S = 0; R = 0; #10;   
        S = 0; R = 1; #10;   
        S = 1; R = 0; #10; 
        S = 1; R = 1; #10;   
        $finish;
    end

endmodule
