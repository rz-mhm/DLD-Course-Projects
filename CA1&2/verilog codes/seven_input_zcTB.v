`timescale 1ns/1ns

module seven_input_zcTB;
    reg [0:6] data_in;
    wire msb_out, mid_out, lsb_out;

    seven_input_zc DUT (
        .data_in(data_in),
        .msb_out(msb_out),
        .mid_out(mid_out),
        .lsb_out(lsb_out)
    );
    
    initial begin
        data_in = 7'b0000000;
        #100;
        data_in = 7'b1000000;
        #100;
        data_in = 7'b1100000;
        #100;
        data_in = 7'b1110000;
        #100;
        data_in = 7'b1111000;
        #100;
        data_in = 7'b1111100;
        #100;
        data_in = 7'b1111110;
        #100;
        data_in = 7'b1111111;
        #100;
        data_in = 7'b1001000;
        #100;
        data_in = 7'b1101000;
        #100;
        $stop;
    end
endmodule
