module multiplierDP(
    input  logic clk, rst,
    input  logic [15:0] A, B,
    input  logic ldA, ldB, IzP, ldP, shA, shP, IzCnt, enCnt,
    output logic co,
    output logic [31:0] result
);

    logic [15:0] B_reg;
    logic [15:0] A_reg;
    logic q;
    logic [15:0] P_reg; 
    logic [16:0] ALU_out;
    logic [16:0] sign_ext_B;
    logic [16:0] sign_ext_P;    

    Bregister b_reg_inst (
        .clk(clk),
        .rst(rst),
        .ldB(ldB),
        .B_in(B),
        .B_out(B_reg)
    );

    assign sign_ext_B = {B_reg[15], B_reg};
    assign sign_ext_P = {P_reg[15], P_reg};

    multiplier_Alu alu_inst (
        .A(sign_ext_P),        
        .B(sign_ext_B),
        .opc({A_reg[1:0], q}), 
        .F(ALU_out)
    );

    PshiftReg p_reg_inst (
        .clk(clk),
        .rst(rst),
        .IzP(IzP),
        .ldP(ldP),
        .shP(shP),
        .P_in(ALU_out),
        .P_out(P_reg)
    );

    AshiftReg a_reg_inst (
        .clk(clk),
        .rst(rst),
        .ldA(ldA),
        .shA(shA),
        .A_in(A), 
        .s_in(ALU_out[1:0]), 
        .A_out(A_reg),
        .q(q)
    );

    counter cnt_inst (
        .clk(clk),
        .rst(rst),
        .IzCnt(IzCnt),
        .enCnt(enCnt),
        .co(co)
    );

    assign result = {P_reg, A_reg}; 

endmodule