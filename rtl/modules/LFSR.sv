/*
	LFSR
	
	This module creates an LFSR with BITS provided as the parameter.
	The feedback of this LFSR will always be a xor of the 0th and 2nd bit
	into the last bit;
	
	NOTE: the minimum value allowable is thus 4 BITS
*/

module LFSR
# (parameter B = 5)
(
	input 	logic 					clk,
	input		logic						reset,
	
	output	logic[(B-1):0]		current_value			// one word of BITS size 
	
);
	//localparam B = (BITS < 4) ? 4 : BITS;				// if amount of bits is smaller then 4 force the size to 4

	
	
	always_ff @(posedge clk) begin
		if (reset)	begin
			current_value <= {B{1'b1}};
		end
		else if(current_value == {B{1'b0}}) begin		// Create a mux to load the LFSR in the case of the all 0 state
			current_value <= {B{1'b1}};
		end
		else begin
			current_value <= {current_value[0] ^ current_value[2], current_value[(B-1)], current_value[(B-2):1]};
		end
	end

endmodule
