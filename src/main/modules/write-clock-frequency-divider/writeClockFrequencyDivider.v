module writeClockFrequencyDivider(
IN_50Mhz    ,   // Input 50Mhz Clock (Input)
OUT     // Output 0.78125MHz Clock (Output)
);

parameter COUNTER_WIDTH = 11;

//--------------Input Ports----------------------------
input IN_50Mhz;

//--------------Output Ports---------------------------
output reg OUT = 1'b0;

//--------------Internal variables---------------------
reg         [COUNTER_WIDTH-1:0] COUNTER = {COUNTER_WIDTH{1'b0}};
localparam  [COUNTER_WIDTH-1:0] MAXVALUE = 11'd2047;

//-------------Processing Starts Here------------------

// Frequency Divider Block
always @ (posedge IN_50Mhz) begin
    if (COUNTER < MAXVALUE) begin
        COUNTER <= COUNTER + 1'b1;
    end else begin
        COUNTER <= {COUNTER_WIDTH{1'b0}};
        OUT <= ~OUT;
    end
end

endmodule
