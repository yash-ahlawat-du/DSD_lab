`timescale 1ns/1ps
module lff(
    input CLK, RESET,
    output reg Q
);
    initial Q = 0;

    always @(posedge CLK)
        if (RESET) Q <= 0;
        else       Q <= ~Q;
endmodule


module custom_counter(
    input CLK, RESET,
    output reg [2:0] count
);

    reg [2:0] state;

    always @(posedge CLK or posedge RESET) begin
        if (RESET)
            state <= 3'b000;
        else begin
            case(state)
                3'b000: state <= 3'b011;
                3'b011: state <= 3'b101;
                3'b101: state <= 3'b110;
                3'b110: state <= 3'b010;
                3'b010: state <= 3'b000;
            endcase
        end
    end

    always @(*) count = state;

endmodule
module tb_custom_counter;

    reg CLK, RESET;
    wire [2:0] count;

    custom_counter UUT (
        .CLK(CLK),
        .RESET(RESET),
        .count(count)
    );

    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end

    initial begin
        RESET = 1; #10;
        RESET = 0; #50;
        RESET = 1; #10;
        RESET = 0; #50;
        $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_custom_counter);
    end
endmodule
