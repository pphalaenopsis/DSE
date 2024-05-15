LIBRARY ieee;
USE ieee.std_logic_1164.all;
-- Simple module that connects
-- the SW switches to the LEDR lights
ENTITY led IS
PORT ( SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
  LEDR : OUT STD_LOGIC_VECTOR(9 DOWNTO 0)); -- red LEDs
END led;
ARCHITECTURE Behavior OF led IS
BEGIN
  LEDR(9) <= SW(9);
  LEDR(8) <= SW(8);
  LEDR(7) <= SW(7);
  LEDR(6) <= SW(6);
  LEDR(5) <= SW(5);
  LEDR(4) <= SW(4);
  LEDR(3) <= SW(3);
  LEDR(2) <= SW(2);
  LEDR(1) <= SW(1);
  LEDR(0) <= SW(0);
  -- LEDR <= SW;
END Behavior;