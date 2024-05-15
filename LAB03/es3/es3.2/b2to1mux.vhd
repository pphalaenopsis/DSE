LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY b2to1mux IS
PORT (Cin,Clast: IN STD_LOGIC;  
      P: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      Cout: OUT STD_LOGIC);
END b2to1mux;

ARCHITECTURE Behavior of b2to1mux IS

SIGNAL sel: STD_LOGIC;

BEGIN 

PROCESS(Cin,Clast,P)
BEGIN

sel <= (P(0) AND P(1) AND P(2) AND P(3));	
IF (sel = '1') THEN
	Cout <= Cin;
ELSE 
	Cout <= Clast;
END IF;

END PROCESS;

END Behavior;	