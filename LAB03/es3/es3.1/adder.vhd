LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY adder IS
PORT(
  A, B, CIN: IN STD_LOGIC;
  S, COUT: OUT STD_LOGIC
);
END adder;

ARCHITECTURE behavior OF adder IS
begin
  COUT <= (A AND B) OR (B AND CIN) OR (CIN AND A);
  S <= A XOR B XOR CIN;
END behavior;