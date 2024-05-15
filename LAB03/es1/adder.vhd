LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY adder IS
PORT ( 
  OP1, OP2: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  CarryIN: IN STD_LOGIC;
  RES: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  CarryOUT: OUT STD_LOGIC
);
END adder;

ARCHITECTURE structural OF adder IS

--component
COMPONENT fullAdder IS
PORT (
  A, B, CIN: IN STD_LOGIC;
  S, COUT: OUT STD_LOGIC
);
END COMPONENT;

SIGNAL c1, c2, c3, c4: STD_LOGIC;

BEGIN
  add0: fullAdder PORT MAP(OP1(0), OP2(0), CarryIN, RES(0), c1);
  add1: fullAdder PORT MAP(OP1(1), OP2(1), c1, RES(1), c2);
  add2: fullAdder PORT MAP(OP1(2), OP2(2), c2, RES(2), c3);
  add3: fullAdder PORT MAP(OP1(3), OP2(3), c3, RES(3), c4);
  CarryOUT <= c4;
END structural;