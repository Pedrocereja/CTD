library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity mux is
port (C: in std_logic_vector(1 downto 0); --C: level
		F1: in std_logic;
		F2: in std_logic;
		F3: in std_logic;
		F4: in std_logic;
		CLKHZ: out std_logic
);
end mux;
architecture circuito of mux is
begin
	CLKHZ <= F1 when C = "00" else
	     	 F2 when C = "01" else
		 F3 when C = "10" else
		 F4;
end circuito;
