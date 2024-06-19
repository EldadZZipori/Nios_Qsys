module ff_asyn_clr(
	input CLK,
	input CLR,
	input D,
	output Q);
	
		always @(posedge CLK, posedge CLR) begin
			if (CLR) begin
				Q <= 1'b0;
			end
			else if (CLK) begin
				Q <= D;
			end
		end
endmodule

module ff_asyn_clr_en(
	input CLK,
	input CLR,
	input D,
	input E,
	output Q);
	
		always @(posedge CLK, posedge CLR) begin
			if (CLR) begin
				Q <= 1'b0;
			end
			else if (CLK & E) begin
				Q <= D;
			end
		end
endmodule


module hw1_q7(
	input async_sig,
	input out_clk,
	output out_sync_sig
);

	// t - top, b - bottom
	// l - left, m - middle, r - right
	wire tl_q, tm_q, tr_q, bl_q;
	parameter VCC = 1'b1;
	parameter GND = 1'b0;
	
	ff_asyn_clr tl_ff(.CLK(async_sig), .CLR(bl_q), .D(VCC), .Q(tl_q)); // bl_q assignment in bl_ff
	ff_asyn_clr tm_ff (.CLK(out_clk), .CLR(GND), .D(tl_q), .Q(tm_q));
	ff_asyn_clr tr_ff (.CLK(out_clk), .CLR(GND), .D(tm_q), .Q(tr_q));
	ff_asyn_clr bl_ff (.CLK(~out_clk), .CLR(GND), .D(tr_q), .Q(bl_q)); // NOTE the inversion on CLK
	
	assign out_sync_sig = tr_q;

endmodule
