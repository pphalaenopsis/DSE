LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY testbenchBCD IS
END testbenchBCD;

ARCHITECTURE behavior OF testbenchBCD IS

-- dut: converter BCD
COMPONENT binaryToBCD IS
PORT ( SW: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
  HEX1, HEX0: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END COMPONENT;

-- testbench signals
SIGNAL S: STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL DispDec, DispUnit: STD_LOGIC_VECTOR(6 DOWNTO 0);

BEGIN
PROCESS
BEGIN

  S <= "000000"; --0
  WAIT FOR 10 ns;
  S <= "000001"; --1
  WAIT FOR 10 ns;
  S <= "000010"; --2
  WAIT FOR 10 ns;
  S <= "000011"; --3
  WAIT FOR 10 ns;
  S <= "000100"; --4
  WAIT FOR 10 ns;
  S <= "000101"; --5
  WAIT FOR 10 ns;
  S <= "000110"; --6
  WAIT FOR 10 ns;
  S <= "000111"; --7
  WAIT FOR 10 ns;
  S <= "001000"; --8
  WAIT FOR 10 ns;
  S <= "001001"; --9
  WAIT FOR 10 ns;
  S <= "001010"; --10
  WAIT FOR 10 ns;
  S <= "001011"; --11
  WAIT FOR 10 ns;
  S <= "001100"; --12
  WAIT FOR 10 ns;
  S <= "001101"; --13
  WAIT FOR 10 ns;
  S <= "001110"; --14
  WAIT FOR 10 ns;
  S <= "001111"; --15
  WAIT FOR 10 ns;
  S <= "010000"; --16
  WAIT FOR 10 ns;
  S <= "010001"; --17
  WAIT FOR 10 ns;
  S <= "010010"; --18
  WAIT FOR 10 ns;
  S <= "010011"; --19
  WAIT FOR 10 ns;
  S <= "010100"; --20
  WAIT FOR 10 ns;
  S <= "010101"; --21
  WAIT FOR 10 ns;
  S <= "010110"; --22
  WAIT FOR 10 ns;
  S <= "010111"; --23
  WAIT FOR 10 ns;
  S <= "011000"; --24
  WAIT FOR 10 ns;
  S <= "011001"; --25
  WAIT FOR 10 ns;
  S <= "011010"; --26
  WAIT FOR 10 ns;
  S <= "011011"; --27
  WAIT FOR 10 ns;
  S <= "011100"; --28
  WAIT FOR 10 ns;
  S <= "011101"; --29
  WAIT FOR 10 ns;
  S <= "011110"; --30
  WAIT FOR 10 ns;
  S <= "011111"; --31
  WAIT FOR 10 ns;
  S <= "100000"; --32
  WAIT FOR 10 ns;
  S <= "100001"; --33
  WAIT FOR 10 ns;
  S <= "100010"; --34
  WAIT FOR 10 ns;
  S <= "100011"; --35
  WAIT FOR 10 ns;
  S <= "100100"; --36
  WAIT FOR 10 ns;
  S <= "100101"; --37
  WAIT FOR 10 ns;
  S <= "100110"; --38
  WAIT FOR 10 ns;
  S <= "100111"; --39
  WAIT FOR 10 ns;
  S <= "101000"; --40
  WAIT FOR 10 ns;
  S <= "101000"; --40
  WAIT FOR 10 ns;
  S <= "101001"; --41
  WAIT FOR 10 ns;
  S <= "101010"; --42
  WAIT FOR 10 ns;
  S <= "101011"; --43
  WAIT FOR 10 ns;
  S <= "101100"; --44
  WAIT FOR 10 ns;
  S <= "101101"; --45
  WAIT FOR 10 ns;
  S <= "101110"; --46
  WAIT FOR 10 ns;
  S <= "101111"; --47
  WAIT FOR 10 ns;
  S <= "110000"; --48
  WAIT FOR 10 ns;
  S <= "110001"; --49
  WAIT FOR 10 ns;
  S <= "110010"; --50
  WAIT FOR 10 ns;
  S <= "110011"; --51
  WAIT FOR 10 ns;
  S <= "110100"; --52
  WAIT FOR 10 ns;
  S <= "110101"; --53
  WAIT FOR 10 ns;
  S <= "110110"; --54
  WAIT FOR 10 ns;
  S <= "110111"; --55
  WAIT FOR 10 ns;
  S <= "111000"; --56
  WAIT FOR 10 ns;
  S <= "111001"; --57
  WAIT FOR 10 ns;
  S <= "111010"; --58
  WAIT FOR 10 ns;
  S <= "111011"; --59
  WAIT FOR 10 ns;
  S <= "111100"; --60
  WAIT FOR 10 ns;
  S <= "111101"; --61
  WAIT FOR 10 ns;
  S <= "111110"; --62
  WAIT FOR 10 ns;
  S <= "111111"; --63
  WAIT FOR 10 ns;

END PROCESS;

-- mapping on design
BINtoBCD: binaryToBCD PORT MAP(S, DispDec, DispUnit); 

END behavior;