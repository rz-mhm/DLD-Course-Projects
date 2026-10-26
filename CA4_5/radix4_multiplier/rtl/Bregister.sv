module Bregister(
    input  logic clk, rst,
    input  logic ldB,
    input  logic [15:0] B_in,
    output logic [15:0] B_out
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) 
            B_out <= 16'b0;
        else if (ldB) 
            B_out <= B_in;
    end

endmodule
