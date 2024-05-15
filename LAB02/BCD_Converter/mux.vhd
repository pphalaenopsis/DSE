LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux IS
PORT (
  SEL: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  V: OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
);
END mux;

ARCHITECTURE dataflow OF mux IS
BEGIN
  -- ALL INPUTS other than 0-6 give out 000000
  V(0) <= '0';
  V(1) <= NOT SEL(3) AND SEL(0) AND (NOT SEL(2) OR NOT SEL(1));
  V(2) <= NOT SEL(3) AND SEL(1) AND (NOT SEL(2) OR NOT SEL(0));
  V(3) <= NOT SEL(3) AND (SEL(2) OR SEL(0)) AND (NOT SEL(2) OR NOT SEL(0));
  V(4) <= NOT SEL(3) AND ((SEL(2) AND NOT SEL(1) AND SEL(0)) OR (NOT SEL(2) AND SEL(1)) OR (SEL(1) AND NOT SEL(0)));
  -- NOT A AND (NOT C OR NOT B OR NOT D) AND (C OR D) AND (C OR B)
  V(5) <= NOT SEL(3) AND SEL(2) AND (NOT SEL(1) OR NOT SEL(0));

END dataflow;