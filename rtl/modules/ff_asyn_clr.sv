module ff_asyn_clr
# (parameter S = 12)
(
	input logic CLK,
	input logic CLR,
	input logic[(S-1):0] D,
	output logic[(S-1):0] Q);
	
		always @(posedge CLK, posedge CLR) begin
			if (CLR) begin
				Q <= 1'b0;
			end
			else if (CLK) begin
				Q <= D;
			end
		end
endmodule