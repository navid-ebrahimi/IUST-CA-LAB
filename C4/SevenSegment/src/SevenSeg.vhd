library ieee;
use ieee.std_logic_1164.all;

entity SevenSegDecoder is
	port(
	A: in std_logic_vector(3 downto 0);
	O: out std_logic_vector(6 downto 0)
	);
end entity;

architecture SevenSegDecoder_behave of SevenSegDecoder is
begin					   
O <= "1111110" when A = "0000" else	
	"0110000" when A = "0001" else
	"1101101" when A = "0010" else
	"1111001" when A = "0011" else
	"0110011" when A = "0100" else
	"1011011" when A = "0101" else
	"1011111" when A = "0110" else
	"1110000" when A = "0111" else
	"1111111" when A = "1000" else
	"1111011" when A = "1001"; 
end SevenSegDecoder_behave;