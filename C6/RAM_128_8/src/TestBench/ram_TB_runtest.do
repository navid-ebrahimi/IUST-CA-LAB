SetActiveLib -work
comp -include "$dsn\src\RAM.vhd" 
comp -include "$dsn\src\TestBench\ram_TB.vhd" 
asim +access +r TESTBENCH_FOR_ram 
wave 
wave -noreg CS
wave -noreg WE
wave -noreg OE
wave -noreg datain
wave -noreg dataout
wave -noreg address
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\ram_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_ram 
