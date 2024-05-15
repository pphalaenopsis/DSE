LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity tflipflop is
Port (
	T : IN STD_LOGIC;
	CLK : IN STD_LOGIC;
	rst : IN STD_LOGIC;
	Q : OUT STD_LOGIC
);
END tflipflop;

ARCHITECTURE behavior OF tflipflop IS
SIGNAL int_Q : STD_LOGIC;

BEGIN
PROCESS(CLK, rst)
BEGIN
	IF rst = '0' THEN int_Q <= '0'; -- active low
	ELSIF rising_edge(CLK) THEN
		IF T = '1' THEN int_Q <= not int_Q;
		END IF;
	END IF;
END PROCESS;

Q <= int_Q;
END behavior;