library IEEE;
use IEEE.Std_Logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity topzao is
port (SW: in std_logic_vector(9 downto 0);
		KEY: in std_logic_vector(3 downto 0);
		CLOCK_50: in std_logic;
		LEDR: out std_logic_vector(9 downto 0);
		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5: out std_logic_vector(6 downto 0)
);
end topzao;

architecture circuito of topzao is
	signal sel: std_logic_vector(1 downto 0);
	signal BTN0, BTN1, BTN2, BTN3, overflow, end_game, end_time, win1, win0, R1, R2, E1, E2, E3, E4: std_logic;

component Datapathzao is port (
	BTN2, CLOCK_50, R1, R2, En1, En2, En3, En4: in std_logic;
	SW, sel: in std_logic_vector(1 downto 0);
	end_game, end_time, overflow, win0, win1: out std_logic;
	LEDR: out std_logic_vector(9 downto 0)
	);
end component;

component Controlao is port(
	clock: in std_logic;
	reset: in std_logic;
	enter: in std_logic;
	overf, end_game, end_time, win1, win0: in std_logic;
	sel: out std_logic_vector(1 downto 0);	
	R1, R2, E1, E2, E3, E4: out std_logic
	);
end component;

component ButtonSync is
	port
	(
		KEY0, KEY1, KEY2, KEY3, CLK: in std_logic;
		BTN0, BTN1, BTN2, BTN3: out std_logic
	);
end component;


begin
	TOP0: ButtonSync port map (KEY(0), KEY(1), KEY(2), KEY(3), CLOCK_50, BTN0, BTN1, BTN2, BTN3);
	TOP1: Controlao port map (CLOCK_50, BTN0, BTN1, overflow, end_game, end_time, win1, win0, sel(1 downto 0), R1, R2, E1, E2, E3, E4);
	TOP2: Datapathzao port map (BTN2, CLOCK_50, R1, R2, E1, E2, E3, E4, SW(1 downto 0), sel(1 downto 0), end_game, end_time, overflow, win0, win1, LEDR(9 downto 0));
end circuito;
