// Code your design here
`timescale 1ns/1ps
module priority_encoder_4to2(
    input  I0, I1, I2, I3,
    output Y1, Y0,
    output valid
);
    assign Y1   = I3 | I2;
    assign Y0   = I3 | (~I2 & I1);
    assign valid = I0 | I1 | I2 | I3;

endmodule
// Code your testbench here
`timescale 1ns/1ps

module priority_encoder_4to2_tb;
    reg I0, I1, I2, I3;
    wire Y1, Y0, valid;
    priority_encoder_4to2 dut(I0, I1, I2, I3, Y1, Y0, valid);

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, priority_encoder_4to2_tb);
    end

    initial begin
        I0=0; I1=0; I2=0; I3=0;   #10;
        I0=1; I1=0; I2=0; I3=0;   #10;
        I0=0; I1=1; I2=0; I3=0;   #10;
        I0=1; I1=1; I2=0; I3=0;   #10;
        I0=0; I1=0; I2=1; I3=0;   #10;
        I0=1; I1=0; I2=1; I3=0;   #10;
        I0=1; I1=1; I2=1; I3=0;   #10;
        I0=0; I1=0; I2=0; I3=1;   #10;
        I0=1; I1=0; I2=0; I3=1;   #10;
        I0=1; I1=1; I2=0; I3=1;   #10;
        I0=0; I1=1; I2=1; I3=1;   #10;
        I0=1; I1=1; I2=1; I3=1;   #10;

        $finish;
    end

endmodule
