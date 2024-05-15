LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY binaryToBCD IS
PORT ( SW: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
  HEX1, HEX0: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END binaryToBCD;

ARCHITECTURE behavior OF binaryToBCD IS

-- components
COMPONENT rangeComparator IS
PORT (
  NUM: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
  A: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END COMPONENT;

COMPONENT priorityEncoder IS
PORT (
  A: IN STD_LOGIC_VECTOR(6 DOWNTO 0);
  encoded: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END COMPONENT;

COMPONENT segment7 IS
PORT(M: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
DISPLAY: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END COMPONENT;

COMPONENT mux IS
PORT (
  SEL: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  V: OUT STD_LOGIC_VECTOR(5 DOWNTO 0));
END COMPONENT;

COMPONENT subtractor6bits IS
PORT( OP1, OP2: in std_logic_vector(5 downto 0); --operands
      R : out std_logic_vector(5 downto 0) --result
		);
END COMPONENT;

COMPONENT subtractor IS
PORT( X, Y, Cin : in std_logic;
      S, Cout : out std_logic);
END COMPONENT;

-- components listed -> signals & mapping
SIGNAL rangeD: STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL selection: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL sub, rim: STD_LOGIC_VECTOR(5 DOWNTO 0);

BEGIN
COMP: rangeComparator PORT MAP (SW, rangeD);
ENC: priorityEncoder PORT MAP(rangeD, selection);
DISP1: segment7 PORT MAP(selection, HEX1);
MUXDEC: mux PORT MAP (selection, sub);
SUBDEC: subtractor6bits PORT MAP(SW, sub, rim);
DISP0: segment7 PORT MAP(rim(3 downto 0), HEX0);

END behavior;