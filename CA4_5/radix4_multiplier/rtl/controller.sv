module multiplier_controller(
    input logic clk, rst, start, co,
    output logic ldA, ldB, IzCnt, IzP, ldP, shP, shA,enCnt, ready
);

    localparam [1:0] idle    = 2'd0;
    localparam [1:0] wait_st = 2'd1;
    localparam [1:0] calc    = 2'd2;
    logic [1:0] ns, ps;

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            ps <= idle;
        else
            ps <= ns;
    end
    
    always_comb begin
        {ready, ldA, ldB, IzCnt, IzP, ldP, shP, shA,enCnt} = 9'b0;
        case (ps) 
            idle: begin 
                ns = start ? wait_st : idle;
                ready = 1'b1; 
            end
            wait_st: begin 
                ns = start ? wait_st : calc;
                {ldA, ldB, IzCnt, IzP} = 4'b1111;
            end
            calc: begin 
                ns = co ? idle : calc; 
                {ldP, shP, shA,enCnt} = 4'b1111;
            end
            default: ns = idle;
        endcase
    end

endmodule
