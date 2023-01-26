library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-- Instruction Memory saves Instructions that will be run in cpu.
-- For this project instructions are hard coded in a ROM type in architecture

entity InstructionMemory is
	port(
	addr: in std_logic_vector(3 downto 0);
	readr1: out std_logic_vector(1 downto 0);
	readr2: out std_logic_vector(1 downto 0);
	writer: out std_logic_vector(1 downto 0);  
	op: out std_logic_vector(1 downto 0)
	);									
end InstructionMemory;

architecture InstructionMemory_behave of InstructionMemory is
type Mem_type is array(0 to 15) of std_logic_vector(7 downto 0);
signal mem: Mem_type :=    ("10000101",
							"11011001",
							"00101101",
							"01110001",
							"10000101",
							"11011001",
							"00000000",
							"00000000",
							"00000000",
							"00000000",
							"00000000",
							"00000000",
							"00000000",
							"00000000",
							"00000000",
							"00000000");
							
signal data:std_logic_vector(7 downto 0) := "00000000";
							
begin							
	data <= mem(to_integer(unsigned(addr)));
	writer <= data(7 downto 6);
	readr1 <= data(5 downto 4);
	readr2 <= data(3 downto 2);
	op <= data(1 downto 0);
end InstructionMemory_behave;