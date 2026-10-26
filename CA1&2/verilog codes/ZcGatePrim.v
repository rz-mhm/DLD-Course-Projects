`timescale 1ns/1ns
module ZcGatePrim (input a,b,c , output y1,y0);
    wire nodes[0:4];

    xor #(17,19) G1(nodes[0],a,b);
    xnor #(17,19) G2(y0,nodes[0],c);

    nor #(10,14) G4(nodes[1],a,b);
    nor #(10,14) G5(nodes[2],a,c);
    nor #(10,14) G6(nodes[3],c,b);
    nor #(15,21) G7(nodes[4],nodes[1],nodes[2],nodes[3]);
    not #(5,7) G8(y1,nodes[4]);

endmodule