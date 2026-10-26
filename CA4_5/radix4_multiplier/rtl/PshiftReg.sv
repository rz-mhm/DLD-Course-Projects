module PshiftReg(
    input  logic clk, 
    input  logic rst,
    input  logic IzP, 
    input  logic ldP, 
    input  logic shP,
    input  logic [16:0] P_in, 
    output logic [15:0] P_out   
);

    always_ff @(posedge clk or posedge rst)
    begin
        if (rst)
            P_out <= 16'd0;
        else if (IzP)
            P_out <= 16'd0;
        else if (ldP && shP)
            P_out <= {P_in[16], P_in[16], P_in[15:2]};
        else if (ldP)
            P_out <= P_in[15:0];
    end

endmodule