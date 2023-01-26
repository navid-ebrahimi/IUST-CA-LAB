library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Register File has the data of registers.
entity RegisterFile is 			  
	port(
	readr1: in std_logic_vector(1 downto 0);
	readr2: in std_logic_vector(1 downto 0);
	writer: in std_logic_vector(1 downto 0);
	writed: in std_logic_vector(3 downto 0); 
	regwrite: in std_logic;
	readd1: out std_logic_vector(3 downto 0);
	readd2: out std_logic_vector(3 downto 0)
	);
end RegisterFile;							

architecture RegisterFile_behave of RegisterFile is	  
type RegFile_type is array(0 to 3) of std_logic_vector(3 downto 0);
signal regfile: RegFile_type := ("0011",
								 "0100",
								 "0000",
								 "0000");
begin
	process(readr1, readr2, writer, writed, regwrite)
	begin
		readd1 <= regfile(to_integer(unsigned(readr1)));
		readd2 <= regfile(to_integer(unsigned(readr2)));
		if writed'event then
			regfile(to_integer(unsigned(writer))) <= writed;
		end if;
	end process;
	
end RegisterFile_behave;

