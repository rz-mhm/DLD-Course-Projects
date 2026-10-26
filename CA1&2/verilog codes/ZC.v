`timescale  1ns/1ns

module ZC(input a,b,c, output y1,y0);
    assign #(38) y1 = (~(a | b)) | (~(a | c)) | (~(c | b));
    assign #(36) y0= ~(a ^ b ^ c);
endmodule