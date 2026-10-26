`timescale 1ns/1ns

module Zc_copmareTb;

    reg a;
    reg b;
    reg c;

    wire y1_gateprim,y0_gateprim;
    wire y1_swichLevel,y0_switchLevel;
    wire y1_Assigned,y0_Assigned;

    ZcGatePrim DUT (a, b, c, y1_gateprim, y0_gateprim);
    Zc_complexGate DUT1 (a, b, c, y1_swichLevel, y0_switchLevel);
    ZC DUT2 (a, b, c, y1_Assigned, y0_Assigned);

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
