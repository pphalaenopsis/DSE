LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS

COMPONENT BCD_converter IS
PORT ( SW: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
HEX0, HEX1: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END COMPONENT;

-- testbench signals
SIGNAL S: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL OUT1, OUT2: STD_LOGIC_VECTOR(6 DOWNTO 0);

BEGIN 
PROCESS
BEGIN

S <= "1000";
WAIT FOR 10 ns;
S <= "0100";
WAIT FOR 10 ns;
S <= "1100";
WAIT FOR 10 ns;
S <= "0010";
WAIT FOR 10 ns;
S <= "1010";
WAIT FOR 10 ns;
S <= "0110";
WAIT FOR 10 ns;
S <= "1110";
WAIT FOR 10 ns;
S <= "1001";
WAIT FOR 10 ns;
S <= "1001";
WAIT FOR 10 ns;
S <= "0101";
WAIT FOR 10 ns;
S <= "1000";
WAIT FOR 10 ns;
S <= "1101";
WAIT FOR 10 ns;
S <= "0011";
WAIT FOR 10 ns;
S <= "1011";
WAIT FOR 10 ns;
S <= "1111";
WAIT FOR 10 ns;


END PROCESS;

BCDdut: BCD_converter PORT MAP (S, OUT1, OUT2);
END behavior;