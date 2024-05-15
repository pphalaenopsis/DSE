library ieee;
use ieee.std_logic_1164.all;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS

-- Device under test
COMPONENT led
PORT (
  SW : in std_logic_vector(9 downto 0);
  LEDR : out std_logic_vector(9 downto 0)
);
END component;

-- Testbench signals
SIGNAL INSW : std_logic_vector(9 downto 0);
SIGNAL OUTSW : std_logic_vector(9 downto 0);

BEGIN

-- Stimulus process
PROCESS
BEGIN
INSW <= "0000000001";
WAIT FOR 10 ns;

INSW <= "0000000010";
WAIT FOR 10 ns;

INSW <= "0000000100";
WAIT FOR 10 ns;

INSW <= "0000001000";
WAIT FOR 10 ns;

INSW <= "0000010000";
WAIT FOR 10 ns;

INSW <= "0000100000";
WAIT FOR 10 ns;

INSW <= "0001000000";
WAIT FOR 10 ns;

INSW <= "0010000000";
WAIT FOR 10 ns;

INSW <= "0100000000";
WAIT FOR 10 ns;

INSW <= "1000000000";
WAIT FOR 10 ns;

INSW <= "1010101010";
WAIT FOR 10 ns;
END PROCESS;
  
dut: led PORT MAP (INSW, OUTSW); 
END behavior;
