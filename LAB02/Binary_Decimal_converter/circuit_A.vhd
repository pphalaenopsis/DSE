LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY circuit_A IS 
PORT(DIGITS: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
A0,A1,A2: OUT STD_LOGIC);
END circuit_A;

ARCHITECTURE dataflow of circuit_A is
BEGIN
	A0 <= DIGITS(0);
	A1 <= (DIGITS(2) AND NOT DIGITS(1));
	A2 <= (DIGITS(2) AND DIGITS(1));

END dataflow;

