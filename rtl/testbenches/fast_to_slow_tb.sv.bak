module fast_to_slow_tb();

    // Parameters
    localparam S = 12; // Parameter S for the slow_to_fast module
    localparam CLK_PERIOD_SLOW = 20; // Slow clock period in simulation time units
    localparam CLK_PERIOD_FAST = 10; // Fast clock period in simulation time units

    // Signals
    logic slow_clk = 0;
    logic fast_clk = 0;
    logic [(S-1):0] async_data;
    logic [(S-1):0] sync_data;

    // Instantiate the module under test
    fast_to_slow #(.S(S)) uut (
        .slow_clk(slow_clk),
        .fast_clk(fast_clk),
        .async_data(async_data),
        .sync_data(sync_data)
    );

    // Clock generation processes
    always begin
        #(CLK_PERIOD_SLOW/2) slow_clk = ~slow_clk; // Toggle slow clock every half period
    end

    always begin
        #(CLK_PERIOD_FAST/2) fast_clk = ~fast_clk; // Toggle fast clock every half period
    end

    // Generate random data for async_data
    initial begin
        $randomize; // Initialize random number generator

        // Run simulation for some time
        repeat (100) begin // Adjust the repeat count as needed
            #CLK_PERIOD_SLOW; // Wait for one slow clock cycle

            // Generate random data for async_data
            async_data = $random;

            // Print the values (optional, for debugging)
            $display("Time %0t: async_data = %h", $time, async_data);
        end

        // Finish simulation after generating data
        $finish;
    end

endmodule
