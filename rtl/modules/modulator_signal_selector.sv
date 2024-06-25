/*
	MODULATOR SIGNAL SELECTOR 
	
	This module selects the correct signal and modulated signal to display.
	
*/

module modulator_signal_selector
# (parameter S = 12)
(
	input logic [7:0] signal_selector,
	input logic [3:0] modulation_selector,
	
	input logic [11:0]	sin_wave,
	input logic [11:0]	cos_wave,
	input logic [11:0]	squ_wave,
	input logic [11:0]	saw_wave,
	
	input logic [11:0]	ask_mod[3:0],
	input logic [11:0]	fsk_mod[3:0],
	input logic [11:0]	bpsk_mod[3:0],
	input	logic [11:0] 	sin_qpsk,
	
	input logic	[11:0]		LFSR,

	output logic [11:0] selected_modulation,
	output logic [11:0] selected_signal
);
	
 
	always_comb begin
		case (signal_selector)
			0:	begin
				selected_signal = sin_wave;
			end
			1: begin
				selected_signal = cos_wave;
			end
			2:  begin
				selected_signal = saw_wave;
			end
			3:  begin
				selected_signal = squ_wave;
			end
			default: begin
				selected_signal = squ_wave;
			end
		endcase
	end
	
	always_comb begin
		case (modulation_selector)								// Modulation only displays the sin wave
			0:	selected_modulation = ask_mod[0];
			1: selected_modulation = fsk_mod[0];
			2: selected_modulation = bpsk_mod[0];
			3: selected_modulation = LFSR;
			4: selected_modulation = sin_qpsk;
			default: selected_modulation = ask_mod[0];
		endcase
	end
endmodule
