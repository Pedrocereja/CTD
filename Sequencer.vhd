library ieee;
use ieee.std_logic_1164.all;

entity Sequencer is
	port (HEXSEQ: out std_logic_vector(3 downto 0);
			CLOCKHZ: in std_logic;
			R: in std_logic;
			E: in std_logic
			);
end Sequencer;

architecture topo_beh of Sequencer is
signal F: std_logic_vector(3 downto 0);

component Tarefa1 is
	port (contagem: out std_logic_vector(3 downto 0);
			clock: in std_logic;
			reset, E: in std_logic
			);
end component;
		
begin
	L1: Tarefa1 port map (HEXSEQ, CLOCKHZ, R, E);
end topo_beh;
