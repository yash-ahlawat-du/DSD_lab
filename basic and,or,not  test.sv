module tb;
    reg a, b;
    wire and_out, or_out, not_out;
    logic_gates uut(a, b, and_out, or_out, not_out);
    initial begin
        $dumpfile("wave.vcd");   
        $dumpvars(0, tb);    
    end

    
    initial begin
        a = 0; b = 0; #10;
        a = 0; b = 1; #10; 
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        $finish;
    end
endmodule
