library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Counter_time is port (
	CLOCK_50, CLKT, reset, en: in std_logic;  --reset: reset do controle
   	TIMEE: out std_logic_vector(3 downto 0);
	end_time: out std_logic
	 );
end Counter_time;

architecture arqmachine of Counter_time is
	signal m, r: std_logic_vector(3 downto 0); --m = valor máximo da contagem  --r = saída da contagem
	signal c: std_logic; --c = pause da conatgem  --C1Hz = relógio de 1Hz
	
	
-- Incluir signals se preciso
	signal Tw, Tc, Tm: std_logic; -- Tc=clear  --Tw=load
	
	
-- Declarar componentes
component Datapath is port (
	m: in std_logic_vector(3 downto 0);
	r: out std_logic_vector(3 downto 0);
	clock, Tw, Tc, en: in std_logic;
	Tm: out std_logic);
end component;


	
component Controle is
		port(	c, Tm, clock, reset: in std_logic;
			Tc, Tw: out std_logic
				);
end component;

begin

	m <= "1001";
	c <= '1';
	TIMEE(3 downto 0) <= r;
	end_time <= '1' when (r = "1001") else '0';
	ISA0: Controle port map (c, Tm, CLOCK_50, reset, Tc, Tw);
	ISA2: Datapath port map (m, CLKT, Tw, Tc, en, Tm, r);
	
	-- Incluir instancias de Datapath e Controle e conectá-las...
	

	
end arqmachine;

