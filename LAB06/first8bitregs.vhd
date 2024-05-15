LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY first8bitregs IS
GENERIC ( N : integer:= 8);
PORT (
  R : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
  Clock, Resetn : IN STD_LOGIC;
  Q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
);
END first8bitregs;

ARCHITECTURE Behavior OF first8bitregs IS
BEGIN
PROCESS (Clock, Resetn)
BEGIN

  IF (Resetn = '0') THEN Q <= (OTHERS => '0');
  ELSIF (Clock'EVENT AND Clock = '1') THEN  Q <= R;
  END IF;
  
END PROCESS;
END Behavior;