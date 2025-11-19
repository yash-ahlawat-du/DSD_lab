// Code your design here
module full_subtractor(
    input  A, B, Bin,
    output  Diff, Bout
);
assign Diff = A ^ B ^ Bin;
assign Bout = (~A & B) | (B & Bin) | (~A & Bin);

endmodule
// Code your testbench here
`timescale 1ns/1ps
module tb_full_subtractor;

reg A, B, Bin;
wire Diff, Bout;

full_subtractor dut(A, B, Bin, Diff, Bout);

initial begin
    $dumpfile("full_subtractor.vcd"); 
    $dumpvars(0, tb_full_subtractor); 
end

initial begin
    $display("A B Bin | Diff Bout");

    A=0; B=0; Bin=0; #10;
    A=0; B=0; Bin=1; #10;
    A=0; B=1; Bin=0; #10;
    A=0; B=1; Bin=1; #10;
    A=1; B=0; Bin=0; #10;
    A=1; B=0; Bin=1; #10;
    A=1; B=1; Bin=0; #10;
    A=1; B=1; Bin=1; #10;

    $finish;
end
endmodule
