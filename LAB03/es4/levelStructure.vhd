LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY levelStructure IS
PORT (
  A,B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  Bl, Cin: IN STD_LOGIC;
  Cout: OUT STD_LOGIC; 
  S: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END levelStructure;

ARCHITECTURE behavior OF levelStructure IS
-- subcomponents
COMPONENT fullAdder IS
PORT (
  An, Bn, Cin: IN STD_LOGIC;
  Sn, Cout: OUT STD_LOGIC
);
END COMPONENT;

-- internal signals
SIGNAL OP: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL C1, C2, C3, C4: STD_LOGIC;


BEGIN
  OP <= (A(3) AND Bl, A(2) AND Bl,A(1) AND Bl, A(0) AND Bl);
  ADD0: fullAdder PORT MAP(B(0), OP(0), Cin, S(0), C1);
  ADD1: fullAdder PORT MAP(B(1), OP(1), C1, S(1), C2);
  ADD2: fullAdder PORT MAP(B(2), OP(2), C2, S(2), C3);
  ADD3: fullAdder PORT MAP(B(3), OP(3), C3, S(3), C4);
  Cout <= c4;
  
END behavior;