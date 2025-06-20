# Counter-in-System-Verilog
This project verifies an 8-bit up-counter using SystemVerilog. The counter increments its output on every positive clock edge when the control signal exact is low, and holds its current value when exact is high.

The testbench is modular and includes:
Clock generation (clk)
Reset generation (rst held high for 2 cycles)
Random stimulus for exact using $urandom_range(0,1)
Output comparison logic to check:
If exact == 0 → out must increment
If exact == 1 → out must stay constant
Pass/Fail logging and waveform dump (dump.vcd)
