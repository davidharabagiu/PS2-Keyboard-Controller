library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity KEYBOARD is
 port (C, KB_CLOCK, KB_DATA, CLR: in STD_LOGIC;
        AN : out STD_LOGIC_VECTOR (3 downto 0);
        Q : out STD_LOGIC_VECTOR (7 downto 0));
end KEYBOARD;

architecture Behavioral of KEYBOARD is

component DISPLAY
    port (C: in STD_LOGIC;
		D0, D1, D2, D3: in STD_LOGIC_VECTOR(7 downto 0);
		AN: out STD_LOGIC_VECTOR(3 downto 0);
		Q: out STD_LOGIC_VECTOR(7 downto 0));
end component;

component KB_CONTROLLER
    port (KB_DATA, KB_CLOCK, C : in STD_LOGIC;
	SEGMENTS: out STD_LOGIC_VECTOR(6 downto 0);
	BREAK: out STD_LOGIC);
end component;

component SI_MEM
  port (C, CLR: in std_logic;
        DIN : in STD_LOGIC_VECTOR(6 downto 0);
        Q1,Q2,Q3,Q4: out STD_LOGIC_VECTOR(6 downto 0));
end component;
 
signal KEY: STD_LOGIC_VECTOR(6 downto 0);
signal Q1_INT, Q2_INT, Q3_INT, Q4_INT: STD_LOGIC_VECTOR(7 downto 0);
signal BREAK_CODE: STD_LOGIC;

begin
    KB : KB_CONTROLLER port map (KB_DATA, KB_CLOCK, C, KEY, BREAK_CODE);
    MEM : SI_MEM port map (BREAK_CODE, CLR, KEY, Q1_INT(6 downto 0), Q2_INT(6 downto 0), Q3_INT(6 downto 0), Q4_INT(6 downto 0));
    OUTPUT : DISPLAY port map (C, Q1_INT, Q2_INT, Q3_INT, Q4_INT, AN, Q);
    
    Q1_INT(7) <= '1';
    Q2_INT(7) <= '1';
    Q3_INT(7) <= '1';
    Q4_INT(7) <= '1';
end Behavioral;