library ieee;
use ieee.std_logic_1164.all;

entity Tarefa1 is port(
	clock: in std_logic;
	reset, E: in std_logic;
	contagem: out std_logic_vector(3 downto 0)
	);
end Tarefa1;

architecture bhv of Tarefa1 is
	type STATES is (E0, E1, E2, E3, E4, E5, E6, E7, E8, E9, E10, E11, E12, E13, E14, E15, E16, E17, E18, E19, E20);
	signal EA, PE: STATES;
	begin
	
	P1: process(clock, reset)
	begin
		if reset= '0' then
			EA <= E0;
		elsif clock'event and clock= '0' and E= '0' then
			EA <= PE;
		end if;
	end process;
	
	P2: process(EA)
	begin
		case EA is
			when E0 =>
				contagem <= "0010";
				PE <= E1;
			when E1 =>
				contagem <= "0001";
				PE <= E2;
			when E2 =>
				contagem <= "0110";
				PE <= E3;
			when E3 =>
				contagem <= "1111";
				PE <= E4;
			when E4 =>
				contagem <= "0101";
				PE <= E5;
			when E5 =>
				contagem <= "0111";
				PE <= E6;
			when E6 =>
				contagem <= "1010";
				PE <= E7;
			when E7 =>
				contagem <= "1111";
				PE <= E8;
			when E8 =>
				contagem <= "0011";
				PE <= E9;
			when E9 =>
				contagem <= "0001";
				PE <= E10;
			when E10 =>
				contagem <= "1100";
				PE <= E11;
			when E11 =>
				contagem <= "0110";
				PE <= E12;
			when E12 =>
				contagem <= "1101";
				PE <= E13;
			when E13 =>
				contagem <= "0100";
				PE <= E14;
			when E14 =>
				contagem <= "1011";
				PE <= E15;
			when E15 =>
				contagem <= "0011";
				PE <= E16;
			when E16 =>
				contagem <= "1100";
				PE <= E17;
			when E17 =>
				contagem <= "1001";
				PE <= E18;
			when E18 =>
				contagem <= "1000";
				PE <= E19;
			when E19 =>
				contagem <= "1110";
				PE <= E0;
		end case;
	end process;
end bhv;
