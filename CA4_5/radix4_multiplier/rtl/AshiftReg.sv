module AshiftReg(
    input  logic clk, rst,
    input  logic ldA, shA,
    input  logic [15:0] A_in,
    input  logic [1:0]  s_in, 
    output logic [15:0] A_out,
    output logic q
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            A_out <= 16'b0;
            q   <= 1'b0;
        end
        else if (ldA) begin
            A_out <= A_in;
            q   <= 1'b0;
        end
        else if (shA) begin
            A_out <= {s_in, A_out[15:2]};
            q   <= A_out[1];
        end
    end

endmodule
