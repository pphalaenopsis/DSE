LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux IS
PORT ( SW: IN STD_LOGIC_VECTOR(9 DOWNTO 0);
  LEDR : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)); -- red LEDs
END mux;
ARCHITECTURE Behavior OF mux IS
BEGIN
  LEDR(0) <= (NOT SW(8) AND SW(0)) OR (SW(8) AND SW(4));
  LEDR(1) <= (NOT SW(8) AND SW(1)) OR (SW(8) AND SW(5));
  LEDR(2) <= (NOT SW(8) AND SW(2)) OR (SW(8) AND SW(6));
  LEDR(3) <= (NOT SW(8) AND SW(3)) OR (SW(8) AND SW(7)); 
END Behavior;