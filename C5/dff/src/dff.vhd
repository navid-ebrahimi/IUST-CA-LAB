library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity dff is
	port(
	D: in std_logic;
	Q, Qp: out std_logic;
	CLK: in std_logic
	);
end dff;

architecture dff_arch of dff is
begin			 
	process(CLK, D)
	begin
	if (CLK'event and CLK='1') then
		Q <= D;
		Qp <= not D;	  
	end if;
	end process;
	
end architecture;
