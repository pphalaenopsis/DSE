LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS

COMPONENT mux IS
PORT ( SW: IN STD_LOGIC_VECTOR(9 DOWNTO 0);
  LEDR : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)); -- red LEDs
END COMPONENT;

SIGNAL input: STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL output : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL S: STD_LOGIC_VECTOR(9 DOWNTO 0);
BEGIN
  PROCESS
  BEGIN

  S <= "0000000001";
  WAIT FOR 20 ns;
  S <= "0000000010";
  WAIT FOR 20 ns;
  S <= "0000000100";
  WAIT FOR 20 ns;
  S <= "0000001000";
  WAIT FOR 20 ns;
  S <= "0100010000";
  WAIT FOR 20 ns;
  S <= "0100100000";
  WAIT FOR 20 ns;
  S <= "0101000000";
  WAIT FOR 20 ns;
  S <= "0110000000";
  WAIT FOR 20 ns;
  S <= "0010110001";
  WAIT FOR 20 ns;
  S <= "0110110001";
  WAIT FOR 20 ns;
  END PROCESS;
  
input <= S;
MUX : mux PORT MAP (input, output);

END behavior;