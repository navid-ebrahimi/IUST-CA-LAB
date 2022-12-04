library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity RAM is 
	port(
	CS: in std_logic;
	WE: in std_logic;
	OE: in std_logic;
	datain: in std_logic_vector(7 downto 0);
	dataout: out std_logic_vector(7 downto 0);
	address:in std_logic_vector(6 downto 0)
	);
end entity;

architecture RAM_behave of RAM is
	type MEM_128_8 is array(2**7-1 downto 0) of std_logic_vector(7 downto 0); 
	signal ram1: MEM_128_8 := (others => (others=>'0'));
begin			
	dataout <= (others=> 'Z');
	process(WE, OE, CS, address) 
	begin
		if(CS = '1') then
			if(rising_edge(WE)) then
				ram1(to_integer(unsigned(address))) <= datain;
			elsif (WE = '0' and OE = '1') then
				dataout <= ram1(to_integer(unsigned(address)));	 
			else
				dataout <= (others => 'Z');
			end if;
		end if;						
	end process;
end architecture;
