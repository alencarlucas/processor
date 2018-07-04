module bitExtender(
IMMDATA ,   // Immediate Data Type (Input)
ODATA       // Output Data (Output)
);

parameter DATA_WIDTH = 32;
parameter IMMDATA_WIDTH = 21;
localparam DIFF_WIDTH = DATA_WIDTH-IMMDATA_WIDTH; 

//--------------Input Ports----------------------------
input       [IMMDATA_WIDTH-1:0]     IMMDATA;

//--------------Output Ports---------------------------
output wire [DATA_WIDTH-1:0]        ODATA;

//-------------Processing Starts Here------------------

// Bit Extender Continuos Assign
assign ODATA = {{DIFF_WIDTH{1'b0}}, IMMDATA};

endmodule
