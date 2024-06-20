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
	
	

	output logic [11:0] selected_modulation,
	output logic [11:0] selected_signal
);
	
	logic [3:0]i;
 
	always_comb begin
		case (signal_selector)
			0:	begin
				selected_signal = sin_wave;
				i = 0;
			end
			1: begin
				selected_signal = cos_wave;
				i = 1;
			end
			2:  begin
				selected_signal = squ_wave;
				i = 2;
			end
			3:  begin
				selected_signal = saw_wave;
				i = 3;
			end
			default: begin
				selected_signal = 0;
				i = 0;
			end
		endcase
	end
	
	always_comb begin
		case (modulation_selector)
			0:	selected_modulation = ask_mod[i];
			1: selected_modulation = bpsk_mod[i];
			2: selected_modulation = fsk_mod[i];
			3: selected_modulation = ask_mod[i];
			default: selected_modulation = 0;
		endcase
	end
endmodule
