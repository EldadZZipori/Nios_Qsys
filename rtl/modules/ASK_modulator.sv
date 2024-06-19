module ASK_modulator(
	input 	logic				modulator,

	input	 	logic [11:0]	sin_wave,
	input		logic [11:0]	cos_wave,
	input		logic [11:0]	squ_wave,
	input		logic [11:0]	saw_wave,


	output	logic [11:0]	sin_ask,
	output	logic [11:0]	cos_ask,
	output 	logic [11:0]	squ_ask,
	output 	logic [11:0]	saw_ask
);

	always @* begin
		case(modulator) 
			1'b1: begin// only pass wave when modulator is asserted
				sin_ask	=	sin_wave;
				cos_ask	=	cos_wave;
				squ_ask	=  squ_wave;
				saw_ask	=	saw_wave;
			end
			default: begin
				sin_ask	=	12'b0;
				cos_ask	=	12'b0;
				squ_ask	=  12'b0;
				saw_ask	=	12'b0;
			end
		endcase
	end

endmodule
