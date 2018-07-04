module addressMux2(
IADDR1  ,	// First Input Address (Input)
IADDR2  ,	// Second Input Address (Input)
SELECT  ,	// Select Input Address (Input)
OADDR       // Output Address (Output)
);

parameter ADDR_WIDTH = 11;

//--------------Input Ports----------------------------
input   [ADDR_WIDTH-1:0]    IADDR1;
input   [ADDR_WIDTH-1:0] 	IADDR2;
input                       SELECT;

//--------------Output Ports---------------------------
output wire [ADDR_WIDTH-1:0]    OADDR;

//-------------Processing Starts Here------------------

// Multiplexer Selection Continuos Assign
assign OADDR = (SELECT) ? IADDR2 : IADDR1;

endmodule
