LIBRARY ieee;
USE ieee.std_logic_1164.all;
-- Simple module that connects
-- the SW switches to the LEDR lights
ENTITY mux5 IS
PORT ( 
  SW: IN STD_LOGIC_VECTOR(8 DOWNTO 0);
  LEDR : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)); -- red LEDs
END mux5;
ARCHITECTURE Behavior OF mux5 IS
SIGNAL U,V,W :STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
  
  U <= "101";
  V <= "010";
  W <= "111";
  
  mux5: PROCESS (SW)
  BEGIN
    IF (SW(8) = '0' AND SW(7) = '0' AND SW(6) = '0') THEN LEDR(2 DOWNTO 0) <= U;
    ELSIF (SW(8) = '0' AND SW(7) = '0' AND SW(6) = '1') THEN LEDR(2 DOWNTO 0) <= V;
    ELSIF (SW(8) = '0' AND SW(7) = '1' AND SW(6) = '0') THEN LEDR(2 DOWNTO 0) <= W;
    ELSIF (SW(8) = '0'AND SW(7) = '1' AND SW(6) = '1') THEN LEDR(2 DOWNTO 0) <= SW(2 DOWNTO 0);
    ELSE LEDR(2 DOWNTO 0) <= SW(5 DOWNTO 3);
    END IF;
  END PROCESS;
END Behavior;