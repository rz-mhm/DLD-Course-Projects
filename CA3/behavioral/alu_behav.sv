
module alu_behav (
    input  logic signed [15:0] inM,
    input  logic signed [15:0] inN,
    input  logic               inC,
    input  logic [2:0]         opc,
    output logic signed [15:0] outF
);
    `include "../constants/alu_constants.sv"

    logic signed [15:0] inN_div3;
    logic signed [15:0] inM_times3;
    
    assign inN_div3 = (inN >>> 2) + (inN >>> 4) + (inN >>> 6);
    
    assign inM_times3 = inM + (inM <<< 1);

    always_comb begin
        case (opc)
            OP_ADD:  outF = inM + inN + inC;
            OP_DIV3: outF = inM + inN_div3;
            OP_INC:  outF = inM + 16'sd1;
            OP_MUL3: outF = inM_times3; 
            OP_AND:  outF = inM & inN;
            OP_OR:   outF = inM | inN;
            OP_NOT:  outF = ~inM;
            OP_NOP:  outF = 16'bz;
            default: outF = 16'b0;
        endcase
    end

endmodule
