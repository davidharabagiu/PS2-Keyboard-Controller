library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity KB_CONTROLLER is
	port (KB_DATA, KB_CLOCK, C : in STD_LOGIC;
	SEGMENTS: out STD_LOGIC_VECTOR(6 downto 0);
	BREAK : out STD_LOGIC);
end KB_CONTROLLER;

architecture ASD of KB_CONTROLLER is

component SRFEAPL
	generic ( N: INTEGER := 8 ); 
	port ( C, CE, SI, LEFT, CLR, PL: in STD_LOGIC;
		DATA: in STD_LOGIC_VECTOR(N - 1 downto 0);
		Q: out STD_LOGIC_VECTOR(N - 1 downto 0) );
end component;

component DRFESPL
	generic (N: INTEGER := 8);
	port (C, CLR, PL: in STD_LOGIC;
		DATA: in STD_LOGIC_VECTOR(N - 1 downto 0);
		Q: out STD_LOGIC_VECTOR(N - 1 downto 0));
end component;

component KEY_DECODER
	port(I: in STD_LOGIC_VECTOR(7 downto 0);
	O: out STD_LOGIC_VECTOR(6 downto 0);
	ERR, BREAK: out STD_LOGIC);
end component;	 

component FILTER 
	port(I, C: in STD_LOGIC;
	F: out STD_LOGIC);
end component;

component DFF
	port (C, D, CE: in STD_LOGIC;
	Q, NQ: out STD_LOGIC);
end component;

component CRESPL
	generic (N: INTEGER := 8);
	port (C, CLR, PL: in STD_LOGIC;
	DATA: in STD_LOGIC_VECTOR(N - 1 downto 0);
	Q: out STD_LOGIC_VECTOR(N - 1 downto 0));
end component;

signal FREQ_DIV_Q: STD_LOGIC_VECTOR(7 downto 0);
signal KB_CLOCK_F: STD_LOGIC;
signal KB_DATA_F: STD_LOGIC;
signal KEY_READ: STD_LOGIC;
signal KEY_READ_DELAYED: STD_LOGIC;
signal KB_INPUT: STD_LOGIC_VECTOR(10 downto 0);
signal KEY_CODE: STD_LOGIC_VECTOR(7 downto 0);
signal KEY_DECODED: STD_LOGIC_VECTOR(6 downto 0); 
signal DECODER_ERR: STD_LOGIC;
signal BREAK_CODE: STD_LOGIC;
signal PASS_TO_OUTPUT: STD_LOGIC;

begin
	
	-- divide clock frequency
	DIV: CRESPL generic map(8) port map(C, '0', '0', (others => '0'),  FREQ_DIV_Q);
	
	-- debounce keybord signals
	FILTER_CLOCK: FILTER port map(KB_CLOCK, C, KB_CLOCK_F);
	FILTER_DATA: FILTER port map(KB_DATA, C, KB_DATA_F);
	
	-- serial input from keyboard
	INPUT_REG: SRFEAPL generic map(11) port map(KB_CLOCK_F, '1', KB_DATA_F, '0', '0', KEY_READ_DELAYED, (others => '1'), KB_INPUT);
	KEY_READ <= not KB_INPUT(0);
	
	-- delay key_read
	DELAY: DFF port map (FREQ_DIV_Q(7), KEY_READ, '1', KEY_READ_DELAYED);
	
	-- load key code in register
	REG: DRFESPL generic map (8) port map (C, '0', KEY_READ, KB_INPUT(8 downto 1), KEY_CODE);
	
	-- decode key
	DEC: KEY_DECODER port map (KEY_CODE, KEY_DECODED, DECODER_ERR, BREAK_CODE); 
	PASS_TO_OUTPUT <= not BREAK_CODE;
	
	-- output register
	OUTPUT_REG: DRFESPL generic map (7) port map (C, '0', PASS_TO_OUTPUT, KEY_DECODED, SEGMENTS);
	
	BREAK <= BREAK_CODE;

end ASD;