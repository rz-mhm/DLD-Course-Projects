`timescale 1ns/1ns
module tb_alu_struct_netlist;
    `include "../constants/alu_constants.sv"

    logic signed [15:0] inM, inN, outF;
    logic               inC;
    logic [2:0]         opc;

    logic [2:0]         rand_opc;
    logic signed [15:0] rand_inM, rand_inN;
    logic               rand_inC;

    alu_struct_netlist dut (.inM(inM), .inN(inN), .inC(inC), .opc(opc), .outF(outF));

    task drive_and_display(
        input [2:0]         test_opc,
        input signed [15:0] test_inM,
        input signed [15:0] test_inN,
        input               test_inC
    );
        opc = test_opc; 
        inM = test_inM; 
        inN = test_inN; 
        inC = test_inC;
        #200;
        $display("Time: %0t | Op: %0d | M: %0h | N: %0h | C: %b -> F: %0h", 
                 $time, opc, inM, inN, inC, outF);
    endtask

    initial begin
        $timeformat(-9, 2, " ns", 10);
        $dumpfile("alu_struct_netlist.vcd");
        $dumpvars(0, tb_alu_struct_netlist);

        $display("--- DIRECTED TESTS ---");
        drive_and_display(OP_ADD,  16'h000A, 16'h0005, 1'b1);
        drive_and_display(OP_DIV3, 16'h0010, 16'd30,   1'b0);
        drive_and_display(OP_INC,  16'hFFFF, 16'h0000, 1'b0);
        drive_and_display(OP_MUL3, 16'd100,  16'h0000, 1'b0);
        drive_and_display(OP_AND,  16'hF0F0, 16'h0F0F, 1'b0);
        drive_and_display(OP_OR,   16'hA5A5, 16'h5A5A, 1'b0);
        drive_and_display(OP_NOT,  16'h00FF, 16'h0000, 1'b0);
        drive_and_display(OP_NOP,  16'h1234, 16'h5678, 1'b1);

        $display("\n--- Random Tests ---");
        repeat (50) begin
                rand_opc = $urandom_range(0, 7);
                rand_inM = $random;
                rand_inN = $random;
                rand_inC = $urandom_range(0, 1);
                drive_and_display(rand_opc, rand_inM, rand_inN, rand_inC);
            end
        $display("\n--- SIMULATION COMPLETE ---");
        $finish;
    end
endmodule
