`timescale 1ns/1ps
module tb_priority_encoder_4to2;
    reg I3, I2, I1, I0;
    wire Y1, Y0, V;
    priority_encoder_4to2 dut (
        .I3(I3),
        .I2(I2),
        .I1(I1),
        .I0(I0),
        .Y1(Y1),
        .Y0(Y0),
        .V(V)
    );
    initial begin
        $dumpfile("priority_encoder_tb.vcd");
        $dumpvars(0, tb_priority_encoder_4to2);
    end
    initial begin
        $display("time\tI3 I2 I1 I0 | V Y1 Y0");
        $display("--------------------------------");
        // try all combinations (0..15)
        {I3,I2,I1,I0} = 4'b0000; #10; display_state;
        {I3,I2,I1,I0} = 4'b0001; #10; display_state;
        {I3,I2,I1,I0} = 4'b0010; #10; display_state;
        {I3,I2,I1,I0} = 4'b0011; #10; display_state;
        {I3,I2,I1,I0} = 4'b0100; #10; display_state;
        {I3,I2,I1,I0} = 4'b0101; #10; display_state;
        {I3,I2,I1,I0} = 4'b0110; #10; display_state;
        {I3,I2,I1,I0} = 4'b0111; #10; display_state;
        {I3,I2,I1,I0} = 4'b1000; #10; display_state;
        {I3,I2,I1,I0} = 4'b1001; #10; display_state;
        {I3,I2,I1,I0} = 4'b1010; #10; display_state;
        {I3,I2,I1,I0} = 4'b1011; #10; display_state;
        {I3,I2,I1,I0} = 4'b1100; #10; display_state;
        {I3,I2,I1,I0} = 4'b1101; #10; display_state;
        {I3,I2,I1,I0} = 4'b1110; #10; display_state;
        {I3,I2,I1,I0} = 4'b1111; #10; display_state;
        $finish;
    end
    endtask
endmodule
