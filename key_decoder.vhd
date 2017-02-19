library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity KEY_DECODER is
	port(I: in STD_LOGIC_VECTOR(7 downto 0);
	O: out STD_LOGIC_VECTOR(6 downto 0);
	ERR, BREAK: out STD_LOGIC);
end KEY_DECODER;

architecture KEY_DECODER of KEY_DECODER is

component KB_CODES_ROM
	port (ADDR: in STD_LOGIC_VECTOR(7 downto 0);
	CONTENT: out STD_LOGIC_VECTOR(7 downto 0));
end component;

signal SEGMENTS: STD_LOGIC_VECTOR(7 downto 0);
signal BREAK_INT: STD_LOGIC;

begin
	
	mem: KB_CODES_ROM port map(I, SEGMENTS);
	
	O <= not SEGMENTS(6 downto 0);
		
	BREAK_INT <= '1' when I = x"F0" else '0';
	
	ERR <= not BREAK_INT when SEGMENTS = x"00" else '0';
		
	BREAK <= BREAK_INT;
	
end KEY_DECODER;