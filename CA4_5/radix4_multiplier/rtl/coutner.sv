module counter(
    input  logic clk, rst,
    input  logic IzCnt, enCnt,
    output logic co
);

    logic [2:0] count;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) 
            count <= 3'b0;
        else if (IzCnt) 
            count <= 3'b0;
        else if (enCnt) 
            count <= count + 1'b1;
    end

    assign co = (count == 3'd7);

endmodule
