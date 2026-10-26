module bitwise_unit (
    input  logic [15:0] inM,
    input  logic [15:0] inN,
    output logic [15:0] out_and,
    output logic [15:0] out_or,
    output logic [15:0] out_not
);

    assign out_and = inM & inN;
    assign out_or  = inM | inN;
    assign out_not = ~inM;

endmodule
