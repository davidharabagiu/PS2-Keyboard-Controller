library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FILTER is
	port(I, C: in STD_LOGIC;
	F: out STD_LOGIC);
end FILTER;

architecture FILTER of FILTER is
signal INT: STD_LOGIC_VECTOR(7 downto 0);
begin										   
	process(C)
	begin 
	if rising_edge(C) then 
		INT(7) <= I;					   
		INT(6 downto 0) <= INT(7 downto 1);
		if INT = x"00" then
			F <= '0';
		elsif INT = x"FF" then
			F <= '1';
		end if;	 
	end if;
	end process;
end FILTER;
