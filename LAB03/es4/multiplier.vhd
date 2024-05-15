LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY multiplier IS
PORT (
  SW: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  HEX0, HEX1, HEX2, HEX3: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
);
END multiplier;

ARCHITECTURE behavior OF multiplier IS 

-- component
COMPONENT levelStructure IS
PORT (
  A, B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  Bl, Cin: IN STD_LOGIC;
  Cout: OUT STD_LOGIC; 
  S: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END COMPONENT;

COMPONENT fullAdder IS
PORT (
  An, Bn, Cin: IN STD_LOGIC;
  Sn, Cout: OUT STD_LOGIC
);
END COMPONENT;

COMPONENT segment7 IS
PORT(M: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
DISPLAY: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END COMPONENT;

-- signals
SIGNAL convA: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL add1, add2, add3: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Cin, Cout1, Cout2, Cout3: STD_LOGIC;
SIGNAL OPtemp1, OPtemp2: STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL P: STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN

  Cin <= '0';
  convA <= ('0', SW(3) AND SW(4), SW(2) AND SW(4), SW(1) AND SW(4));
  P(0) <= SW(0) AND SW(4); -- LSB
  
  -- B, A, b(i), CIN, cout, sout 
  
  level1: levelStructure PORT MAP (SW(3 DOWNTO 0), convA, SW(5), Cin, Cout1, add1); P(1) <= add1(0);
  OPtemp1<= Cout1 & add1(3 DOWNTO 1);
  level2: levelStructure PORT MAP (SW(3 DOWNTO 0), OPtemp1 , SW(6), Cin, Cout2, add2); P(2) <= add2(0);
  OPtemp2 <= Cout2 & add2(3 DOWNTO 1);
  level3: levelStructure PORT MAP (SW(3 DOWNTO 0), OPtemp2, SW(7), Cin, Cout3, add3); P(7 DOWNTO 3) <= Cout3 & add3;
  
  -- display
  dispA: segment7 PORT MAP(SW(3 DOWNTO 0), HEX0);
  dispB: segment7 PORT MAP(SW(7 DOWNTO 4), HEX1);
  dispLsbS: segment7 PORT MAP(P(3 DOWNTO 0), HEX2);
  dispMsbS: segment7 PORT MAP (P(7 DOWNTO 4), HEX3);

END behavior;