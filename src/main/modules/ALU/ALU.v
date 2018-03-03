module ALU(
    opCode,
    inputData1,
    inputData2,
    outputData
);

parameter DATA_WIDTH = 32;
parameter OPCODE_WIDTH = 6;

input [OPCODE_WIDTH-1:0] opCode;
input [DATA_WIDTH-1:0] inputData1;
input [DATA_WIDTH-1:0] inputData2;
output reg [DATA_WIDTH-1:0] outputData;

localparam [OPCODE_WIDTH-1:0] ADD = 6'd0;
localparam [OPCODE_WIDTH-1:0] SUB = 6'd1;
localparam [OPCODE_WIDTH-1:0] MULT = 6'd2;
localparam [OPCODE_WIDTH-1:0] DIV = 6'd3;
localparam [OPCODE_WIDTH-1:0] MOD = 6'd4;
localparam [OPCODE_WIDTH-1:0] LSH = 6'd5;
localparam [OPCODE_WIDTH-1:0] RSH = 6'd6;
localparam [OPCODE_WIDTH-1:0] AND = 6'd7;
localparam [OPCODE_WIDTH-1:0] OR = 6'd8;
localparam [OPCODE_WIDTH-1:0] NOT = 6'd9;
localparam [OPCODE_WIDTH-1:0] EQ = 6'd10;
localparam [OPCODE_WIDTH-1:0] NEQ = 6'd11;
localparam [OPCODE_WIDTH-1:0] LT = 6'd12;
localparam [OPCODE_WIDTH-1:0] LTE = 6'd13;

always @ (opCode or inputData1 or inputData2) begin
  case (opCode)
    ADD: outputData = inputData1 + inputData2; 
    SUB: outputData = inputData1 - inputData2; 
    MULT: outputData = inputData1 * inputData2; 
    DIV: outputData = inputData1 / inputData2; 
    MOD: outputData = inputData1 % inputData2; 
    LSH: outputData = inputData1 << inputData2; 
    RSH: outputData = inputData1 >> inputData2; 
    AND: outputData = inputData1 && inputData2; 
    OR: outputData = inputData1 || inputData2; 
    NOT: outputData = !inputData1; 
    EQ: outputData = $signed(inputData1) == $signed(inputData2); 
    NEQ: outputData = $signed(inputData1) != $signed(inputData2); 
    LT: outputData = $signed(inputData1) < $signed(inputData2); 
    LTE: outputData = $signed(inputData1) <= $signed(inputData2); 
    default: outputData = inputData1 + inputData2;  
  endcase
end

endmodule

