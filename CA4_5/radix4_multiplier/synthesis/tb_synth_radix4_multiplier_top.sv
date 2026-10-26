`timescale 1ns/1ns

module tb_synth_radix4_multiplier_top;


    logic clk;
    logic rst;
    logic start;
    logic signed [15:0] ABUS;
    logic signed [15:0] BBUS;
    logic ready;
    logic signed [31:0] outBUS;

    logic signed [31:0] expected_out;
    int pass_count = 0;
    int fail_count = 0;

    radix4_multiplier_top uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .ABUS(ABUS),
        .BBUS(BBUS),
        .ready(ready),
        .outBUS(outBUS)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    task run_test(input logic signed [15:0] a_val, input logic signed [15:0] b_val);
        begin
            @(negedge clk);
            ABUS = a_val;
            BBUS = b_val;
            expected_out = a_val * b_val;

            start = 1'b1;
            @(negedge clk);
            start = 1'b0;

            wait(ready == 1'b0);
            wait(ready == 1'b1);
            @(negedge clk);

            if (outBUS === expected_out) begin
                $display("ABUS = %6d | BBUS = %6d | outBUS = %11d (Expected = %11d)  [PASS]", 
                         a_val, b_val, outBUS, expected_out);
                pass_count++;
            end else begin
                $display("ABUS = %6d | BBUS = %6d | outBUS = %11d (Expected = %11d)  [FAIL]", 
                         a_val, b_val, outBUS, expected_out);
                fail_count++;
            end
        end
    endtask

    initial begin
        rst   = 0;
        start = 0;
        ABUS  = 16'd0;
        BBUS  = 16'd0;

        $display("Radix-4 Booth Multiplier Post-Synthesis Testbench");
        $display("=================================================");

        @(negedge clk);
        rst = 1'b1;
        @(negedge clk);
        rst = 1'b0;
        @(negedge clk);

        wait(ready == 1'b1);

        $display("\n--- test 1: ");
        run_test(16'sd15, 16'sd10);

        $display("\n--- test 2:");
        run_test(16'sd25, -16'sd4);

        $display("\n--- test 3:");
        run_test(-16'sd12, -16'sd12);

        $display("\n--- test 4:");
        run_test(-16'sd50, 16'sd20);

        $display("\n--- test 5:");
        run_test(16'sd0, 16'sd1234);
        run_test(-16'sd456, 16'sd0);

        $display("\n--- test 6:");
        run_test(16'sd1, -16'sd32768);
        run_test(16'sd32767, 16'sd2);
        run_test(-16'sd1, -16'sd1);

        $display("\n test results summary : \n");
        $display(" Total Tests Executed : %0d", (pass_count + fail_count));
        $display(" Passed               : %0d", pass_count);
        $display(" Failed               : %0d", fail_count);
        $stop;
    end

endmodule
