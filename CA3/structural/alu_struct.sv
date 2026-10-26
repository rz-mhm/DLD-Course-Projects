`timescale 1ns/1ps
`include "../constants/alu_constants.sv"

module alu_struct (
    input  logic signed [15:0] inM,
    input  logic signed [15:0] inN,
    input  logic               inC,
    input  logic [2:0]         opc,
    output logic signed [15:0] outF
);

    logic signed [15:0] div3_partial;
    logic signed [15:0] inN_div3;
    logic signed [15:0] inM_times2;
    logic               adder_cin;
    logic signed [15:0] b_selected;
    logic signed [15:0] add_result;
    logic        [15:0] and_result;
    logic        [15:0] or_result;
    logic        [15:0] not_result;
    logic        [15:0] logic_selected;
    logic        [1:0]  b_sel;

    assign inM_times2 = inM <<< 1;
    assign adder_cin  = inC & (opc == OP_ADD);
    assign b_sel      = opc[1:0];

    adder16 u_adder_div3_1 (
        .inA(inN >>> 2),
        .inB(inN >>> 4),
        .inC(1'b0),
        .outS(div3_partial)
    );

    adder16 u_adder_div3_2 (
        .inA(div3_partial),
        .inB(inN >>> 6),
        .inC(1'b0),
        .outS(inN_div3)
    );

    mux_4to1_16b u_mux_b (
        .in0(inN),
        .in1(inN_div3),
        .in2(16'd1),
        .in3(inM_times2),
        .sel(b_sel),
        .out(b_selected)
    );

    adder16 u_adder_main (
        .inA(inM),
        .inB(b_selected),
        .inC(adder_cin),
        .outS(add_result)
    );

    bitwise_unit u_bitwise (
        .inM(inM),
        .inN(inN),
        .out_and(and_result),
        .out_or(or_result),
        .out_not(not_result)
    );

    mux_4to1_16b u_mux_logic (
        .in0(and_result),
        .in1(or_result),
        .in2(not_result),
        .in3(16'd0),
        .sel(opc[1:0]),
        .out(logic_selected)
    );

    mux_2to1_16b u_mux_out (
        .in0(add_result),
        .in1(logic_selected),
        .sel(opc[2]),
        .out(outF)
    );

endmodule
