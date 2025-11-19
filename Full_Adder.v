// Code your design here
module full_adder(
    input  A, B, Cin,
    output  Sum, Cout
);
assign Sum  = A ^ B ^ Cin;
assign Cout = (A & B) | (B & Cin) | (A & Cin);

endmodule
// Code your testbench here
`timescale 1ns/1ps
module tb_full_adder;

reg A, B, Cin;
wire Sum, Cout;

full_adder uut(A, B, Cin, Sum, Cout);

initial begin
    $dumpfile("full_adder.vcd");   
    $dumpvars(0, tb_full_adder);   
end

initial begin

    A=0; B=0; Cin=0; #10;
    A=0; B=0; Cin=1; #10;
    A=0; B=1; Cin=0; #10;
    A=0; B=1; Cin=1; #10;
    A=1; B=0; Cin=0; #10;
    A=1; B=0; Cin=1; #10;
    A=1; B=1; Cin=0; #10;
    A=1; B=1; Cin=1; #10;

    $finish;
end

endmodule
