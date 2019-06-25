library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Counter_point is port (
	CLOCK_50, CLKT, reset, enable: in std_logic;  --reset: reset do controle
   	TIMEE: out std_logic_vector(5 downto 0);
   	Data: in std_logic_vector(3 downto 0);
	U1_29: out std_logic
   	);
end Counter_point;

architecture arqmachine of Counter_point is
	signal m, r: std_logic_vector(5 downto 0); --m = valor máximo da contagem  --r = saída da contagem
	signal c: std_logic; --c = pause da conatgem  --C1Hz = relógio de 1Hz
	
	
-- Incluir signals se preciso
	signal Tw, Tc, Tm: std_logic; -- Tc=clear  --Tw=load
	
	
-- Declarar componentes
component Datapath_p is port (
	m: in std_logic_vector(5 downto 0);
	Data: in std_logic_vector(3 downto 0);
	enable, Tw, Tc: in std_logic;
	Tm: out std_logic;
	r: out std_logic_vector(5 downto 0));
end component;


	
component Controle_p is
		port(	c, Tm, clock, reset: in std_logic;
			Tc, Tw: out std_logic
				);
end component;

begin

	m <= "011101";
	c <= '1';
	TIMEE(5 downto 0) <= r;
	ISA0: Controle port map (c, Tm, CLOCK_50, reset, Tc, Tw);
	ISA2: Datapath port map (m, Data, enable, Tw, Tc, Tm, r);
	U1_29 <= '1' when (r = "011101") else
		'0';
	
	
	-- Incluir instancias de Datapath e Controle e conectá-las...
	

	
end arqmachine;

