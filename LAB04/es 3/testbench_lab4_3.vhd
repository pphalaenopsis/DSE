library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY testbench_lab4_3 IS
END testbench_lab4_3;

ARCHITECTURE behavior OF testbench_lab4_3 IS

-- dut: block of carry bypass adder 
COMPONENT  c16bits IS
PORT (	
        clock: in std_logic;
        reset: in std_logic;
        Q: out unsigned(15 DOWNTO 0)
        
);
END COMPONENT;
 
-- testbench signals
SIGNAL clk, rst: STD_LOGIC;
SIGNAL Q_out: UNSIGNED(15 DOWNTO 0);


BEGIN 
PROCESS
BEGIN
	

  clk <= '0';
  rst <= '1';

  wait for 5 ns;
   
  rst <= '0';

  WAIT FOR 5 ns;
   
  rst <= '1';
 
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
  
  clk <= '0';
  
  wait for 10 ns;
  
  clk <= '1'; -- 9 clk cycle

  WAIT FOR 10 ns;
  
  clk <= '0';
  
  wait for 10 ns;

  clk <= '1'; -- 10 clk cycle
  
  WAIT FOR 10 ns;

END PROCESS;

-- dut mapping
counter: c16bits PORT MAP(clk,rst,Q_out); 

END behavior;