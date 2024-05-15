LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity dflipflop is
Port (
	D : IN STD_LOGIC;
	CLK : IN STD_LOGIC;
        rst : IN STD_LOGIC;
	Q : OUT STD_LOGIC
);
END dflipflop;

ARCHITECTURE behavior OF dflipflop IS
SIGNAL int_Q : STD_LOGIC;

BEGIN
PROCESS(CLK, RST)
BEGIN
        IF rst = '0' THEN
                int_Q <= '0';
	ELSIF rising_edge(CLK) THEN
		int_Q <= D;
	END IF;
END PROCESS;

Q <= int_Q;
END behavior;