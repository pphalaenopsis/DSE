LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY adder4bits IS
PORT (
  A, B: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  Cin: IN STD_LOGIC;
  S: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  Cout: OUT STD_LOGIC
);
END adder4bits;

ARCHITECTURE behavior OF adder4bits IS
-- subcomponents
COMPONENT adder IS
PORT(
  A, B, CIN: IN STD_LOGIC;
  S, COUT: OUT STD_LOGIC
);
END COMPONENT;

-- internal signals
SIGNAL C1, C2, C3, C4: STD_LOGIC;

BEGIN

  ADD0: adder PORT MAP(A(0), B(0), Cin, S(0), C1);
  ADD1: adder PORT MAP(A(1), B(1), C1, S(1), C2);
  ADD2: adder PORT MAP(A(2), B(2), C2, S(2), C3);
  ADD3: adder PORT MAP(A(3), B(3), C3, S(3), C4);
  Cout <= c4;
  
END behavior;