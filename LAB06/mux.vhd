LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- 4TO1 MUX
ENTITY mux IS
PORT (
  reg1, reg2, reg3, reg4,default: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  z: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
  CHOICE: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
);
END mux;

ARCHITECTURE behavior OF mux IS
BEGIN 
PROCESS(reg1, reg2, reg3, reg4, default, z)
BEGIN
case z is
	when "011" =>
	  CHOICE <= reg1;
	when "100" => 
	  CHOICE <= reg2;
	when "101" =>
	  CHOICE <= reg3;
	when "110" =>
	  CHOICE <= reg4;
	when others =>
	  CHOICE <= default;
end case;
END PROCESS;
END behavior;