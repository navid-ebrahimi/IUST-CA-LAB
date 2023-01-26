library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- This is ALU. Calculates only "XOR" operation as was mentions in project document.
entity ALU is 
	port(
	opnd1: in std_logic_vector(3 downto 0);
	opnd2: in std_logic_vector(3 downto 0);
	op: in std_logic_vector(1 downto 0);
	result: out std_logic_vector(3 downto 0)
	);
end ALU;

architecture ALU_behave of ALU is
begin
	process(opnd1, opnd2, op)
	begin
		if op = "01" then
			result <= opnd1 xor opnd2;
		end if;
	end process;
end ALU_behave;
