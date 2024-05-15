LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS

-- component to be tested
COMPONENT OneHotFSM IS 
PORT (
	SW: IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- SW(1) -> w, SW(0) -> reset
	KEY: IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- KEY(0) -> clock
	
	LEDR: OUT STD_LOGIC_VECTOR(9 DOWNTO 0) -- LEDR(0) -> Z
);
END COMPONENT;

-- signals
SIGNAL SWITCHES: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL KEYS: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL OUTLED: STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL CLK, RST, WIN: STD_LOGIC := '0';

BEGIN

CLK <= not(CLK) after 10 ns;

PROCESS
BEGIN
  -- reset ACTIVE
  WIN <= '0';
  RST <= '0'; 
  wait for 50 ns;
  RST <= '1';
  WIN <= '0';

  wait for 20 ns;
  WIN <= '0';

  wait for 20 ns;
  WIN <= '1';

  wait for 20 ns;
  WIN <= '0';

  wait for 20 ns;
  WIN <= '0';

  wait for 20 ns;
  WIN <= '0';

  wait for 20 ns;
  WIN <= '0';

  wait for 20 ns;
  WIN <= '1';

  wait for 20 ns;
  WIN <= '1';

  wait for 20 ns;
  WIN <= '1';

  wait for 20 ns;
  WIN <= '1';

  wait for 20 ns;
  WIN <= '1';

  wait for 20 ns;
  WIN <= '0';

  wait for 20 ns;
  WIN <= '0';

  wait for 10 ns;


END PROCESS;
--mapping
KEYS <= "000" & CLK;
SWITCHES <= WIN & RST;
DUTtest: OneHotFSM PORT MAP(SWITCHES, KEYS, OUTLED);

END behavior;