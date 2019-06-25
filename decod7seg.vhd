library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity decod7seg is
port (G: in std_logic_vector(3 downto 0);
		HEX: out std_logic_vector(6 downto 0)
);
end decod7seg;
architecture circuito of decod7seg is
begin
	HEX <= "1000000" when G(3 downto 0) = "0000" else
			"1111001" when G(3 downto 0) = "0001" else
			"0100100" when G(3 downto 0) = "0010" else
			"0110000" when G(3 downto 0) = "0011" else
			"0011001" when G(3 downto 0) = "0100" else
			"0010010" when G(3 downto 0) = "0101" else
			"0000010" when G(3 downto 0) = "0110" else
			"1111000" when G(3 downto 0) = "0111" else
			"0000000" when G(3 downto 0) = "1000" else
			"0011000" when G(3 downto 0) = "1001" else
			"0001000" when G(3 downto 0) = "1010" else
			"0000011" when G(3 downto 0) = "1011" else
			"1000110" when G(3 downto 0) = "1100" else
			"0100001" when G(3 downto 0) = "1101" else
			"0000110" when G(3 downto 0) = "1110" else
			"0001110";
end circuito;