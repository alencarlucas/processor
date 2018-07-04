module bitReducer(
RDATA   ,   // Regiter Data Type (Input)
ODATA       // Output Data (Output)
);

parameter DATA_WIDTH = 32;
parameter ADDR_WIDTH = 11;

//--------------Input Ports----------------------------
input   [DATA_WIDTH-1:0]    RDATA;

//--------------Output Ports---------------------------
output wire [ADDR_WIDTH-1:0]    ODATA;

//-------------Processing Starts Here------------------

// Bit Reducer Continuos Assign
assign ODATA = RDATA[ADDR_WIDTH-1:0];
										
endmodule
