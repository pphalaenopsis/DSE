LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fullAdder IS
PORT (
  
  A, B, CIN: IN STD_LOGIC;
  S, COUT: OUT STD_LOGIC
);
END fullAdder;

ARCHITECTURE dataflow OF fullAdder IS
BEGIN
 
  S <= A XOR B XOR CIN;
  COUT <= (A AND B) OR (B AND CIN) OR (A AND CIN);

	
END dataflow;