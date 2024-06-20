module BPSK_modulator(
	input 	logic				modulator,

	input	 	logic [11:0]	sin_wave,
	input		logic [11:0]	cos_wave,
	input		logic [11:0]	squ_wave,
	input		logic [11:0]	saw_wave,


	output	logic [11:0]	sin_bpsk,
	output	logic [11:0]	cos_bpsk,
	output 	logic [11:0]	squ_bpsk,
	output 	logic [11:0]	saw_bpsk
);

	logic [11:0]	minus_sin;
	logic [11:0]	minus_cos;
	logic [11:0]	minus_squ;
	logic [11:0]	minus_saw;

	
	assign minus_sin = 	(~sin_wave + 1'b1); // 2nd comliment
	assign minus_cos =	(~cos_wave + 1'b1);
	assign minus_squ =	(~squ_wave + 1'b1);
	assign minus_saw = 	(~saw_wave + 1'b1);
	

	always_comb begin
		if(modulator) begin
				sin_bpsk	=	sin_wave;
				cos_bpsk	=	cos_wave;
				squ_bpsk	=  squ_wave;
				saw_bpsk	=	saw_wave;
		end 
		else begin 
				sin_bpsk	=	minus_sin;
				cos_bpsk	=	minus_cos;
				squ_bpsk	=  minus_squ;
				saw_bpsk	=	minus_saw;
		end
	end
endmodule
