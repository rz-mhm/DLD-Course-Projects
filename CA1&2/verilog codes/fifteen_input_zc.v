`timescale 1ns/1ns


module _fifteen_input_zc(
    input  wire [14:0] data_in,
    output wire [3:0]  zeros_count
);

    wire [2:0] count_a;
    wire [2:0] count_b;

    wire c1, c2, c3;
    
    wire not_count_a0, not_count_b0;
    
    wire y1_stage1, y0_stage1;
    wire y1_stage2, y0_stage2;

    seven_input_zc zc7_inst_A (
        .data_in(data_in[6:0]), 
        .msb_out(count_a[2]),
        .mid_out(count_a[1]),
        .lsb_out(count_a[0])
    );

    seven_input_zc zc7_inst_B (
        .data_in(data_in[13:7]),
        .msb_out(count_b[2]),
        .mid_out(count_b[1]),
        .lsb_out(count_b[0])
    );


    not #(5,7) inv_a0 (not_count_a0, count_a[0]);
    not #(5,7) inv_b0 (not_count_b0, count_b[0]);

    Zc_complexGate adder_bit0 (
        .a(not_count_a0),
        .b(not_count_b0),
        .c(data_in[14]),     
        .y1(c1),             
        .y0(zeros_count[0])  
    );

    Zc_complexGate adder_bit1 (
        .a(count_a[1]),
        .b(count_b[1]),
        .c(c1),
        .y1(y1_stage1),
        .y0(y0_stage1)
    );

    not #(5,7) inv_sum1 (zeros_count[1], y0_stage1);
    not #(5,7) inv_c2   (c2, y1_stage1);

    Zc_complexGate adder_bit2 (
        .a(count_a[2]),
        .b(count_b[2]),
        .c(c2),
        .y1(y1_stage2),
        .y0(y0_stage2)
    );

    not #(5,7) inv_sum2 (zeros_count[2], y0_stage2);
    not #(5,7) inv_c3   (zeros_count[3], y1_stage2);

endmodule 