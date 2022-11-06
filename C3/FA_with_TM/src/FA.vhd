library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity full_adder is
	port (
	i1 : in std_logic;
	i2 : in std_logic;
	cin : in std_logic;
	
	sum : out std_logic;
	cout : out std_logic
	);					
end full_adder;


architecture FA of full_adder is

signal w1 : std_logic;
signal w2 : std_logic;
signal w3 : std_logic;

begin
	w1 <= i1 xor i2;
	w2 <= w1 and cin;
	w3 <= i1 and i2;
	
	sum <= w1 xor cin;
	cout <= w2 or w3;
	
end FA;		