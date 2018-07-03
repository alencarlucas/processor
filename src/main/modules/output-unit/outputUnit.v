module outputUnit(
IDATA           ,   // Register Data (Input)
KEYS            ,   // Keys for Input Data Instruction (Input)
SSD             ,   // Seven Segment Block Display Data (Output)
LEDKEYS             // LED Keys for Input Data Instruction (Output)
);

parameter DATA_WIDTH = 32;
parameter KEYS_WIDTH = 11;

//--------------Input Ports----------------------------
input   [DATA_WIDTH-1:0]    IDATA;
input   [KEYS_WIDTH-1:0]    KEYS;

//--------------Output Ports---------------------------
output wire [DATA_WIDTH-1:0]    SSD;
output wire [KEYS_WIDTH-1:0]    LEDKEYS;

//-------------Processing Starts Here------------------

assign SSD = IDATA;
assign LEDKEYS = KEYS;

endmodule
