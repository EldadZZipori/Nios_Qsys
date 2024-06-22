/*
	FF ASYN CLR
	
	This module implements a simple D Flip Flop with an asynchronous reset/clear.
	
	Parameters 
	S	-	The number of bits in each word of data 
*/

module ff_asyn_clr
# (parameter S = 12)
(
	input 	logic	 				CLK,						// Input clock 
	input 	logic 				CLR,						// Reset/Clear input 
	input 	logic[(S-1):0] 	D,							// Data in
	output 	logic[(S-1):0] 	Q							// Data out
);
	
		always @(posedge CLK, posedge CLR) begin		// Either on rising clock edge or when CLR is high
			if (CLR) begin
				Q <= 1'b0;
			end
			else if (CLK) begin
				Q <= D;
			end
		end
endmodule