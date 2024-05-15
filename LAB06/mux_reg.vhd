LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- 4TO1 MUX
ENTITY mux_reg IS
PORT (
  current, prec_reg: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  z: IN STD_LOGIC;
  CHOICE: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END mux_reg;

ARCHITECTURE behavior OF mux_reg IS
BEGIN 
PROCESS(current, prec_reg, z)
BEGIN
  IF Z = '0' then CHOICE <= current;
  ELSE CHOICE <= prec_reg;
  END IF;
END PROCESS;
END behavior;