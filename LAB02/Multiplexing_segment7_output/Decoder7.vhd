LIBRARY ieee;
USE ieee.std_logic_1164.all;  --controlla un solo diplay il codice del decoder

ENTITY Decoder7 IS
  PORT ( C : IN STD_LOGIC_VECTOR(2 downto 0);  --decoder7 called 5 times, one for each display/letter
  Display : OUT STD_LOGIC_VECTOR(6 downto 0));  
END Decoder7;

ARCHITECTURE Behavior OF Decoder7 IS
  begin 
  decoder: PROCESS(C)
  BEGIN
  
  IF (C(0)='0' AND C(1)='0' AND C(2)='0') THEN
  Display(6 DOWNTO 0) <= "0001001"; --mostra la h
  
  ELSIF (C(0)='1' AND C(1)='0' AND C(2)='0') THEN
  Display(6 DOWNTO 0) <="0000110"; --mostra la e
  
  ELSIF (C(0)='0' AND C(1)='1' AND C(2)='0') THEN
  Display(6 DOWNTO 0) <="1000111"; --mostra la l
  
  ELSIF (C(0)='1' AND C(1)='1' AND C(2)='0') THEN
  Display(6 DOWNTO 0) <="1000000"; --mostra la 0
  
  ELSIF (C(0)='0' AND C(1)='0' AND C(2)='1') THEN
  Display(6 DOWNTO 0) <="0001110"; --mostra la f
  
  ELSIF (C(0)='1' AND C(1)='0' AND C(2)='1') THEN
  Display(6 DOWNTO 0) <="1000110"; --mostra la c
  
  ELSIF (C(0)='0' AND C(1)='1' AND C(2)='1') THEN
  Display(6 DOWNTO 0) <="0001100"; --mostra la p 
  
  ELSE
  Display(6 DOWNTO 0) <="1111111"; --mostra blank
  
  END IF;
  END PROCESS decoder;
END Behavior;