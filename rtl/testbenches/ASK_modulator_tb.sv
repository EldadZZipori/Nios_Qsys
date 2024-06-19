module ASK_modulator_tb();
	localparam CLOCK_50MHz_TO_1HZ_RATIO 	=	4;

	logic			reset_tb;
	logic 		modulator;
	logic 		CLOCK_50_tb;
	logic			outclk_Not_tb;
	logic[4:0] 	lfsr_counter_tb;
	logic 		Clock_1Hz_tb;
	
	logic [31:0] DDS_RATIO ;
	
	initial begin
		DDS_RATIO = 1073741820;
	end
			
	/*
		Part 2 -
		Instatntiating the DDS
	*/
	//localparam DDS_3Hz_increment = 258;	// (3 * 2^32)/(50 * 10^6) + 0.5 ≈ 258
	logic 			enable_inc_tb;
	logic [31:0]	dds_increment_tb;
	logic [11:0]	sin_wave_tb;
	logic [11:0]	cos_wave_tb;
	logic [11:0]	squ_wave_tb;
	logic [11:0]	saw_wave_tb;

	waveform_gen dds
	(
		.clk			(CLOCK_50_tb),
		.reset		(reset_tb),				// Inverted reset - resets when LOW
		
		.en			(enable_inc_tb),		// Enable (HIGH) the phase_inc signal to increase the phase accumulator
		.phase_inc	(DDS_RATIO),			// unsigned 32bit phase increment to be accumulated. This phase is quantized to 12-bit 
													// that is passed to a lookup table whch converts the phase to a waveform
													// inc = (f_out * 2^32)/f_in + 0.5 where f is frequnecy
		
		/* Outputs */
		.sin_out		(sin_wave_tb),				// all outputs are signed (2's complement) of size 12 bits
		.cos_out		(cos_wave_tb),
		.squ_out		(squ_wave_tb),
		.saw_out		(saw_wave_tb)
	);

	/*
		Part 3 -
		ASK and BPSK modulation
	*/

	// ASK
	logic [11:0]	sin_ask_tb;
	logic [11:0]	cos_ask_tb;
	logic [11:0]	squ_ask_tb;
	logic [11:0]	saw_ask_tb;

	ASK_modulator  ask_modulator_inst(
		.modulator	(modulator),

		.sin_wave	(sin_wave_tb),
		.cos_wave	(cos_wave_tb),
		.squ_wave	(squ_wave_tb),
		.saw_wave	(saw_wave_tb),

		.sin_ask		(sin_ask_tb),
		.cos_ask		(cos_ask_tb),
		.squ_ask		(squ_ask_tb),
		.saw_ask		(saw_ask_tb)
	);
	

	
	
	initial begin
		CLOCK_50_tb = 0;
		forever #5 CLOCK_50_tb = ~CLOCK_50_tb;
	end
	
	initial begin
		modulator = 0;
		forever #100 modulator = ~modulator;
	end
	
	initial begin
		reset_tb = 1;
		enable_inc_tb = 1;
	end
	initial begin
		reset_tb = 1;
		#20;
		reset_tb = 0;
		#10;
		reset_tb = 1;
	end
	
	initial begin
		enable_inc_tb = 0;
		#40;
		enable_inc_tb = 1;
	end

	
	
endmodule
