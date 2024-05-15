LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbench_lab4_2 IS
END testbench_lab4_2;

ARCHITECTURE behavior OF testbench_lab4_2 IS

-- dut: block of carry bypass adder 
COMPONENT counter16bits IS
PORT (
   SW: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	-- enable : IN STD_LOGIC;
	KEY : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- reset
	-- RESET : IN STD_LOGIC;
	-- Q : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	HEX0,HEX1,HEX2,HEX3: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
);
END COMPONENT;
 
-- testbench signals
SIGNAL e, clk, rst: STD_LOGIC;
SIGNAL KEYS: STD_LOGIC_VECTOR := "0000";
SIGNAL SWITCHES: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL Q_out: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL DISP1, DISP2, DISP3, DISP4: STD_LOGIC_VECTOR(6 DOWNTO 0);

BEGIN 
PROCESS
BEGIN
	
  e <= '0';
  clk <= '0';
  rst <= '1';

  wait for 5 ns;
   
  rst <= '0';

  WAIT FOR 5 ns;
   
  rst <= '1';
  e <= '1';
  clk <= '1'; -- 1 clk cycle
	
  wait for 10 ns;
	
  clk <='0';

  WAIT FOR 10 ns;
  
  clk <= '1';  -- 2 clk cycle
  
  wait for 10 ns;
  
  clk <= '0';
  
  wait for 10 ns;

  clk <= '1'; -- 3 clk cycle

  WAIT FOR 10 ns;
  
  clk <= '0';
  
  wait for 10 ns;

  clk <= '1'; -- 4 clk cycle
 
  
  WAIT FOR 10 ns;
  
  clk <= '0';
  
  wait for 10 ns;

  clk <= '1'; -- 5 clk cycle

  WAIT FOR 10 ns;
  
  clk <= '0';
 
 wait for 10 ns;

  clk <= '1'; -- 6 clk cycle

  WAIT FOR 10 ns;
  
  clk <= '0';
  
  wait for 10 ns;

  clk <= '1'; -- 7 clk cycle

  WAIT FOR 10 ns;
  
  clk <= '0';
  
  wait for 10 ns;

  clk <= '1'; -- 8 clk cycle
 

  WAIT FOR 10 ns;
  e <='0';
  clk <= '0';
  
  wait for 10 ns;
  e <= '1';	 
  clk <= '1'; -- 9 clk cycle

  WAIT FOR 10 ns;
  
  clk <= '0';
  
  wait for 10 ns;

  clk <= '1'; -- 10 clk cycle
  
  WAIT FOR 10 ns;

END PROCESS;

-- dut mapping
SWITCHES <= e&rst;
counter: counter16bits PORT MAP(SWITCHES, KEYS, DISP1, DISP2, DISP3, DISP4); 

END behavior;