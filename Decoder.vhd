library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Decoder is
port (G: in std_logic_vector(3 downto 0);
		HEX: out std_logic_vector(9 downto 0)
);
end Decoder;
architecture circuito of Decoder is
begin
	HEX <= "111111111" when G(3 downto 0) = "0000" else
			"011111111" when G(3 downto 0) = "0001" else
			"001111111" when G(3 downto 0) = "0010" else
			"000111111" when G(3 downto 0) = "0011" else
			"000011111" when G(3 downto 0) = "0100" else
			"000001111" when G(3 downto 0) = "0101" else
			"000000111" when G(3 downto 0) = "0110" else
			"000000011" when G(3 downto 0) = "0111" else
			"000000001" when G(3 downto 0) = "1000" else
			"000000000";
end circuito;
