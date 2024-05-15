LIBRARY ieee; 
USE ieee.std_logic_1164.all; 

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS
  COMPONENT gatedSRlatch IS 
  PORT ( Clk, R, S : IN STD_LOGIC; 
  Q, Qbar : OUT STD_LOGIC); 
  END COMPONENT; 
  
  SIGNAL S, R, CLK, RES, resbar: STD_LOGIC;
  --SIGNAL R_g, S_g, Q_a, Q_b: STD_LOGIC;
  
  BEGIN
  PROCESS
  BEGIN
  
  
  CLK <= '0';
  WAIT FOR 10 ns;
  clk <= '1';
  S <= '0';
  R <= '1';
  WAIT FOR 10 ns;
  CLK <= '0';
  WAIT FOR 10 ns;
  clk <= '1';
  S <= '1';
  R <= '0';
  WAIT FOR 10 ns;
  CLK <= '0';
  WAIT FOR 10 ns;
  clk <= '1';
  S <= '0';
  R <= '0';
  WAIT FOR 10 ns;
  CLK <= '0';
  WAIT FOR 10 ns;
  clk <= '1';
  S <= '0';
  R <= '1';
  WAIT FOR 10 ns;
  
    
  END PROCESS;
  latch: gatedSRlatch PORT MAP(CLK, R, S, RES, resbar);

END behavior;