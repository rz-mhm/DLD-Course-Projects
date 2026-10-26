module multiplier_Alu(
    input  logic [16:0] A, 
    input  logic [16:0] B, 
    input  logic [2:0]  opc, 
    output logic [16:0] F
);

    logic [16:0] mux_out;
    logic cin;
    logic selZero, selB, sel2B, selMinusB, selMinus2B;

    assign selZero    = (opc == 3'b000) || (opc == 3'b111);
    assign selB       = (opc == 3'b001) || (opc == 3'b010);
    assign sel2B      = (opc == 3'b011);
    assign selMinus2B = (opc == 3'b100);
    assign selMinusB  = (opc == 3'b101) || (opc == 3'b110);

    assign cin = selMinusB || selMinus2B;

    always_comb begin
        if (selB)            mux_out = B;
        else if (sel2B)      mux_out = B << 1;
        else if (selMinusB)  mux_out = ~B;
        else if (selMinus2B) mux_out = ~(B << 1);
        else                 mux_out = 17'd0;
    end

    assign F = A + mux_out + {16'd0, cin}; 

endmodule