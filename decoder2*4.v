module decoder2to4(
    input wire A, B,
    output wire D0, D1, D2, D3
);

assign D0 = ~A & ~B; 
assign D1 = ~A &  B; 
assign D2 =  A & ~B; 
assign D3 =  A &  B; 

endmodule
// Code your testbench here
`timescale 1ns/1ps
module tb_decoder2to4;

reg A, B;
wire D0, D1, D2, D3;

decoder2to4 Uut(A, B, D0, D1, D2, D3);

initial begin
    $dumpfile("decoder2to4.vcd");  
    $dumpvars(0, tb_decoder2to4);  
end

initial begin
    
    A=0; B=0; #10;
    A=0; B=1; #10;
    A=1; B=0; #10;
    A=1; B=1; #10;

    $finish;
end
endmodule
