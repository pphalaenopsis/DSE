LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS

-- component to be tested
COMPONENT ModifiedOneHotFSM IS 
PORT (
	SW: IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- SW(1) -> w, SW(0) -> reset
	KEY: IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- KEY(0) -> clock
	f_visualState: OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
	p_visualState: OUT STD_LOGIC_VECTOR(8 DOWNTO 0);

	LEDR: OUT STD_LOGIC_VECTOR(9 DOWNTO 0) -- LEDR(0) -> Z
);
END COMPONENT;

-- signals
SIGNAL SWITCHES: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL KEYS: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL OUTLED: STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL CLK, RST, WIN: STD_LOGIC := '0';
SIGNAL p_outState, f_outState: STD_LOGIC_VECTOR(8 DOWNTO 0);

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
DUTtest: ModifiedOneHotFSM PORT MAP(SWITCHES, KEYS, f_outState, p_outState, OUTLED);

END behavior;