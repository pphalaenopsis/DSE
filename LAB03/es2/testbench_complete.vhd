LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbench_complete IS
END testbench_complete;

ARCHITECTURE behavior OF testbench_complete IS

-- component UT
COMPONENT adderSubtractor IS
PORT (
  SW: IN STD_LOGIC_VECTOR(8 DOWNTO 0);
  KEY: IN STD_LOGIC_VECTOR(1 DOWNTO 0);  -- KEY1 CLK, KEY0 RST
  HEX0, HEX1, HEX2: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
  SUMout: OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  LEDR: OUT STD_LOGIC_VECTOR(9 DOWNTO 0)  -- CHECK FOR SUM
);
END COMPONENT;

-- signals
SIGNAL A, B: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL inputs: STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL DISP0, DISP1, DISP2: STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL clk, rst: STD_LOGIC;
SIGNAL OPER: STD_LOGIC;
SIGNAL keys: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL lights: STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL SUMcheck: STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
PROCESS
BEGIN

  rst <= '1';
  clk <= '0';
  wait for 10 ns;
  
  clk <= '1';
  OPER <= '0'; -- add
  A <= "0011"; --  3
  B <= "1000"; -- -8
 
  wait for 10 ns;
  clk <= '0';
 
  wait for 10 ns;
  clk <= '1';
  OPER <= '1'; -- sub
  A <= "0011"; --  3
  B <= "1001"; -- -7
  
  wait for 5 ns;
  rst <= '0';
  
  wait for 5 ns;
  clk <= '0';
 
  wait for 10 ns;
  clk <= '1';
  OPER <= '0'; -- add
  A <= "0011"; --  3
  B <= "1010"; -- -6
 
  wait for 10 ns;
  clk <= '0';
  rst <= '1';
 
  wait for 10 ns;
  clk <= '1';
  OPER <= '1'; -- sub
  A <= "0011"; --  3
  B <= "1011"; -- -5
  
  wait for 10 ns;
  clk <= '0';
 
  wait for 10 ns;
  clk <= '1';
  OPER <= '0'; -- add
  A <= "0011"; --  3
  B <= "1100"; -- -4

  wait for 10 ns;
  
  clk <= '0';
  wait for 10 ns;
  
  clk <= '1';
  OPER <= '0'; -- add
  A <= "0011"; --  3
  B <= "1101"; -- -3
 
  wait for 10 ns;
  clk <= '0';
 
  wait for 10 ns;
  clk <= '1';
  OPER <= '1'; -- sub
  A <= "0011"; --  3
  B <= "1110"; -- -2
  
  wait for 10 ns;
  clk <= '0';
 
  wait for 10 ns;
  clk <= '1';
  OPER <= '0'; -- add
  A <= "0011"; --  3
  B <= "1111"; -- -1

  wait for 10 ns;
  
  clk <= '0';
  wait for 10 ns;
  
  clk <= '1';
  OPER <= '0'; -- add
  A <= "0011"; --  3
  B <= "0000"; --  0
 
  wait for 10 ns;
  clk <= '0';
 
  wait for 10 ns;
  clk <= '1';
  OPER <= '1'; -- sub
  A <= "0011"; --  3
  B <= "0001"; --  1
  wait for 10 ns;
 
  clk <= '1';
  OPER <= '0'; -- add
  A <= "0011"; --  3
  B <= "0010"; --  2

  wait for 10 ns;
  
  clk <= '0';
  wait for 10 ns;
  
  clk <= '1';
  OPER <= '0'; -- add
  A <= "0011"; --  3
  B <= "0011"; --  3

  wait for 10 ns;
  
  clk <= '0';
  wait for 10 ns;
  
  clk <= '1';
  OPER <= '0'; -- add
  A <= "0011"; --  3
  B <= "0100"; --  4
 
  wait for 10 ns;
  clk <= '0';
 
  wait for 10 ns;
  clk <= '1';
  OPER <= '1'; -- sub
  A <= "0011"; --  3
  B <= "0101"; --  5
  
  wait for 10 ns;
  clk <= '0';
 
  wait for 10 ns;
  clk <= '1';
  OPER <= '0'; -- add
  A <= "0011"; --  3
  B <= "0110"; --  6
  
  wait for 10 ns;
  
  clk <= '0';
  wait for 10 ns;
  
  clk <= '1';
  OPER <= '1'; -- sub
  A <= "0011"; --  3
  B <= "0111"; --  7
  wait for 10 ns;


END PROCESS;

keys <= clk & rst;
inputs <= OPER & B & A;
testRCA: adderSubtractor PORT MAP(inputs, keys, DISP0, DISP1, DISP2, SUMcheck,lights);
END behavior;