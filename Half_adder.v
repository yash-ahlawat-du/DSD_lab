// Code your design here
`timescale 1ns / 1ps
module half_adder(
  input  A,B,
  output S,C
);
  assign S = A ^ B;
  assign C = A & B;
endmodule
// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

module tb_half_adder;
  reg A, B;         
  wire S, C;        
  half_adder uut (A,B,S,C);
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb_half_adder);
  end
  initial begin

    A=0; B=0; #10;
    A=0; B=1; #10;
    A=1; B=0; #10;
    A=1; B=1; #10;

    $finish;
  end
endmodule
