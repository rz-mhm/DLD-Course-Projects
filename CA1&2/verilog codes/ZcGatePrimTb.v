`timescale 1ns/1ns

module ZcGatePrimTb;

    reg a;
    reg b;
    reg c;

    wire y1_gateprim,y0_gateprim,y1_swichLevel,y0_switchLevel;

    ZcGatePrim DUT (a, b, c, y1_gateprim, y0_gateprim);
    ZC DUT1 (a, b, c, y1_swichLevel, y0_switchLevel);

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
