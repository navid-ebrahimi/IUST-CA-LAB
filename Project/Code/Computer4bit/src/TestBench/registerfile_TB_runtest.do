SetActiveLib -work
comp -include "$dsn\src\RegisterFile.vhd" 
comp -include "$dsn\src\TestBench\registerfile_TB.vhd" 
asim +access +r TESTBENCH_FOR_registerfile 
wave 
wave -noreg readr1
wave -noreg readr2
wave -noreg writer
wave -noreg writed
wave -noreg regwrite
wave -noreg readd1
wave -noreg readd2
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\registerfile_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_registerfile 
