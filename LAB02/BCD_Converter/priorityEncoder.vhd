LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY priorityEncoder IS
PORT (
  A: IN STD_LOGIC_VECTOR(6 DOWNTO 0);
  encoded: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END priorityEncoder;

ARCHITECTURE dataflow OF priorityEncoder IS
BEGIN
  encoded(3) <= '0';
  encoded(2) <= A(6) OR A(5) OR A(4);
  encoded(1) <= A(6) OR ((NOT A(5) AND NOT A(4)) AND (A(3) OR A(2)));
  encoded(0) <= NOT A(6) AND (A(5) OR (NOT A(4) AND (A(3) OR (NOT A(2) AND A(1)))));
END dataflow;