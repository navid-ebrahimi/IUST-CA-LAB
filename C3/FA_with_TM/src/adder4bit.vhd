library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Adder4bit is
	port(
	A: in std_logic_vector(3 downto 0);
	B: in std_logic_vector(3 downto 0);
	cin: in std_logic;
	
	S: out std_logic_vector(3 downto 0);
	cout: out std_logic
	);
end Adder4bit;

architecture adder_behave of Adder4bit is
component full_adder
	port (
	i1 : in std_logic;
	i2 : in std_logic;
	cin : in std_logic;
	
	sum : out std_logic;
	cout : out std_logic
	);	
end component;
signal c1, c2, c3: std_logic;
begin
	FA1: full_adder port map(A(0), B(0), cin, S(0), c1);
	FA2: full_adder port map(A(1), B(1), c1, S(1), c2);
	FA3: full_adder port map(A(2), B(2), c2, S(2), c3);
	FA4: full_adder port map(A(3), B(3), c3, S(3), cout);		
end adder_behave;