onerror {resume}
quietly set dataset_list [list sim ask_simulation]
if {[catch {datasetcheck $dataset_list}]} {abort}
quietly WaveActivateNextPane {} 0
add wave -noupdate sim:/ASK_modulator_tb/CLOCK_50_tb
add wave -noupdate sim:/ASK_modulator_tb/modulator
add wave -noupdate -format Analog-Step -height 74 -max 2047.0 -min -2047.0 sim:/ASK_modulator_tb/sin_wave_tb
add wave -noupdate -format Analog-Step -height 74 -max 2047.0 -min -2047.0 sim:/ASK_modulator_tb/sin_ask_tb
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 281
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
WaveRestoreZoom {171 ps} {939 ps}
