module registerFile(
  writeClock,
  writeMoveEnable,
  writeAddr,
  readMoveAddr1,
  readMoveAddr2,
  writeData,
  readMoveData1,
  readMoveData2
);

parameter DATA_WIDTH = 32;
parameter RFILE_ADDR_WIDTH = 5;
parameter RAM_DEPTH = 1 << RFILE_ADDR_WIDTH;

input writeClock;
input [1:0] writeMoveEnable;
input [RFILE_ADDR_WIDTH-1:0] writeAddr;
input [RFILE_ADDR_WIDTH-1:0] readMoveAddr1;
input [RFILE_ADDR_WIDTH-1:0] readMoveAddr2;
input [DATA_WIDTH-1:0] writeData;

output reg [DATA_WIDTH-1:0] readMoveData1;
output reg [DATA_WIDTH-1:0] readMoveData2;

reg [DATA_WIDTH-1:0] registerFile [0:RAM_DEPTH-1];

localparam [1:0] READ_ONLY = 2'b00;
localparam [1:0] WRITE = 2'b01;
localparam [1:0] MOVE  = 2'b10;

always @ (negedge writeClock) begin
  if (writeMoveEnable == WRITE)
    registerFile[writeAddr] <= writeData;
  else if (writeMoveEnable == MOVE)
    registerFile[readMoveAddr1] <= registerFile[readMoveAddr2];
end

always @ (readMoveAddr1 or readMoveAddr2) begin
    readMoveData1 = registerFile[readMoveAddr1];
    readMoveData2 = registerFile[readMoveAddr2];
end

endmodule
