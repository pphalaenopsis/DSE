LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY circuit_B IS
PORT(Z: IN STD_LOGIC;
DISPLAY: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END circuit_B;

ARCHITECTURE Behavior OF circuit_B IS
BEGIN 
circuit: PROCESS(Z)
	
	BEGIN 
	IF (Z ='0') THEN DISPLAY <= "1000000";
	ELSE DISPLAY <= "1111001";
	END IF;
	
END PROCESS circuit;
END Behavior;