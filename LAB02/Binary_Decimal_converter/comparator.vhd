LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY comparator IS
PORT (NUM: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  Z: OUT STD_LOGIC);
END comparator;

-- check if num is greater than nine
-- and feeds the result of comparison to
-- both multiplexers and first display
ARCHITECTURE behavior OF comparator IS
BEGIN
  Z <= (NUM(3) AND NUM(2)) OR 
       (NUM(3) AND NUM(1));
END behavior;
