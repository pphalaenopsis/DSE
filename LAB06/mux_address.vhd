LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY mux_address IS
PORT (
  start1, finish_cycle: IN std_logic;
  z: IN STD_LOGIC;
  choice: OUT STD_LOGIC
);
END mux_address;

architecture behavior of mux_address is
BEGIN 
PROCESS(finish_cycle, start1, z)
BEGIN
  IF Z = '1' then    --z=1 in load b
  choice <= finish_cycle ;
  ELSE   
  choice <= start1;
  end if;
END PROCESS;
END behavior;
