// Code your design here
`timescale 1ns / 1ps
module half_subtractor(
  input wire A,B,
  output wire D,Br);
  
  assign D  = A ^ B;    
  assign Br = (~A) & B;
endmodule
// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

module tb_half_subtractor;
  reg A, B;         
  wire D, Br;        
  half_subtractor uut (A,B,D,Br);
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb_half_subtractor);
  end
  initial begin
    A = 0; B = 0; #10;
    A = 0; B = 1; #10;
    A = 1; B = 0; #10;
    A = 1; B = 1; #10;

    $finish;
  end
endmodule
