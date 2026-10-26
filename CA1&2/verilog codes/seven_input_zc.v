`timescale 1ns/1ns

module seven_input_zc(
    input [0:6] data_in,
    output msb_out, mid_out, lsb_out
);
    wire [0:3] stage1_msb;
    wire [0:2] stage1_lsb;
    wire stage2_inv_a, stage2_inv_b;

    Zc_complexGate stage1_gate0(data_in[0], data_in[1], data_in[2], 
                                  stage1_msb[0], stage1_lsb[0]);
    Zc_complexGate stage1_gate1(data_in[3], data_in[4], data_in[5], 
                                  stage1_msb[1], stage1_lsb[1]);

    not #(5,7) inv_stage1_a(stage2_inv_a, stage1_lsb[0]);
    not #(5,7) inv_stage1_b(stage2_inv_b, stage1_lsb[1]);

    Zc_complexGate stage2_gate0(stage2_inv_b,stage2_inv_a,data_in[6],
                                  stage1_msb[2], lsb_out);
    Zc_complexGate stage2_gate1(stage1_msb[1], stage1_msb[2], stage1_msb[0],
                                  stage1_msb[3], stage1_lsb[2]);

    not #(5,7) inv_mid(mid_out, stage1_lsb[2]);
    not #(5,7) inv_msb(msb_out, stage1_msb[3]);
endmodule
