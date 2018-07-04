module dataMux6(
IDATA1  ,	// First Input Data (Input)
IDATA2  ,	// Second Input Data (Input)
IDATA3  ,	// Third Input Data (Input)
IDATA4  ,	// Fourth Input Data (Input)
IDATA5  ,	// Fifth Input Data (Input)
IDATA6  ,	// Sixth Input Data (Input)
SELECT  ,	// Select Input Data (Input)
ODATA       // Output Data (Output)
);

parameter DATA_WIDTH = 32;

//--------------Input Ports----------------------------
input   [DATA_WIDTH-1:0] 	IDATA1;
input   [DATA_WIDTH-1:0] 	IDATA2;
input   [DATA_WIDTH-1:0] 	IDATA3;
input   [DATA_WIDTH-1:0] 	IDATA4;
input   [DATA_WIDTH-1:0] 	IDATA5;
input   [DATA_WIDTH-1:0] 	IDATA6;
input   [2:0]               SELECT;

//--------------Output Ports---------------------------
output reg  [DATA_WIDTH-1:0]    ODATA;

//-------------Processing Starts Here------------------

// Multiplexer Selection Block
always @ (IDATA1 or IDATA2 or IDATA3 or IDATA4 or IDATA5 or IDATA6 or SELECT) begin
	case (SELECT)
		3'b000: ODATA = IDATA1;
		3'b001: ODATA = IDATA2;
		3'b010: ODATA = IDATA3;
		3'b011: ODATA = IDATA4;
		3'b100: ODATA = IDATA5;
		3'b101: ODATA = IDATA6;
		default: ODATA = IDATA1;
	endcase
end

endmodule
