`timescale 1ns / 1ps
module tb_mux2to1;
    reg I0, I1, S;
    wire Y;
  
mux2to1 uut (I0, I1, S, Y);

initial begin
$dumpfile("wave.vcd");
$dumpvars(0, tb_mux2to1);
I0=0; I1=1;
S=0; #10;  
S=1; #10;   
I0=1; I1=0;
S=0; #10;   
S=1; #10;   
$finish;
end
endmodule
