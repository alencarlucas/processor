module programCounterCalculator(
PC          ,	// Program Counter (Input)
IADDR       ,   // Input Address (Input)
ILO         ,   // Increment/Load Operation Enable (Input)
BO          ,   // Branch Operation Enable (Input)
OADDR           // Output Address (Output)
);

parameter ADDR_WIDTH = 11;

//--------------Input Ports----------------------------
input   [ADDR_WIDTH-1:0]    PC;
input   [ADDR_WIDTH-1:0] 	IADDR;
input                       ILO;
input                       BO;

//--------------Output Ports---------------------------
output reg [ADDR_WIDTH-1:0] OADDR;

//--------------Internal variables---------------------
localparam INCREMENT = 1'b0;
localparam LOAD = 1'b1;

//-------------Processing Starts Here------------------

always @ (PC or IADDR or ILO or BO) begin
    case (ILO)
		INCREMENT: OADDR = PC + 1'b1;
		LOAD: begin
		    if (BO) begin
		        OADDR = IADDR;
		    end else begin
		        OADDR = PC + 1'b1;
		    end
		end
		default: OADDR = PC + 1'b1;
	endcase
end

endmodule
