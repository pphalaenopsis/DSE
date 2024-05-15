LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fullAdder IS
PORT (
  An, Bn, Cin: IN STD_LOGIC;
  Sn, Cout: OUT STD_LOGIC
);
END fullAdder;

ARCHITECTURE behavior OF fullAdder IS
BEGIN

  Sn <= An XOR Bn XOR Cin;
  Cout <= (An AND Bn) OR (Bn AND Cin) OR (An AND Cin);

END behavior;