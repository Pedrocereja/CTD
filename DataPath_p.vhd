library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Datapath_p is port (
	m: in std_logic_vector(5 downto 0);
	Data: in std_logic_vector(3 downto 0);
	r: out std_logic_vector(5 downto 0);
	enable, Tw, Tc: in std_logic;
	Tm: out std_logic);
end Datapath_p;

architecture arqdtp of Datapath is
	signal tot: std_logic_vector(5 downto 0);
	begin
		-- Registrador e Somador:
		process(clock,Tc,Tw)
			begin
			if (Tc = '1') then
				tot <= "000000";
			elsif (enable'event and enable = '1') then
				if (Tw = '1') then
					tot <= tot + Data;
				end if;
			end if;
		end process;
		r <= tot;
		-- Comparador:
		Tm <= '1' when (tot < m) else
		'0';

end arqdtp;
