`timescale 1ns/1ns

module tb_controller;

  logic clk;
  logic rst;
  logic ldA;
  logic ldB;
  logic IzP;
  logic ldP;
  logic shA;
  logic shP;
  logic IzCnt;
  logic enCnt;
  logic co;
  logic start;
  logic ready;

  multiplier_controller uut(
                          .clk(clk),
                          .rst(rst),
                          .start(start),
                          .co(co),
                          .ldA(ldA),
                          .ldB(ldB),
                          .IzCnt(IzCnt),
                          .IzP(IzP),
                          .ldP(ldP),
                          .shP(shP),
                          .shA(shA),
                          .enCnt(enCnt),
                          .ready(ready)
                        );

  initial
  begin
    clk = 0;
    forever
      #10 clk = ~clk;
  end

  initial
  begin
    rst = 0;
    start = 0;
    co = 0;

    @(negedge clk);
    rst = 1;
    @(negedge clk);
    rst = 0;

    @(negedge clk);
    start = 1;
    @(negedge clk);
    start = 0;

    repeat(8) @(negedge clk);

    co = 1;
    @(negedge clk);
    co = 0;
    @(negedge clk);
    $stop;
  end
endmodule
