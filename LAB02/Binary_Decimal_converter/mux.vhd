LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux IS 
PORT(V,A : IN STD_LOGIC;
sel: IN STD_LOGIC;
M: OUT STD_LOGIC);
END mux; 

ARCHITECTURE Behavior OF mux IS
BEGIN
MUX: PROCESS(V,A,sel)

BEGIN
IF (sel='0') THEN M <= V;
ELSE M <= A;
END IF;

END PROCESS MUX;
END Behavior;