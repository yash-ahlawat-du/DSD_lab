`timescale 1ns/1ps
module t_ff(
    input T,
    input CLK,
    output reg Q,
    output Qbar
);

    initial Q = 1'b0;

    always @(negedge CLK) begin
        if (T)
            Q <= ~Q;
        else
            Q <= Q;
    end

    assign Qbar = ~Q;

endmodule  

module tb_t_ff;

    reg T, CLK;
    wire Q, Qbar;

    t_ff uut (T, CLK, Q, Qbar);

    initial begin
        CLK = 1;
        forever #5 CLK = ~CLK;
    end

    initial begin
        $dumpfile("t_ff.vcd");
        $dumpvars(0, tb_t_ff);

        T = 0; #10;
        T = 1; #10;
        T = 1; #10;
        T = 0; #10;

        $finish;
    end
  endmodule
