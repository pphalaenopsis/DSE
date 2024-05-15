LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux IS
PORT (Ca,Cb, z: IN STD_LOGIC; Cnext: OUT STD_LOGIC);
END mux;

ARCHITECTURE behavior OF mux IS
BEGIN
  Cnext <= (NOT (z) AND Ca) OR (z AND Cb); --rivedere
END behavior;
