LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS

-- component
COMPONENT multiplier IS
PORT (
  SW: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  HEX0, HEX1, HEX2, HEX3: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
);
END COMPONENT;

-- signals
SIGNAL A, B: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL DA, DB, DSL, DSM: STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL INPUTS: STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN
PROCESS
BEGIN

  A <= "1100";  --12
  B <= "0000";  -- 0
  WAIT FOR 10 ns;

  A <= "1100";  --12
  B <= "0001";  -- 1
  WAIT FOR 10 ns;
  
  A <= "1100";  --12
  B <= "0010";  -- 2
  WAIT FOR 10 ns;

  A <= "1100";  --12
  B <= "0011";  -- 3
  WAIT FOR 10 ns;

  A <= "1100";  --12
  B <= "0100";  -- 4
  WAIT FOR 10 ns;
  
  A <= "1100";  --12
  B <= "0101";  -- 5
  WAIT FOR 10 ns;

  A <= "1100";  --12
  B <= "0110";  -- 6
  WAIT FOR 10 ns;

  A <= "1100";  --12
  B <= "0111";  -- 7
  WAIT FOR 10 ns;
  
  A <= "1100";  --15
  B <= "1000";  -- 8
  WAIT FOR 10 ns;

  A <= "1100";  --12
  B <= "1001";  -- 9
  WAIT FOR 10 ns;

  A <= "1100";  --12
  B <= "1010";  --10
  WAIT FOR 10 ns;
  
  A <= "1100";  --12
  B <= "1011";  --11
  WAIT FOR 10 ns;

  A <= "1100";  --12
  B <= "1100";  --12
  WAIT FOR 10 ns;

  A <= "1100";  --12
  B <= "1101";  --13
  WAIT FOR 10 ns;
  
  A <= "1100";  --12
  B <= "1110";  --14
  WAIT FOR 10 ns;

  A <= "1100";  --12
  B <= "1111";  --15
  WAIT FOR 10 ns;

END PROCESS;
-- dut mapping

INPUTS <= B & A;
mult: multiplier PORT MAP(INPUTS, DA, DB, DSL, DSM);

END behavior;