LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbench_lab4_4 IS
END testbench_lab4_4;

ARCHITECTURE behavior OF testbench_lab4_4 IS


COMPONENT flashingDigits IS
PORT( clock_50: IN std_logic;
      SW: IN std_logic_vector(9 DOWNTO 0);
		HEX0: OUT std_logic_vector(6 DOWNTO 0);
		enable_prova: out std_logic
		);
END COMPONENT;
 
-- testbench signals
SIGNAL clock_50: STD_LOGIC:='0';
SIGNAL rst: STD_LOGIC:='0';
SIGNAL SWITCHES: STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL DISP1: STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL en_prova: std_logic;  -- for testing

BEGIN 

clock_50 <= not(clock_50) after 10 ns;

PROCESS
BEGIN
  rst<='0';  --active low
  WAIT FOR 50 ns;
  rst<='1';
  WAIT;
END PROCESS;

-- dut mapping
SWITCHES <= "000000000"&rst;
counter: flashingDigits PORT MAP(clock_50,SWITCHES, DISP1, en_prova); 

END behavior;