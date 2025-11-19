`timescale 1ns/1ps
module sr_ff(
    input  S, R, CLK,
    output Q, Qbar
);
    wire S_g, R_g;
    assign #1 S_g = S & CLK;
    assign #1 R_g = R & CLK;

    assign #1 Q    = ~(S_g & Qbar);
    assign #1 Qbar = ~(R_g & Q);

endmodule
`timescale 1ns/1ps
module tb_sr_ff;

    reg S, R, CLK;
    wire Q, Qbar;

    sr_ff uut (S, R, CLK, Q, Qbar);

    initial begin
        $dumpfile("sr_ff_wave.vcd");
        $dumpvars(0, tb_sr_ff);
    end

    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end

    initial begin
        S = 0; R = 0; #10;  
        S = 0; R = 1; #10;  
        S = 1; R = 0; #10;  
        S = 1; R = 1; #10;  
        $finish;
    end

endmodule
