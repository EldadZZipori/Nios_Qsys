/*
	FF ASYN CLR
	
	This module implements a simple D Flip Flop with an asynchronous reset/clear, and an enable.
	Output will only change on rising edge of the clock and when an enable signle is HIGH.
	
	Parameters 
	S	-	The number of bits in each word of data 
*/

module ff_asyn_clr_en
# (parameter S = 12)
(
	input 	logic	 				CLK,						// Input clock 
	input 	logic 				CLR,						// Reset/Clear input 
	input 	logic					E,							// Enable input
	input 	logic[(S-1):0] 	D,							// Data in
	output 	logic[(S-1):0] 	Q							// Data out
	
		always @(posedge CLK, posedge CLR) begin
			if (CLR) begin
				Q <= 1'b0;
			end
			else if (CLK & E) begin								// Only register data on rising edge of clock and when enable is high
				Q <= D;
			end
		end
endmodule
