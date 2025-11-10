`timescale 1ns / 1ps
module boolean_expression(A, B, C, Y);
    input  A, B, C;  
    output Y;
  
    assign Y = (A & B) | (~C);
endmodule
