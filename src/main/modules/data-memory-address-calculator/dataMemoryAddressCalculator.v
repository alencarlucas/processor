module dataMemoryAddressCalculator(
IADDR   ,   // Input Address (Input)
OFFSET  ,	// Offset (Input)
OADDR       // Output Address (Output)
);

parameter ADDR_WIDTH = 11;

//--------------Input Ports----------------------------
input   [ADDR_WIDTH-1:0]    IADDR;
input   [ADDR_WIDTH-1:0]    OFFSET;

//--------------Output Ports---------------------------
output wire [ADDR_WIDTH-1:0]    OADDR;

//-------------Processing Starts Here------------------

// Multiplexer Selection Continuos Assign
assign OADDR = IADDR + OFFSET;

endmodule
