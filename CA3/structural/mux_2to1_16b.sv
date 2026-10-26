module mux_2to1_16b (
    input  logic [15:0] in0,
    input  logic [15:0] in1,
    input  logic        sel,
    output logic [15:0] out
);

    always_comb begin
        case (sel)
            1'b0: out = in0;
            1'b1: out = in1;
            default: out = 16'b0;
        endcase
    end

endmodule
