module mux_4to1_16b (
    input  logic [15:0] in0,
    input  logic [15:0] in1,
    input  logic [15:0] in2,
    input  logic [15:0] in3,
    input  logic [1:0]  sel,
    output logic [15:0] out
);

    always_comb begin
        case (sel)
            2'b00: out = in0;
            2'b01: out = in1;
            2'b10: out = in2;
            2'b11: out = in3;
            default: out = 16'b0;
        endcase
    end

endmodule
