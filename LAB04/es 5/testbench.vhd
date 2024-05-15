LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS


COMPONENT reactionCounter IS
PORT( 
	
	SW: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	KEY: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	CLOCK_50: IN STD_LOGIC;
	Qdowncount: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Qupcount: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	LEDR: OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
        HEX0,HEX1,HEX2,HEX3: OUT std_logic_vector(6 DOWNTO 0)
		

);
END COMPONENT;
 
-- testbench signals
SIGNAL clock_50: STD_LOGIC:='0';
SIGNAL keys: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Qd: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Qu: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL rst: STD_LOGIC:='0';
SIGNAL SWITCHES: STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL LIGHTS: STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL DISP1, DISP2, DISP3, DISP4: STD_LOGIC_VECTOR(6 DOWNTO 0);


BEGIN 

clock_50 <= not(clock_50) after 10 ns;

PROCESS
BEGIN
  -- first test
  rst<='0';  --active low
  SWITCHES <= "11111111"; --255 ms
  keys(3) <= '0';
  WAIT FOR 50 ns;
  rst<='1';
  keys(3) <= '1';
  WAIT FOR 70808 ns;
  keys(3) <= '0';
  WAIT for 50 ns;

  -- second test
  rst<='0';
  SWITCHES <= "00000001"; --1 ms
  keys(3) <= '0';
  WAIT FOR 50 ns;
  rst<='1';
  keys(3) <= '1';
  WAIT FOR 70808 ns;
  keys(3) <= '0';
  WAIT for 50 ns;
END PROCESS;

-- dut mapping
keys(2 downto 0) <= "00" & rst;
reactionTimer: reactionCounter PORT MAP(SWITCHES, keys, clock_50, Qd, Qu, LIGHTS, DISP1, DISP2, DISP3, DISP4); 

END behavior;