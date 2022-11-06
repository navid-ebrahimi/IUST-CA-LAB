SetActiveLib -work
comp -include "$dsn\src\FA.vhd" 
comp -include "$dsn\src\adder4bit.vhd" 
comp -include "$dsn\src\TestBench\adder4bit_TB.vhd" 
asim +access +r TESTBENCH_FOR_adder4bit 
wave 
wave -noreg A
wave -noreg B
wave -noreg cin
wave -noreg S
wave -noreg cout
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\adder4bit_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_adder4bit 
