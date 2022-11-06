library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity HA is 
	port(
	A: in std_logic;
	B: in std_logic;
	Sum: out std_logic;
	C: out std_logic
	); 
end HA;

architecture HA_arc of HA is
begin
	Sum <= A xor B;
	C <= A and B;
end HA_arc;