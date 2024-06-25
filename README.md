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
    - Music ✔️

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

![System level diagram](https://github.com/EldadZZipori/Nios_Qsys/blob/main/doc/system_diagram.png)

# Simulations
### LFSR Simulation
![ASK Simulation](https://github.com/EldadZZipori/Nios_Qsys/blob/main/doc/LFSR_simulation.png)
### ASK Modulator Simulation
![ASK Simulation](https://github.com/EldadZZipori/Nios_Qsys/blob/main/doc/ask_simulation.png)

### BSPK Modulator Simulation
![BSPK Simulation](https://github.com/EldadZZipori/Nios_Qsys/blob/main/doc/bspk_simulation.png)


### PQSK Modulator Simulation
![PQSK Simulation](https://github.com/EldadZZipori/Nios_Qsys/blob/main/doc/pqsk_simulation.png)

### Fast Clock to Slow Clock Data Transfer Simulation
![Fast to Slow Simulation](https://github.com/EldadZZipori/Nios_Qsys/blob/main/doc/fast_to_slow_simulation.png)

### Slow Clock to Fast Clock Data Transfer Simulation
![Slow to Fast Simulation](https://github.com/EldadZZipori/Nios_Qsys/blob/main/doc/slow_to_fast_simulation.png)

# SignalTap (signal analyzer)
### Modulated and Selected Waves SignalTap
![Modulated Selected SignalTap](https://github.com/EldadZZipori/Nios_Qsys/blob/main/doc/signal_modulation_selection_signalTap.png)

### PQSK SignalTap
![PQSK SignalTap](https://github.com/EldadZZipori/Nios_Qsys/blob/main/doc/pqsk_singalTap.png)

### Fast to Slow Data Transfer SignalTap
![Fast to Slow SignalTap](https://github.com/EldadZZipori/Nios_Qsys/blob/main/doc/fast_to_slow_signalTap.png)
