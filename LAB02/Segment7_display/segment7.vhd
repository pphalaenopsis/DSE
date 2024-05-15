LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY segment7 IS
PORT ( SW : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
HEX0 : OUT STD_LOGIC_VECTOR(6 downto 0));
END segment7;
ARCHITECTURE Behavior OF segment7 IS
BEGIN
  segment7: PROCESS(SW)
  BEGIN
  IF (SW(0) = '0' AND SW(1) = '0' AND SW(2) = '0') THEN 
  HEX0(1) <= '0'; 
  HEX0(2) <= '0';
  HEX0(4) <= '0';
  HEX0(5) <= '0';
  HEX0(6) <= '0';
  
  HEX0(0) <= '1';
  HEX0(3) <= '1';
  -- HEX0 <= "1101000";
  ELSIF (SW(0) = '1' AND SW(1) = '0' AND SW(2) = '0') THEN 
  HEX0(0) <= '0';
  HEX0(1) <= '1';
  HEX0(2) <= '1';
  HEX0(3) <= '0';
  HEX0(6) <= '0';
  
  HEX0(4) <= '0';
  HEX0(5) <= '0';
  -- HEX <= "0000110";
  ELSIF(SW(0) = '0' AND SW(1) = '1' AND SW(2) = '0') THEN
  HEX0(3) <= '0';
  HEX0(4) <= '0';
  HEX0(5) <= '0';
  
  HEX0(0) <= '1';
  HEX0(1) <= '1';
  HEX0(2) <= '1';
  HEX0(6) <= '1';
  -- HEX <= "1110001";
  ELSIF (SW(0) = '1' AND SW(1) = '1' AND SW(2) = '0') THEN
  
  HEX0(0) <= '0';
  HEX0(1) <= '0';
  HEX0(2) <= '0';
  HEX0(3) <= '0';
  HEX0(4) <= '0';
  HEX0(5) <= '0';
  
  HEX0(6) <= '1';
  
  -- HEX <= "0000001";
  ELSE HEX0(6 DOWNTO 0) <= "1111111";
  END IF;
  END PROCESS segment7;
END Behavior;
  