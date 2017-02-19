library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- D flip-flop on rising edge with clock enable

entity DFF is
	port (C, D, CE: in STD_LOGIC;
		Q, NQ: out STD_LOGIC);
end DFF;

architecture DFF of DFF is
signal Q_INT: STD_LOGIC;
begin
	process (C) begin
		if rising_edge(C) then
		  if CE = '1' then
			Q_INT <= D;
	      end if;
		end if;
	end process;
	Q <= Q_INT;
	NQ <= not Q_INT;
end DFF;
		
	