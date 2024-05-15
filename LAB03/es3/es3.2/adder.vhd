LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY adder IS
PORT(
  A, B, CIN: IN STD_LOGIC;
  S, COUT, P: OUT STD_LOGIC
);
END adder;

ARCHITECTURE behavior OF adder IS
SIGNAL tmp: STD_LOGIC;
begin
  tmp <= A XOR B;
  P <= tmp;
  COUT <= (A AND B) OR (tmp AND CIN);
  S <= tmp XOR CIN;
  
END behavior;
