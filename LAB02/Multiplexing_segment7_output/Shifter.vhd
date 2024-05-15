LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- in input ho 3 switch che mi segnalano di quanto va shiftata una parola
ENTITY Shifter IS
PORT ( input : IN STD_LOGIC_VECTOR(14 downto 0); --stringa di parola
sel: IN STD_LOGIC_VECTOR(2 downto 0);  -- i 3 switch
output : OUT STD_LOGIC_VECTOR(14 downto 0));  --parola finale
END Shifter;

ARCHITECTURE behavior OF Shifter IS
BEGIN 
  SHIFT: PROCESS (input, sel)
  BEGIN 
 
  IF sel="000" THEN 
  
		output(14 DOWNTO 0)<=input(14 DOWNTO 0); --HELLO
	
  ELSIF sel="001" THEN --ELLOH
  
		output(14 DOWNTO 12) <= input(11 DOWNTO 9);
		output(11 DOWNTO 9) <= input(8 DOWNTO 6);
		output(8 DOWNTO 6) <= input(5 DOWNTO 3);
		output(5 DOWNTO 3) <= input(2 DOWNTO 0);
		output(2 DOWNTO 0) <= input(14 DOWNTO 12);
 
  ELSIF sel="010" THEN --LLOHE
  
		output(14 DOWNTO 12) <= input(8 DOWNTO 6);
		output(11 DOWNTO 9) <= input(5 DOWNTO 3);
		output(8 DOWNTO 6) <= input(2 DOWNTO 0);
		output(5 DOWNTO 3) <= input(14 DOWNTO 12);
		output(2 DOWNTO 0) <= input(11 DOWNTO 9);
		
  ELSIF sel="011" THEN --LOHEL
  
		output(14 DOWNTO 12) <= input(5 DOWNTO 3);
		output(11 DOWNTO 9) <= input(2 DOWNTO 0);
		output(8 DOWNTO 6) <= input(14 DOWNTO 12);
		output(5 DOWNTO 3) <= input(11 DOWNTO 9);
		output(2 DOWNTO 0) <= input(8 DOWNTO 6);
		
  ELSIF sel = "100" THEN --OHELL
  
		output(14 DOWNTO 12) <= input(2 DOWNTO 0);
		output(11 DOWNTO 9) <= input(14 DOWNTO 12);
		output(8 DOWNTO 6) <= input(11 DOWNTO 9);
		output(5 DOWNTO 3) <= input(8 DOWNTO 6);
		output(2 DOWNTO 0) <= input(5 DOWNTO 3);
  
	
  ELSE 
		output(14 DOWNTO 0) <= "111111111111111";
  END IF; 
  END PROCESS SHIFT;
END behavior;
		
		