/*
	SLOW TO FAST
	
	This module implements a synchronizer that moves data from a fast clock to a slower clock.
	
	A schematic for this module can be seen in doc/fast_to_slow.png
	
	Parameters 
	S	-	The number of bits in each word of data 
*/
module fast_to_slow
# (parameter S = 12)
(
	input		logic				slow_clk,
	input		logic				fast_clk,
	input		logic[(S-1):0]	async_data,
	output	logic[(S-1):0]	sync_data
);
	
	logic [(S-1):0] ff_2_d;
	logic [(S-1):0] ff_3_d;

	logic enable;
	
	ff_asyn_clr 	ff_1(.CLK(fast_clk), .CLR(1'b0), .D(async_data), .Q(ff_2_d)); 
	ff_asyn_clr_en ff_2(.CLK(fast_clk), .CLR(1'b0), .D(ff_2_d), .Q(ff_3_d), .E(enable)); 
	ff_asyn_clr	ff_3(.CLK(slow_clk), .CLR(1'b0), .D(ff_3_d), .Q(sync_data)); 
	
	
	logic ff_sync_2_d;
	ff_asyn_clr	ff_sync_1(.CLK(~fast_clk), .CLR(1'b0), .D(slow_clk), .Q(ff_sync_2_d)); 
	ff_asyn_clr	ff_sync_2(.CLK(~fast_clk), .CLR(1'b0), .D(ff_sync_2_d), .Q(enable)); 

	

endmodule


