module nand_universal_adder_subtractor(
    input  A, B, Cin,
    input  M,                 
    output Out,              
    output CarryBorrow,       
    output Overflow
);

    wire xb1, xb2, xb3, Bmod;
    nand(xb1, B, M);
    nand(xb2, B, xb1);
    nand(xb3, M, xb1);
    nand(Bmod, xb2, xb3);

    
    wire xc1, xc2, xc3, Cinmod;
    nand(xc1, Cin, M);
    nand(xc2, Cin, xc1);
    nand(xc3, M, xc1);
    nand(Cinmod, xc2, xc3);


    wire n1, n2, n3, xor1;
    nand(n1, A, Bmod);
    nand(n2, A, n1);
    nand(n3, Bmod, n1);
    nand(xor1, n2, n3);

   
    wire n4, n5, n6;
    nand(n4, xor1, Cinmod);
    nand(n5, xor1, n4);
    nand(n6, Cinmod, n4);
    nand(Out, n5, n6);         


    wire nab, AB;
    nand(nab, A, Bmod);
    nand(AB, nab, nab);

    wire nxc, XC;
    nand(nxc, xor1, Cinmod);
    nand(XC, nxc, nxc);

    wire nAB, nXC;
    nand(nAB, AB, AB);
    nand(nXC, XC, XC);
    nand(CarryBorrow, nAB, nXC);

    wire o1, o2, o3;
    nand(o1, Cinmod, CarryBorrow);
    nand(o2, Cinmod, o1);
    nand(o3, CarryBorrow, o1);
    nand(Overflow, o2, o3);

endmodule

`timescale 1ns/1ps
module tb_nand_universal_adder_subtractor;

    reg A, B, Cin, M;
    wire Out, CarryBorrow, Overflow;

    nand_universal_adder_subtractor uut(A, B, Cin, M, Out, CarryBorrow, Overflow);

    initial begin
        $dumpfile("universal_add_sub.vcd");
        $dumpvars(0, tb_nand_universal_adder_subtractor);
    end

    initial begin
       
        M = 0;
        $display("---- ADD ----");
        A=0; B=0; Cin=0; #10;
        A=1; B=0; Cin=1; #10;
        A=1; B=1; Cin=0; #10;

        // Test SUB mode  M = 1;
        $display("---- SUB ----");
        A=1; B=0; Cin=0; #10;  
        A=1; B=1; Cin=0; #10;  
        A=0; B=1; Cin=0; #10;   

        $finish;
    end

endmodule
