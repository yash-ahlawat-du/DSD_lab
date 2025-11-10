`timescale 1ns / 1ps
module boolean_expression_2(A, B, C, D, Y);
    input  A, B, C, D;
    output Y;
  
assign Y = (A ^ B) & (C | D);
endmodule
