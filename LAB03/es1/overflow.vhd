LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY overflow IS
PORT (
  A, B, C: IN STD_LOGIC;
  OVER: OUT STD_LOGIC
);
END overflow;

ARCHITECTURE dataflow OF overflow IS
BEGIN 

  OVER <= (A AND B AND NOT C) OR (NOT A AND NOT B AND C);

END dataflow;