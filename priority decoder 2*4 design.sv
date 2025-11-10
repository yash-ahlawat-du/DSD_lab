module priority_decoder_2to4 (
    input  wire EN,     // Enable input
    input  wire A1,     // MSB
    input  wire A0,     // LSB
    output reg  Y3,     // Output 3
    output reg  Y2,     // Output 2
    output reg  Y1,     // Output 1
    output reg  Y0      // Output 0
);

    always @(*) begin
        // Default outputs
        Y3 = 0; Y2 = 0; Y1 = 0; Y0 = 0;

        if (EN) begin
            case ({A1, A0})
                2'b00: Y0 = 1;
                2'b01: Y1 = 1;
                2'b10: Y2 = 1;
                2'b11: Y3 = 1;
                default: {Y3, Y2, Y1, Y0} = 4'b0000;
            endcase
        end
        else begin
            {Y3, Y2, Y1, Y0} = 4'b0000;
        end
    end

endmodule
