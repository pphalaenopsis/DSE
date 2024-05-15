LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY register8bit IS
GENERIC ( N : integer:= 8);
PORT (
  R : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
  Clock, Resetn: IN STD_LOGIC;
  Q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
);
END register8bit;

ARCHITECTURE Behavior OF register8bit IS
BEGIN
PROCESS (Clock, Resetn)
BEGIN

  IF (Resetn = '0') THEN Q <= (OTHERS => '0');
  ELSIF (Clock'EVENT AND Clock = '1') THEN Q <= R;
  END IF;
  
END PROCESS;
END Behavior;