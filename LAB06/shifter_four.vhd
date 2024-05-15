LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;


ENTITY shifter_four IS
GENERIC ( N : integer:= 8);
PORT (
  R : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
  Clock, Resetn: IN STD_LOGIC;
  Q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
);
END shifter_four;

ARCHITECTURE Behavior OF shifter_four IS


BEGIN
PROCESS (Clock, Resetn)
variable tmp_val_variable : UNSIGNED(7 downto 0);
BEGIN

  IF (Resetn = '0') THEN Q <= (OTHERS => '0');
  ELSIF (Clock'EVENT AND Clock = '1') THEN 
	     tmp_val_variable := UNSIGNED(R);
	     -- check if number < 0
		  if tmp_val_variable(7) = '1' then
		     tmp_val_variable := shift_left(tmp_val_variable, 2);  --check
			  tmp_val_variable(7 downto 6) := "11"; --check
		  else
		     -- positive, just shift
			  tmp_val_variable := shift_left(tmp_val_variable, 2);
		  end if;
		  Q <= STD_LOGIC_VECTOR(tmp_val_variable);
  END IF; 
END PROCESS;

END Behavior;