LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY segment7 IS
PORT(M: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
DISPLAY: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END segment7;

ARCHITECTURE Behavior OF segment7 IS
BEGIN
  segment7: PROCESS(M)
  BEGIN
  IF (M(0) = '0' AND M(1) = '0' AND M(2) = '0' AND M(3) = '0') THEN 
  DISPLAY <= "1000000"; --0 
  
  ELSIF (M(0) = '1' AND M(1) = '0' AND M(2) = '0' AND M(3) = '0') THEN 
  DISPLAY <= "1111001";  --1

  ELSIF(M(0) = '0' AND M(1) = '1' AND M(2) = '0' AND M(3) = '0') THEN
  DISPLAY <= "0100100";  --2
  
  ELSIF (M(0) = '1' AND M(1) = '1' AND M(2) = '0' AND M(3) = '0') THEN
  DISPLAY <= "0110000"; --3 

  ELSIF (M(0) = '0' AND M(1) = '0' AND M(2) = '1' AND M(3) = '0') THEN
  DISPLAY <= "0011001"; --4
  
  ELSIF (M(0) = '1' AND M(1) = '0' AND M(2) = '1' AND M(3) = '0') THEN
  DISPLAY <= "0010010"; --5
  
  ELSIF (M(0) = '0' AND M(1) = '1' AND M(2) = '1' AND M(3) = '0') THEN
  DISPLAY <= "0000010"; --6
  
  ELSIF (M(0) = '1' AND M(1) = '1' AND M(2) = '1' AND M(3) = '0') THEN
  DISPLAY <= "1111000"; --7
  
  ELSIF (M(0) = '0' AND M(1) = '0' AND M(2) = '0' AND M(3) = '1') THEN
  DISPLAY <= "0000000"; -- 8
  
  ELSIF (M(0) = '1' AND M(1) = '0' AND M(2) = '0' AND M(3) = '1') THEN
  DISPLAY <= "0010000"; -- 9
  
  ELSE
  DISPLAY <= "1111111"; --BLANK
  
  END IF;
  END PROCESS segment7;
END Behavior;