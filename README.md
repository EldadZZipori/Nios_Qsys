repo - https://github.com/EldadZZipori/Nios_Qsys

# DDS and NIOS
In this lab we use NIOS and a Direct Digital Synthesis module to display different modulated waves via VGA. 

# SOF file location
/rtl//dds_and_nios_lab_time_limited.sof
# Lab status
### Task 1s

    - 5 Bit LFSR ✔️
    - DDS instatntiation that outputs a 3Hz sin wave ✔️
    - ASK modulator ✔️
    - BPSK modulator ✔️
    - FSK modulator ✔️
    - QPSK modulator ✔️
    - Send signals to VGA ✔️
    - Synchronize data from slow clock to fast clock ✔️
    - Synchronize data from fast clock to slow clock ✔️
    - Allow chaning colors of buttons ✔️
    - Music [in progress]

# Important location
    - Signal Tap
    /rtl/SignalTap.stp
    - ASK Modulator
    /rtl/modules/ASK_modulator.sv
    - BPSK Modulator
    /rtl/modules/BPSK_modulator.sv
    - QPSK Modulator
    /rtl/modules/QPSK_modulator.sv
    - Fast to slow clock synchronization
    /rtl/modules/fast_to_slow.sv
    - Slow to Fast clock synchronization
    /rtl/modules/slow_to_fast.sv

# System level diagram  

![System level diagram](https://github.com/EldadZZipori/RC4_Breaker/blob/main/doc/ksa_system_level_diagram.png)

# Simulations

### Assign data to RAM (S) by index
![Assign By Index FSM](https://github.com/EldadZZipori/RC4_Breaker/blob/main/doc/task_1_annotated_simulation.png)


### Synchronizing switches for secret key
![Switches Sync](https://github.com/EldadZZipori/RC4_Breaker/blob/main/doc/switches_fsm_annotated_simulation.png)


### Shuffling RAM (S) data 
![Shuffle FSM](https://github.com/EldadZZipori/RC4_Breaker/blob/main/doc/shuffle_fsm_annotated_simulation.png)

### Reading ROM (D) data 
![ROM Reader](https://github.com/EldadZZipori/RC4_Breaker/blob/main/doc/rom_reader_annotated_simulation.png)

### Decrypting message
![Decrypt Message](https://github.com/EldadZZipori/RC4_Breaker/blob/main/doc/decryption_fsm_annotated_simulation.png)

### Determine Valid Message 
![Determine 1](https://github.com/EldadZZipori/RC4_Breaker/blob/main/doc/determine_valid_message_annotated_simulation_1.png)

![Determine 2](https://github.com/EldadZZipori/RC4_Breaker/blob/main/doc/determine_valid_message_annotated_simulation_2.png)

### Linear Feedback Shift Register 
![LFSR](https://github.com/EldadZZipori/RC4_Breaker/blob/main/doc/4_bit_lfsr_annotated_simulation.png)
# SignalTap (signal analyzer)

### Decrypted data RAM writer
![DE Writer FSM](https://github.com/EldadZZipori/RC4_Breaker/blob/main/doc/de_writer_fsm_signal_tap.png)

### Decryption (third loop) FSM
![Decryption FSM](https://github.com/EldadZZipori/RC4_Breaker/blob/main/doc/decryption_fsm_signal_tap.png)

### ROM data reader
![ROM Reader FSM](https://github.com/EldadZZipori/RC4_Breaker/blob/main/doc/rom_reader_signal_tap_new.png)

### Timing manager of complete algorithem (all three loops)
![Time machine FSM](https://github.com/EldadZZipori/RC4_Breaker/blob/main/doc/time_machine_fsm_signal_tap.png)

### Full Decryption Core
![Decryption Core FSM](https://github.com/EldadZZipori/RC4_Breaker/blob/main/doc/four_cores_operation_signal_tap_new.png)
