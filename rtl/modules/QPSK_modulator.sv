/*
	QPSK MODULATOR
	
*/

module QPSK_modulator(
	input	logic  			clk,
	input logic				reset,
	input logic [1:0] 	IQ, // Get this from two different LFSRs
	
	output logic [11:0]	sin_qpsk
);
	logic [11:0] sin_phase [3:0];
	
	always_comb begin
		case(IQ)
			0:	sin_qpsk = sin_phase[0];
			1: sin_qpsk = sin_phase[1];
			2: sin_qpsk = sin_phase[2];
			3: sin_qpsk = sin_phase[3];
		endcase
	end
	
	
	localparam DDS_3Hz_increment = 258;	// (3 * 2^32)/(50 * 10^6) + 0.5 ≈ 258
	
	logic [3:0] reset_sin;
	
	/*
		The first signal is 3Hz output of sin, which means 1/3 periods per seconds
		we need to delay a generation of the same wave by 1/4
		
		second wave needs to start after 0.08333333333 sec
		third 0.16666666666 sec
		fourth 0.25 sec
		
		our main clock is 50MHz which is 20ns period
		second - 4166666 times
		thrid - 8333333.333 times
		fourth - 12500000
	*/
	
	localparam COUNT_2 = 4166666;
	localparam COUNT_3 = 8333333;
	localparam COUNT_4 = 12500000;
	
	logic [31:0] counter;
	
	always_ff @(posedge clk) begin
		if (reset) begin
			counter 		<= 0;
			reset_sin 	<= 0;
		end
		else begin
			if (counter == 1) begin
				reset_sin[0] <= 1'b1;
			end
			else if (counter == COUNT_2) begin
				reset_sin[1] <= 1'b1;
			end
			else if (counter == COUNT_3) begin
				reset_sin[2] <= 1'b1;
			end
			else if (counter == COUNT_4) begin
				reset_sin[3] <= 1'b1;
			end
			
			if (counter != COUNT_4) begin
				counter <= counter + 1'b1;
			end 
		end
	end
	
	waveform_gen qpsk_0
	(
		.clk			(clk),
		.reset		(reset_sin[0]),		// Inverted reset - resets when LOW
		
		.en			(reset_sin[0]),					// Enable (HIGH) the phase_inc signal to increase the phase accumulator
		.phase_inc	(DDS_3Hz_increment),	// unsigned 32bit phase increment to be accumulated. This phase is quantized to 12-bit 
													// that is passed to a lookup table whch converts the phase to a waveform
													// inc = (f_out * 2^32)/f_in + 0.5 where f is frequnecy
		
		/* Outputs */
		.sin_out		(sin_phase[0])			// all outputs are signed (2's complement) of size 12 bits
	);
	
	waveform_gen qpsk_90
	(
		.clk			(clk),
		.reset		(reset_sin[1]),		// Inverted reset - resets when LOW
		
		.en			(reset_sin[1]),					// Enable (HIGH) the phase_inc signal to increase the phase accumulator
		.phase_inc	(DDS_3Hz_increment),	// unsigned 32bit phase increment to be accumulated. This phase is quantized to 12-bit 
													// that is passed to a lookup table whch converts the phase to a waveform
													// inc = (f_out * 2^32)/f_in + 0.5 where f is frequnecy
		
		/* Outputs */
		.sin_out		(sin_phase[1])			// all outputs are signed (2's complement) of size 12 bits
	);
	
	waveform_gen qpsk_180
	(
		.clk			(clk),
		.reset		(reset_sin[2]),		// Inverted reset - resets when LOW
		
		.en			(reset_sin[2]),					// Enable (HIGH) the phase_inc signal to increase the phase accumulator
		.phase_inc	(DDS_3Hz_increment),	// unsigned 32bit phase increment to be accumulated. This phase is quantized to 12-bit 
													// that is passed to a lookup table whch converts the phase to a waveform
													// inc = (f_out * 2^32)/f_in + 0.5 where f is frequnecy
		
		/* Outputs */
		.sin_out		(sin_phase[2])			// all outputs are signed (2's complement) of size 12 bits
	);
	
	waveform_gen qpsk_270
	(
		.clk			(clk),
		.reset		(reset_sin[3]),		// Inverted reset - resets when LOW
		
		.en			(reset_sin[3]),					// Enable (HIGH) the phase_inc signal to increase the phase accumulator
		.phase_inc	(DDS_3Hz_increment),	// unsigned 32bit phase increment to be accumulated. This phase is quantized to 12-bit 
													// that is passed to a lookup table whch converts the phase to a waveform
													// inc = (f_out * 2^32)/f_in + 0.5 where f is frequnecy
		
		/* Outputs */
		.sin_out		(sin_phase[3])			// all outputs are signed (2's complement) of size 12 bits
	);
endmodule
