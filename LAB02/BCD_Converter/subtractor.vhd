LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY subtractor IS
PORT( X, Y, Cin : IN STD_LOGIC;
      S, Cout : OUT STD_LOGIC
);
END subtractor;

ARCHITECTURE dataflow OF subtractor IS
BEGIN
  S <= X XOR Y XOR Cin;
  Cout <= (X AND Y) OR (X AND Cin) OR (Y AND Cin);
END dataflow;

