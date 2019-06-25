library ieee;
use ieee.std_logic_1164.all;

entity Controle is port (
	c, Tm, clock, reset: in std_logic;
	Tc, Tw: out std_logic
	);
end Controle;

architecture AAAHHH of Controle is
	signal Q, P: std_logic_vector(1 downto 0);
	begin
	P1: process(clock, reset)
	begin
		if reset= '0' then
			Q(1 downto 0) <= "00";
		elsif (clock'event and clock='0') then
			Q(1 downto 0) <= P(1 downto 0);
		end if;
	end process;
	
	P2: process(Q, P)
	begin
		P(1) <= Q(0) and c and Tm;
		P(0) <= not(Q(0)) or (not(c) and Tm);
		Tc <= not(Q(1) or Q(0));
		Tw <= Q(1);
	end process;
end AAAHHH;

	