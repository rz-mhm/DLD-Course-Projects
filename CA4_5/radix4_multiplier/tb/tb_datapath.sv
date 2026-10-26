`timescale 1ns/1ns

module tb_datapath;

    logic clk;
    logic rst;
    logic [15:0] A;
    logic [15:0] B;
    logic ldA;
    logic ldB;
    logic IzP;
    logic ldP;
    logic shA;
    logic shP;
    logic IzCnt;
    logic enCnt;

    logic co;
    logic [31:0] result;

    multiplierDP uut (
        .clk(clk), 
        .rst(rst), 
        .A(A), 
        .B(B), 
        .ldA(ldA), 
        .ldB(ldB), 
        .IzP(IzP), 
        .ldP(ldP), 
        .shA(shA), 
        .shP(shP), 
        .IzCnt(IzCnt), 
        .enCnt(enCnt), 
        .co(co), 
        .result(result)
    );

    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    initial begin
        rst = 0;
        A = 16'd0;
        B = 16'd0;
        ldA = 0;
        ldB = 0;
        IzP = 0;
        ldP = 0;
        shA = 0;
        shP = 0;
        IzCnt = 0;
        enCnt = 0;

        @(negedge clk);
        rst = 1;
        @(negedge clk);
        rst = 0;

        @(negedge clk);
        A = 16'sd5;
        B = -16'sd3;
        ldA = 1;
        ldB = 1;
        IzP = 1;
        IzCnt = 1;
        
        @(negedge clk);

        ldA = 0;
        ldB = 0;
        IzP = 0;
        IzCnt = 0;
        
        ldP = 1;
        shP = 1;
        shA = 1;
        enCnt = 1;

        repeat(8) @(negedge clk);

        ldP = 0;
        shP = 0;
        shA = 0;
        enCnt = 0;
        
        @(negedge clk);

        if ($signed(result) == -32'sd15) begin
            $display("Test Passed: 5 * -3 = %0d", $signed(result));
        end else begin
            $display("Test Failed: 5 * -3 != %0d, expected -15", $signed(result));
        end

        $stop;
    end
endmodule
