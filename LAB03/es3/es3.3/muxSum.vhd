LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY muxSum IS
PORT (
Ra,Rb: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
z: IN STD_LOGIC; R: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END muxSum;

ARCHITECTURE behavior OF muxSum IS
BEGIN
process(Ra, z,Rb)
begin
IF (z='0') then R<=Ra;
else R<=Rb; 
END IF;
end process;
END behavior;