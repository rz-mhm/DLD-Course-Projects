module adder16 (
    input  logic signed [15:0] inA,
    input  logic signed [15:0] inB,
    input  logic               inC,
    output logic signed [15:0] outS
);

    assign outS = inA + inB + inC;


endmodule
