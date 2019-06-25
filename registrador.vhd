library ieee;
use ieee.std_logic_1164.all;
entity registrador is port (
	CLK, RST: in std_logic;
	EN: in std_logic;
	D: in std_logic_vector(1 downto 0);
	Q: out std_logic_vector(1 downto 0)
);
end registrador;
architecture behv of registrador is
begin
process(CLK, D, EN, RST)
begin
if RST = '0' then
	Q <= "00";	
elsif (CLK'event and CLK = '1') then 
		if EN = '0' then
		Q <= D;
		end if;
end if;
end process;
end behv;
