LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux IS
PORT (
  inValue, regValue : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
  z: IN STD_LOGIC;
  selected: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
);
END mux;

ARCHITECTURE behavior OF mux IS
BEGIN
PROCESS(z, inValue, regValue)
BEGIN
  IF z='1' THEN selected <= inValue;
  ELSE selected <= regValue;
  end if;
END PROCESS;
END behavior;