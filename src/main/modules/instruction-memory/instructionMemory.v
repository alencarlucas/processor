module instructionMemory(
    writeClock,
    readClock,
    writeEnable,
    writeAddr,
    readAddr,
    writeData,
    readData
);

parameter DATA_WIDTH = 32;
parameter INSTRUCTIONMEM_ADDR_WIDTH = 13;
parameter RAM_DEPTH = 1 << INSTRUCTIONMEM_ADDR_WIDTH;

input writeClock;
input readClock;
input writeEnable;
input [INSTRUCTIONMEM_ADDR_WIDTH-1:0] writeAddr;
input [INSTRUCTIONMEM_ADDR_WIDTH-1:0] readAddr;
input [DATA_WIDTH-1:0] writeData;

output reg [DATA_WIDTH-1:0] readData;

(* ram_init_file = "instructionSet.mif" *) reg [DATA_WIDTH-1:0] instructionMemory [0:RAM_DEPTH-1];

always @ (negedge writeClock) begin
  if (writeEnable)
    instructionMemory[writeAddr] <= writeData;
end 

always @ (posedge readClock) begin
  readData <= instructionMemory[readAddr];
end

endmodule