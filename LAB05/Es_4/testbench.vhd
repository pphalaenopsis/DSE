library ieee;
use ieee.std_logic_1164.all;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS

-- component
COMPONENT TickerTapeHelloFSM IS 
PORT (
	KEY: IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- KEY(0) -> reset
	CLOCK_50: IN STD_LOGIC; -- clock
	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: OUT STD_LOGIC_VECTOR(6 DOWNTO 0) 
);
END COMPONENT;

--signals
SIGNAL DISP0, DISP1, DISP2, DISP3, DISP4, DISP5: STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL CLK, RST: STD_LOGIC := '0';
SIGNAL KEYS: STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN

CLK <= not(CLK) after 10 ns;
PROCESS
BEGIN

  RST <= '0';  --active low
  
  WAIT FOR 50 ns;
  RST <= '1';
  WAIT FOR 10000 ns;

END PROCESS;
KEYS(3 downto 0) <= "000" & RST;
dutFSMhello: TickerTapeHelloFSM PORT MAP(KEYS, CLK, DISP0, DISP1, DISP2, DISP3, DISP4, DISP5); 
END behavior;