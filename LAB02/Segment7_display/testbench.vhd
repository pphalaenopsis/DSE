LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbench IS
END testbench;

ARCHITECTURE Behavior OF testbench IS

COMPONENT segment7
PORT ( SW : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
HEX0 : OUT STD_LOGIC_VECTOR(6 downto 0));
END COMPONENT;


-- TESTBENCH SIGNALS (WRAPPING UP THE DUT)

SIGNAL C: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL S: STD_LOGIC_VECTOR(6 DOWNTO 0);


BEGIN

PROCESS
BEGIN
C<="000"; --H 
 WAIT FOR 20 ns;
 C<= "001"; --E
 WAIT FOR 20 ns;
 C<= "010";   --L
 WAIT FOR 20 ns;
 C<= "011";  --O
 WAIT FOR 20 ns;

END PROCESS;


-- DEVICE UNDER TEST.
SEGM: segment7 PORT MAP (C, S);

END Behavior;
