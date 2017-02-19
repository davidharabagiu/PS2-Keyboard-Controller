library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity KB_CODES_ROM is
	port (ADDR: in STD_LOGIC_VECTOR(7 downto 0);
	CONTENT: out STD_LOGIC_VECTOR(7 downto 0));
end KB_CODES_ROM;

architecture ROM of KB_CODES_ROM is

type MEMORY_MAP is array(0 to 255) of STD_LOGIC_VECTOR(7 downto 0);

signal MMAP: MEMORY_MAP;

begin
	MMAP <= (21 => x"7A",
	22 => x"12",
	26 => x"5D",
	27 => x"6B",
	28 => x"7E",
	29 => x"31",
	30 => x"5D",
	33 => x"65",
	34 => x"3E",
	35 => x"1F",
	36 => x"6D",
	37 => x"3A",
	38 => x"5B",
	42 => x"07",
	43 => x"6C",
	44 => x"2D",
	45 => x"0C",
	46 => x"6B",
	49 => x"0E",
	50 => x"2F",
	51 => x"3E",
	52 => x"7B",
	53 => x"3B",
	54 => x"6F",
	58 => x"46",
	59 => x"17",
	60 => x"37",
	61 => x"52",
	62 => x"7F",
	66 => x"3E",
	67 => x"24",
	68 => x"77",
	69 => x"77",
	70 => x"7B",
	75 => x"25",
	77 => x"7C",
	others => x"00");
	
	CONTENT <= MMAP(conv_integer(ADDR));
end ROM;