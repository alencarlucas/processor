module binary2bcdQuad(
outputEnable ,   // Output Operation Enable (Input)
DATA    ,	// Two's Complement Binary Data (Input)
SIGNAL  ,	// BCD's Signal (Output)
BCD1    ,	// BCD's First Digit (Output)
BCD2    ,   // BCD's Second Digit (Output)
BCD3    ,	// BCD's Third Digit (Output)
BCD4        // BCD's Fourth Digit (Output)
);

parameter DATA_WIDTH = 32;
parameter BCD_WIDTH = 4;

//--------------Input Ports----------------------------
input                       outputEnable;
input   [DATA_WIDTH-1:0]    DATA;	

//--------------Output Ports---------------------------
output reg                  SIGNAL;
output reg  [BCD_WIDTH-1:0] BCD1;
output reg  [BCD_WIDTH-1:0] BCD2;
output reg  [BCD_WIDTH-1:0] BCD3;
output reg  [BCD_WIDTH-1:0] BCD4;	

//--------------Internal variables---------------------
reg         [DATA_WIDTH-1:0]	ABSOLUTE_VALUE;
reg         [13:0]				PARTIAL_VALUE;
integer							INDEX;
localparam  [DATA_WIDTH-1:0]    MAXVALUE = 32'd9999;

//-------------Processing Starts Here------------------

// Quad BCD Data Block
always @ (DATA or outputEnable) begin
    if (outputEnable) begin
        ABSOLUTE_VALUE = (DATA[31]) ? ~(DATA-1'b1) : DATA;
        SIGNAL = DATA[31];
        if (ABSOLUTE_VALUE > MAXVALUE) begin
	        BCD1 = 4'b1010;
	        BCD2 = 4'b1010;
            BCD3 = 4'b1010;
	        BCD4 = 4'b1010;
            PARTIAL_VALUE = 14'b0;
            INDEX = 0;
	    end else begin	
            PARTIAL_VALUE = ABSOLUTE_VALUE[13:0];
            BCD1 = 4'b0000; 
            BCD2 = 4'b0000;
            BCD3 = 4'b0000; 
            BCD4 = 4'b0000;
            for (INDEX = 13; INDEX >= 0; INDEX = INDEX-1) begin
	            if(BCD1 >= 4'b0101) BCD1 = BCD1 + 4'b0011;
	            if(BCD2 >= 4'b0101) BCD2 = BCD2 + 4'b0011;
                if(BCD3 >= 4'b0101) BCD3 = BCD3 + 4'b0011;
	            if(BCD4 >= 4'b0101) BCD4 = BCD4 + 4'b0011;
	            BCD1 = BCD1 << 1;
	            BCD1[0] = BCD2[3];
                BCD2 = BCD2 << 1;
	            BCD2[0] = BCD3[3];
                BCD3 = BCD3 << 1;
	            BCD3[0] = BCD4[3];	
	            BCD4 = BCD4 << 1;
	            BCD4[0] = PARTIAL_VALUE[INDEX];
            end
        end
    end else begin
        BCD1 = 4'b1011;
        BCD2 = 4'b1011;
        BCD3 = 4'b1011;
        BCD4 = 4'b1011;
        SIGNAL = 1'b0;
        ABSOLUTE_VALUE = 32'b0;
        PARTIAL_VALUE = 14'b0;
        INDEX = 0;
    end
end

endmodule
