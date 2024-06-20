module LFSR_tb();
	
	logic CLOCK_tb;
	logic reset_tb;
	logic[4:0] lfsr_counter_tb;
	
	LFSR # (.B(6))
	LFSR_inst
	(
		.clk				(CLOCK_tb),
		.reset			(reset_tb),
		.current_value	(lfsr_counter_tb)
	);
	
	initial begin
		CLOCK_tb = 0;
		forever #5 CLOCK_tb = ~CLOCK_tb;
	end
	
	initial begin
		reset_tb = 0;
		#20;
		reset_tb = 1;
		#10;
		reset_tb = 0;
	end
endmodule
