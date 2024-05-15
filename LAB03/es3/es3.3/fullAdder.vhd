LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fullAdder IS
PORT (
  A, B, Cin: IN STD_LOGIC;
  S, Cout: OUT STD_LOGIC
);
END fullAdder;

ARCHITECTURE behavior OF fullAdder IS
BEGIN

  S <= A XOR B XOR Cin;
  Cout <= (A AND B) OR (B AND Cin) OR (A AND Cin);

END behavior;