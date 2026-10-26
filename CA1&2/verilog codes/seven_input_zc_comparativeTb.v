`timescale 1ns/1ns

module seven_input_zc_comparativeTb;
    reg [0:6] data_in;
    wire msb_out, mid_out, lsb_out;
    wire msb_out_assignedPrim,mid_out_assignedPrim,lsb_out_assignedPrim;

    seven_input_zc DUT (
        .data_in(data_in),
        .msb_out(msb_out),
        .mid_out(mid_out),
        .lsb_out(lsb_out)
    );
    seven_input_zc_assignedPrim DUT1 (
        .data_in(data_in),
        .msb_out(msb_out_assignedPrim),
        .mid_out(mid_out_assignedPrim),
        .lsb_out(lsb_out_assignedPrim)
    );
    
    initial begin
        data_in = 7'b0000000;
        #200;
        data_in = 7'b1000000;
        #200;
        data_in = 7'b1100000;
        #200;
        data_in = 7'b1110000;
        #200;
        data_in = 7'b1111000;
        #200;
        data_in = 7'b1111100;
        #200;
        data_in = 7'b1111110;
        #200;
        data_in = 7'b1111111;
        $stop;
    end
endmodule
