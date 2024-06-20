module qpsk_modulator_tb();

logic [5:0] s_lfsr_counter;

logic[4:0] 	lfsr_counter;

logic clk_lfst_tb;
logic clk_tb;
logic reset_tb;

logic [11:0] sin_qpsk_tb;
QPSK_modulator qpsk_modulator_inst(
	.clk			(clk_tb),
	.reset		(reset_tb),
	.IQ			({lfsr_counter[0],s_lfsr_counter[0]}),
	
	.sin_qpsk	(sin_qpsk_tb)
);


initial begin
	clk_tb = 0;
	forever #20 clk_tb = ~clk_tb;
end

initial begin
	clk_lfst_tb = 0;
	forever #40 clk_lfst_tb = ~clk_lfst_tb;
end

initial begin
	reset_tb = 0;
	#10
	reset_tb = 1;
	#30
	reset_tb = 0;
end

    initial begin
        $randomize; // Initialize random number generator

        // Run simulation for some time
        repeat (100) begin // Adjust the repeat count as needed
            #20; // Wait for one slow clock cycle

            // Generate random data for async_data
            lfsr_counter = $random;
				s_lfsr_counter = $random;
        end
    end
endmodule
