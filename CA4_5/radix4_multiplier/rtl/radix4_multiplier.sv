module radix4_multiplier(
    input  logic clk, rst, start,
    input  logic [15:0] ABUS, BBUS,
    output logic ready, 
    output logic [31:0] outBUS
);

    logic co;
    logic ldA, ldB, ldP, IzP, IzCnt, shP, shA, enCnt;

    multiplierDP dp_inst (
        .clk(clk),
        .rst(rst),
        .A(ABUS),        
        .B(BBUS),        
        .ldA(ldA),
        .ldB(ldB),
        .IzP(IzP),
        .ldP(ldP),
        .shA(shA),
        .shP(shP),
        .IzCnt(IzCnt),
        .enCnt(enCnt),
        .co(co),         
        .result(outBUS)  
    );

    multiplier_controller ctrl_inst (
        .clk(clk),
        .rst(rst),
        .start(start),
        .co(co),        
        .ready(ready),   
        .ldA(ldA),
        .ldB(ldB),
        .ldP(ldP),
        .IzP(IzP),
        .IzCnt(IzCnt),
        .shP(shP),
        .shA(shA),
        .enCnt(enCnt)
    );

endmodule