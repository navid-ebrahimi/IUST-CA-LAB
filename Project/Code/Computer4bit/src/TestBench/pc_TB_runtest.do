SetActiveLib -work
comp -include "$dsn\src\PC.vhd" 
comp -include "$dsn\src\TestBench\pc_TB.vhd" 
asim +access +r TESTBENCH_FOR_pc 
wave 
wave -noreg input
wave -noreg clk
wave -noreg output
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\pc_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_pc 
