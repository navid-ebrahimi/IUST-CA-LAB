library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Program Counter only counts the instruction that is going to be run
entity PC is 
	port(
	input: in std_logic_vector(3 downto 0) := "0000";	
	clk: in std_logic;
	output: out std_logic_vector(3 downto 0) := "0000"
	);
end PC;

architecture PC_behave of PC is
begin
	process(clk, input)
	begin
		if rising_edge(clk) then
			output<=input;
		end if;
	end process;
end PC_behave;
