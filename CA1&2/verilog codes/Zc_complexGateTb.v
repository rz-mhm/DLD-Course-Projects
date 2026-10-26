`timescale 1ns/1ns

module Zc_complexGateTb;

    reg a;
    reg b;
    reg c;
    wire y1,y0;
    Zc_complexGate DUT (a,b,c,y1,y0);

    initial begin
        a = 0; b = 0; c = 0;
        #60;

        a = 1; b = 0; c = 0;
        #60;

        a = 1; b = 1; c = 0;
        #60;

        a = 0; b = 1; c = 0;
        #60;

        a = 0; b = 1; c = 1;
        #60;

        a = 0; b = 0; c = 1;
        #60;

        a = 1; b = 0; c = 1;
        #60;

        a = 1; b = 1; c = 1;
        #60;
        $stop;
    end

endmodule
