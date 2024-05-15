LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbench IS
END testbench;

ARCHITECTURE Behavior OF testbench IS
-- dut
COMPONENT mux5
PORT (SW: IN STD_LOGIC_VECTOR (8 DOWNTO 0);
LEDR: OUT STD_LOGIC_VECTOR (2 DOWNTO 0));
END COMPONENT;

-- testbench signals
SIGNAL X, Y, M: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL S: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL INPUTS: STD_LOGIC_VECTOR(8 DOWNTO 0);
BEGIN
-- These signals emulate
-- the switches SW5-0.
-- In this example they are FIXED.
X <= "101";
Y <= "010";
-- This emulates selection signals
-- s0, s1 and s2.
PROCESS
BEGIN
S <= "000";  --U
WAIT FOR 20 ns;
S <= "001";  --V
WAIT FOR 20 ns;
S <= "010";  --W
WAIT FOR 20 ns;
S <= "011";  --X
WAIT FOR 20 ns;
S <= "100";  --Y
WAIT FOR 20 ns;
END PROCESS;

-- align the inputs in the form allowed by the component.
INPUTS <= S & Y & X;

-- mapping
MUX_UT: mux5 PORT MAP (INPUTS, M);
END Behavior;