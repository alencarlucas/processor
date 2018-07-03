module dataMemory(
  writeClock,
  readClock,
  writeEnable,
  writeAddr,
  readAddr,
  writeData,
  readData
);

parameter DATA_WIDTH = 32;
parameter DATAMEM_ADDR_WIDTH = 11;
parameter RAM_DEPTH = 1 << DATAMEM_ADDR_WIDTH;

input writeClock;
input readClock;
input writeEnable;
input [DATAMEM_ADDR_WIDTH-1:0] writeAddr;
input [DATAMEM_ADDR_WIDTH-1:0] readAddr;
input [DATA_WIDTH-1:0] writeData;

output reg [DATA_WIDTH-1:0] readData;

reg [DATA_WIDTH-1:0] dataMemory [0:RAM_DEPTH-1];

always @ (negedge writeClock) begin
  if (writeEnable)
    dataMemory[writeAddr] <= writeData;
end 

always @ (posedge readClock) begin
  readData <= dataMemory[readAddr];
end

endmodule