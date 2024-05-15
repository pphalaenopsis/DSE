LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY adder IS
PORT (
  OP1, OP2: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  CIN: IN STD_LOGIC;
  RES: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
  CARRY: OUT STD_LOGIC 
);
END adder;

ARCHITECTURE behavior OF adder IS

-- component
COMPONENT fullAdder IS
PORT (
  A, B, CIN: IN STD_LOGIC;
  S, COUT: OUT STD_LOGIC
);
END COMPONENT;

-- signal
SIGNAL C1, C2, C3, C4, C5, C6, C7, C8: STD_LOGIC;

BEGIN
-- come tratte in cin per i casi in cui ho una sottrazione?
add0: fullAdder PORT MAP(OP1(0), OP2(0), CIN, RES(0), C1);
add1: fullAdder PORT MAP(OP1(1), OP2(1), C1, RES(1), C2);
add2: fullAdder PORT MAP(OP1(2), OP2(2), C2, RES(2), C3);
add3: fullAdder PORT MAP(OP1(3), OP2(3), C3, RES(3), C4);
add4: fullAdder PORT MAP(OP1(4), OP2(4), C4, RES(4), C5);
add5: fullAdder PORT MAP(OP1(5), OP2(5), C5, RES(5), C6);
add6: fullAdder PORT MAP(OP1(6), OP2(6), C6, RES(6), C7);
add7: fullAdder PORT MAP(OP1(7), OP2(7), C7, RES(7), C8);
CARRY <= C8;

END behavior;