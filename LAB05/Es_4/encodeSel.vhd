LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY encodeSel IS
PORT (
  en_in: IN STD_LOGIC;
  clock, reset: IN STD_LOGIC;
  toEncode: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
  encoded: OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
);
END encodeSel;

ARCHITECTURE behavior OF encodeSel IS
BEGIN
   PROCESS(en_in, toEncode) 
	BEGIN
	if en_in = '1' then
		CASE toEncode IS
		WHEN "000" => 
			 encoded <= "000000";	
		WHEN "001" =>
			 encoded <= "000001";
		WHEN "010" =>
			 encoded <= "000011";
		WHEN "011" =>
			 encoded <= "000111";
		WHEN "100" =>
			 encoded <= "001111";
		WHEN "101" =>
			 encoded <= "011111";
		WHEN "110" =>
			 encoded <= "111111";
		WHEN others =>
			 encoded <= "111110"; -- activate all lines
		END CASE;
	end if;
   END PROCESS;
END;