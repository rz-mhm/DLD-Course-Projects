`timescale  1ns/1ns

module  Zc_complexGate (input a,b,c , output y1,y0);
    supply1 vdd;
    supply0 gnd;
    wire nodes[0:14];
    
    wire c_inv,a_inv,b_inv;
    pmos #(5,6,7) T1(c_inv,vdd,c);
    nmos #(3,4,5) T2(c_inv,gnd,c);

    pmos #(5,6,7) T3(a_inv,vdd,a);
    nmos #(3,4,5) T4(a_inv,gnd,a);

    pmos #(5,6,7) T5(b_inv,vdd,b);
    nmos #(3,4,5) T6(b_inv,gnd,b);

    pmos #(5,6,7) T7(nodes[0],vdd,a);
    pmos #(5,6,7) T8(nodes[0],vdd,b);
    pmos #(5,6,7) T9(nodes[1],nodes[0],a);
    pmos #(5,6,7) T10(y1,nodes[1],b);
    pmos #(5,6,7) T11(y1,nodes[0],c);

    nmos #(3,4,5) T13(nodes[2],gnd,b);
    nmos #(3,4,5) T14(y1,nodes[2],a);
    nmos #(3,4,5) T15(nodes[3],gnd,c);
    nmos #(3,4,5) T16(y1,nodes[3],b);
    nmos #(3,4,5) T17(y1,nodes[3],a);

    pmos #(5,6,7) T18(nodes[4],vdd,c);
    pmos #(5,6,7) T19(nodes[5],vdd,c_inv);
    pmos #(5,6,7) T20(nodes[6],nodes[5],a);
    pmos #(5,6,7) T21(nodes[13],nodes[5],a_inv);
    pmos #(5,6,7) T22(y0,nodes[13],b);
    pmos #(5,6,7) T23(y0,nodes[6],b_inv);
    pmos #(5,6,7) T24(nodes[7],nodes[4],a);
    pmos #(5,6,7) T25(nodes[14],nodes[4],a_inv);
    pmos #(5,6,7) T26(y0,nodes[7],b);
    pmos #(5,6,7) T27(y0,nodes[14],b_inv);


    nmos #(3,4,5) T28(nodes[8],gnd,c);
    nmos #(3,4,5) T29(y0,nodes[8],c_inv);
    nmos #(3,4,5) T30(nodes[9],gnd,b);
    nmos #(3,4,5) T31(nodes[10],gnd,b_inv);
    nmos #(3,4,5) T32(nodes[8],nodes[10],a);
    nmos #(3,4,5) T33(nodes[8],nodes[9],a_inv);
    nmos #(3,4,5) T34(nodes[11],nodes[8],b);
    nmos #(3,4,5) T35(nodes[12],nodes[8],b_inv);
    nmos #(3,4,5) T36(y0,nodes[11],a);
    nmos #(3,4,5) T37(y0,nodes[12],a_inv);

endmodule