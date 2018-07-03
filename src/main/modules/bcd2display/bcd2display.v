module bcd2display(
BCDDATA         ,	// BCD Data (Input)
SEVENSEGMENT        // Seven Segment Data (Output)
);

parameter BCD_WIDTH = 4;
parameter DISPLAY_WIDTH = 7;

//--------------Input Ports----------------------------
input   [BCD_WIDTH-1:0] BCDDATA;		

//--------------Output Ports---------------------------
output reg  [DISPLAY_WIDTH-1:0] SEVENSEGMENT;

//-------------Processing Starts Here------------------

// Seven Segment Display Block
always @ (BCDDATA) begin
	case (BCDDATA)
		4'b0000: SEVENSEGMENT = 7'b0000001; // 0 (1)
		4'b0001: SEVENSEGMENT = 7'b1001111; // 1 (79)
		4'b0010: SEVENSEGMENT = 7'b0010010;	// 2 (18)
		4'b0011: SEVENSEGMENT = 7'b0000110; // 3 (6)
		4'b0100: SEVENSEGMENT = 7'b1001100; // 4 (76)
		4'b0101: SEVENSEGMENT = 7'b0100100; // 5 (36)
		4'b0110: SEVENSEGMENT = 7'b0100000; // 6 (32)
		4'b0111: SEVENSEGMENT = 7'b0001101; // 7 (13)
		4'b1000: SEVENSEGMENT = 7'b0000000; // 8 (0)
		4'b1001: SEVENSEGMENT = 7'b0000100; // 9 (4)
		4'b1010: SEVENSEGMENT = 7'b1111110; // - (126)
		4'b1011: SEVENSEGMENT = 7'b1111111; //   (127)
		default: SEVENSEGMENT = 7'b1111111; //   (127)
	endcase
end

endmodule
