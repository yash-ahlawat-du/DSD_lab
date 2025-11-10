`timescale 1ns / 1ps
module mux2to1 (
    input  I0, I1,  
    input  S,      
    output Y       
);
assign Y = (~S & I0) | (S & I1);
endmodule
