LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;


ENTITY shifter_half IS
GENERIC ( N : integer:= 8);
PORT (
  R : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
  Clock, Resetn: IN STD_LOGIC;
  Q : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0)
);
END shifter_half;

ARCHITECTURE Behavior OF shifter_half IS


BEGIN
PROCESS (Clock, Resetn)
variable tmp_val_variable : UNSIGNED(7 downto 0);
BEGIN

  IF (Resetn = '0') THEN Q <= (OTHERS => '0');
  ELSIF (Clock'EVENT AND Clock = '1') THEN 
	     tmp_val_variable := UNSIGNED(R);
	     -- check if number > 0
		  if tmp_val_variable(7) = '1' then
		     tmp_val_variable := shift_right(tmp_val_variable, 1);
			  tmp_val_variable(7) := '1';
		  else
		     -- positive, just shift
			  tmp_val_variable := shift_right(tmp_val_variable, 1);
		  end if;
		  -- complement + 1
                  tmp_val_variable := NOT tmp_val_variable;
                  tmp_val_variable := tmp_val_variable + 1;
		  
		  Q <= STD_LOGIC_VECTOR(tmp_val_variable);
  END IF; 
END PROCESS;
END Behavior;