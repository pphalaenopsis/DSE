LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbench_lab3_3b IS
END testbench_lab3_3b;

ARCHITECTURE behavior OF testbench_lab3_3b IS

-- dut: block of carry bypass adder 
COMPONENT  bit16cba IS
PORT (	
  A, B: STD_LOGIC_VECTOR(15 DOWNTO 0);
  KEY: STD_LOGIC_VECTOR(1 DOWNTO 0);
  S: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
  COUT: OUT STD_LOGIC  
);
END COMPONENT;
 
-- testbench signals
SIGNAL A, B: STD_LOGIC_VECTOR(15 DOWNTO 0):= "0000000000000000";
SIGNAL SUM: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL CARRYout: STD_LOGIC;
SIGNAL clk, rst: STD_LOGIC;
SIGNAL keys: STD_LOGIC_VECTOR(1 DOWNTO 0);

BEGIN 
PROCESS
BEGIN

  clk <= '0';
  rst <= '1';
  wait for 10 ns;
  clk <= '1';
  A <= "1100110011001100";
  B <= "1000100010001000";
  WAIT FOR 10 ns;
  
  clk <= '0';
  wait for 10 ns;

  clk <= '1';
  A <= "0011001100110011";
  B <= "1100110011001100";
  WAIT FOR 10 ns;
  
  clk <= '0';
  wait for 5 ns;
  
  rst <= '0';
  wait for 5 ns;

  clk <= '1';
  A <= "0101010101010101";
  B <= "1110101010101010";
  WAIT FOR 10 ns;
  
  clk <= '0';
  wait for 10 ns;

  clk <= '1';
  rst <= '1';
  A <= "1101110111011101";
  B <= "0011001100110011";
  WAIT FOR 10 ns;
  
  clk <= '0';
  wait for 10 ns;

  clk <= '1';
  A <= "1100110011001101";
  B <= "1101110111011100";
  WAIT FOR 10 ns;
  
  clk <= '0';
  wait for 10 ns;

  clk <= '1';
  A <= "0100010001000100";
  B <= "1101000100010001";
  WAIT FOR 10 ns;
  
  clk <= '0';
  wait for 10 ns;

  clk <= '1';
  A <= "1010101010101010";
  B <= "0101010101010101";
  WAIT FOR 10 ns;
  
  clk <= '0';
  wait for 10 ns;

  clk <= '1';
  A <= "0000111100001111";
  B <= "1111000011110000";
  WAIT FOR 10 ns;
  
  clk <= '0';
  wait for 10 ns;

  clk <= '1';
  A <= "1011001111001100";
  B <= "1100110000110011";
  WAIT FOR 10 ns;
  
  clk <= '0';
  wait for 10 ns;

  clk <= '1';
  A <= "0000000000000000";
  B <= "1111111111111111";
  WAIT FOR 10 ns;

END PROCESS;

keys <= clk & rst;
-- dut mapping
CarryBypassAdder: bit16cba PORT MAP(A, B, keys, SUM, CARRYout); 

END behavior;