module programCounter(
WCLOCK  ,   // System Clock for Write Operation (Input)
WO      ,   // Write Operation Enable (Input)
IADDR   ,   // Input Address (Input)
OADDR       // Output Address (Output)
);

parameter ADDR_WIDTH = 11;

//--------------Input Ports----------------------------
input                       WCLOCK;
input                       WO;
input   [ADDR_WIDTH-1:0]    IADDR;

//--------------Output Ports---------------------------
output reg [ADDR_WIDTH-1:0] OADDR;

//-------------Processing Starts Here------------------

// Program Counter Write Block
always @(negedge WCLOCK) begin
    if (WO)
        OADDR <= IADDR;
end

endmodule
