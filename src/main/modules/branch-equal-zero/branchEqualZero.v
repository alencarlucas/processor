module branchEqualZero(
IDATA   ,	// Input Data (Input)
OPCODE  ,   // Instruction Opcode (Input)
BO          // Branch Operation Enable (Output)
);

parameter DATA_WIDTH = 32;
parameter OPCODE_WIDTH = 6;

//--------------Input Ports----------------------------
input [DATA_WIDTH-1:0]      IDATA;
input [OPCODE_WIDTH-1:0]    OPCODE;

//--------------Output Ports---------------------------
output reg BO;

//--------------Internal Variables---------------------
localparam  [OPCODE_WIDTH-1:0]  JMP    = 6'b010100;
localparam  [OPCODE_WIDTH-1:0]  BEQZ   = 6'b010101;

//-------------Processing Starts Here------------------

// Branch Equal Zero Processing Block
always @(IDATA or OPCODE) begin
    case (OPCODE)
        JMP: BO = 1'b1;
        BEQZ: BO = ~|IDATA;
        default: BO = 1'b0;
    endcase
end

endmodule
