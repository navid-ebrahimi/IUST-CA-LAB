library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BCDadder is
	port( 
	A: in std_logic_vector(3 downto 0);
	B: in std_logic_vector(3 downto 0);
	cin: in std_logic;
	
	S: out std_logic_vector(3 downto 0);
	cout: out std_logic
	);
end BCDadder;

architecture BCDadder_arch of BCDadder is
component adder4bit
	port(
	A: in std_logic_vector(3 downto 0);
	B: in std_logic_vector(3 downto 0);
	cin: in std_logic;
	
	S: out std_logic_vector(3 downto 0);
	cout: out std_logic
	);
end component;	

signal s1, result: std_logic_vector(3 downto 0);		 
signal cout1: std_logic;

begin
	adder1: adder4bit port map(A, B, cin, s1, cout1);  
	result(1) <= (s1(3) and s1(2)) or (s1(3) and s1(1)) or cout1;
	result(2) <= (s1(3) and s1(2)) or (s1(3) and s1(1)) or cout1;   
	result(0) <= '0';
	result(3) <= '0';
	adder2: adder4bit port map(s1, result, '0', S, cout);
end BCDadder_arch;