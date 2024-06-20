onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /qpsk_modulator_tb/s_lfsr_counter
add wave -noupdate -radix hexadecimal /qpsk_modulator_tb/lfsr_counter
add wave -noupdate /qpsk_modulator_tb/clk_lfst_tb
add wave -noupdate /qpsk_modulator_tb/clk_tb
add wave -noupdate /qpsk_modulator_tb/sin_qpsk_tb
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 278
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 100
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {870 ps}
