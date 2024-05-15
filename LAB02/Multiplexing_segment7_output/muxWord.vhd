LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY muxWord IS
PORT ( sel: IN STD_LOGIC_VECTOR(1 downto 0);
output : OUT STD_LOGIC_VECTOR(14 downto 0));
END muxWord;
ARCHITECTURE Behavior OF muxWord IS
BEGIN 
  mux: PROCESS(sel)
  BEGIN
  if (sel(0)='0' AND sel(1)='0') THEN
    output(14 DOWNTO 0) <= "000001010010011"; --HELLO
  ELSIF (sel(0)='0' AND sel(1)='1') THEN
    output(14 DOWNTO 0) <= "101001110110011"; --CEPPO
  ELSIF (sel(0)='1' AND sel(1)='1') THEN
    output(14 DOWNTO 0) <= "100001110110011"; --FEPPO
  ELSE --10
    output(14 DOWNTO 0) <= "101001010010011"; --CELLO
  END IF;
  END PROCESS mux;
END Behavior;