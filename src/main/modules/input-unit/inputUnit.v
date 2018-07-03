module inputUnit(
KEYS    ,	// Keys Input Data (Input)
ODATA       // Output Data (Output)
);

parameter KEYS_WIDTH = 11;
parameter DATA_WIDTH = 32;
parameter DIFF_WIDTH = DATA_WIDTH - KEYS_WIDTH;

//--------------Input Ports----------------------------
input   [KEYS_WIDTH-1:0]    KEYS;

//--------------Output Ports---------------------------                  
output wire  [DATA_WIDTH-1:0]   ODATA;

//-------------Processing Starts Here------------------

assign ODATA = (!KEYS[KEYS_WIDTH-1] || !KEYS[KEYS_WIDTH-2:0]) ? {1'b0,{{DIFF_WIDTH{1'b0}},KEYS[KEYS_WIDTH-2:0]}}
                                                    : {{DIFF_WIDTH{1'b1}},((~{1'b0,KEYS[KEYS_WIDTH-2:0]})+1'b1)};

endmodule
