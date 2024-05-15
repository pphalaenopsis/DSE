library ieee;
use ieee.std_logic_1164.all;
USE IEEE.numeric_std.all;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS

-- component
COMPONENT lab6 IS 
PORT (
	CLK,RST: IN STD_LOGIC;
	data_in: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	Start: IN STD_LOGIC;
	DONEout: OUT STD_LOGIC
);
END COMPONENT;

--signals
SIGNAL CLK, RST,START, DONE: STD_LOGIC := '0';
SIGNAL data_in : std_logic_vector(7 downto 0);

BEGIN

CLK <= not(CLK) after 10 ns;
PROCESS
BEGIN

  RST <= '0';  --active low
  START<='0';
  
  WAIT FOR 50 ns;
  START<='1';
  RST <= '1';
  
  for i in 0 to 63 loop
   data_in <= STD_LOGIC_VECTOR(TO_UNSIGNED(i, 8));
	wait for 20 NS; 
  END LOOP;
  
  WAIT FOR 8980 ns;
  START<='0';
  RST <= '0';
  
  WAIT FOR 40 NS;

  RST <= '1';

  WAIT FOR 50 ns;

  START<='1';
  
  for j in 64 to 127 loop
   data_in <= STD_LOGIC_VECTOR(TO_UNSIGNED(j, 8));
	wait for 20 NS; 
  END LOOP;
  
  WAIT FOR 8980 ns;

END PROCESS;

dutDigitalFilter: lab6 PORT MAP(CLK, RST, data_in, START, DONE); 
END behavior;
