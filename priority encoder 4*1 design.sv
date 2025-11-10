`timescale 1ns/1ps
module priority_encoder_4to2 (
    input  wire I3,
    input  wire I2,
    input  wire I1,
    input  wire I0,
    output reg  Y1,
    output reg  Y0,
    output reg  V
);
    always @(*) begin
        // default outputs
        Y1 = 1'b0;
        Y0 = 1'b0;
        V  = 1'b0;

        // Priority: I3 > I2 > I1 > I0
        if (I3) begin
            V  = 1'b1;
            Y1 = 1'b1; Y0 = 1'b1; // 3 -> 11
        end
        else if (I2) begin
            V  = 1'b1;
            Y1 = 1'b1; Y0 = 1'b0; // 2 -> 10
        end
        else if (I1) begin
            V  = 1'b1;
            Y1 = 1'b0; Y0 = 1'b1; // 1 -> 01
        end
        else if (I0) begin
            V  = 1'b1;
            Y1 = 1'b0; Y0 = 1'b0; // 0 -> 00
        end
        // else V remains 0 and Yx remain 00
    end
endmodule
