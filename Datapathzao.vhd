library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Datapathzao is port (
	BTN2, CLOCK_50, R1, R2, E1, E2, E3, E4: in std_logic;
	SW, sel: in std_logic_vector(1 downto 0);
	end_game, end_time, overflow, win0, win1: out std_logic;
	LEDR: out std_logic_vector(9 downto 0)
	);
end Datapathzao;

architecture arqdtp of Datapathzao is
	signal HEXDEC, ROUNDDEC, JOGADOR, n1ponto0, n1ponto1, n2ponto0, n2ponto1, levelo: std_logic_vector(6 downto 0);
	signal U1_POINT, U0_POINT: std_logic_vector(5 downto 0);
	signal HEXSEQ, TIMEE, ROUND: std_logic_vector(3 downto 0);
	signal LEVEL: std_logic_vector(1 downto 0);
	signal CLOCKHZ, E, ENp0, ENp1, CLKT, C0_5Hz,
C1Hz, C2Hz, C4Hz, C10Hz, USER, U1_29, U0_29, OVER_F1, OVER_F0, WIN_POINT0, WIN_POINT1: std_logic;

component Decoder is
port (G: in std_logic_vector(3 downto 0);
		HEX: out std_logic_vector(9 downto 0)
);
end component;

component Counter_time is port (
	CLOCK_50, CLKT, reset, en: in std_logic;  --reset: reset do controle
   	TIMEE: out std_logic_vector(3 downto 0);
	end_time: out std_logic
	 );
end component;

component Counter_round is port (
	CLOCK_50, CLKT, reset, en: in std_logic;  --reset: reset do controle
   	TIMEE: out std_logic_vector(3 downto 0);
	end_game: out std_logic
	 );
end component;

component Counter_point is port (
	CLOCK_50, CLKT, reset, enable: in std_logic;  --reset: reset do controle
   	TIMEE: out std_logic_vector(5 downto 0);
   	Data: in std_logic_vector(3 downto 0);
		U1_29: out std_logic
   	);
end component;


component Sequencer is
	port (HEXSEQ: out std_logic_vector(3 downto 0);
			CLOCKHZ: in std_logic;
			R: in std_logic;
			E: in std_logic
			);
end component;

component registrador is port (
	CLK, RST: in std_logic;
	EN: in std_logic;
	D: in std_logic_vector(1 downto 0);
	Q: out std_logic_vector(1 downto 0)
	);
end component;

component mux is
port (C: in std_logic_vector(1 downto 0); --C: level
		F1: in std_logic;
		F2: in std_logic;
		F3: in std_logic;
		F4: in std_logic;
		CLKHZ: out std_logic
);
end component;

component FSM_clock is
	port (reset, enable: in std_logic;
			clock: in std_logic;
			C0_5Hz, C1Hz, C2Hz, C4Hz, C10Hz: out std_logic
			);
end component;

component Logica is port (
	end_game, U0, U1: in std_logic;
	Win0, Win1: out std_logic
	);
end component;

component decod7seg is
port (G: in std_logic_vector(3 downto 0);
	HEX: out std_logic_vector(6 downto 0)
	);
end component;


	begin
	E <= BTN2 and E4;
	CLKT <= C0_5Hz;
	ENp0 <= not(USER) and E3;
	ENp1 <= USER and E3;
	win0 <= (USER and end_time) or WIN_POINT0 or OVER_F1 or U0_29;
	win1 <= (not(USER) and end_time) or WIN_POINT1 or OVER_F0 or U1_29;
	OVER_F0 <= '1' when (U0_29 = "11101") else '0';
	OVER_F1 <= '1' when (U1_29 = "11101") else '0';
	overflow <= OVER_F1 or OVER_F0;
	USER <= ROUND(0);
	ISA0: Sequencer port map (HEXSEQ(3 downto 0), CLOCKHZ, R1, E);
	ISA1: Counter_time port map (CLOCK_50, CLKT, R2, E4, TIMEE(3 downto 0), end_time);
	ISA2: FSM_clock port map (R1, E1, CLOCK_50, C0_5Hz, C1Hz, C2Hz, C4Hz, C10Hz);
	ISA3: mux port map (LEVEL, C1Hz, C2Hz, C4Hz, C10Hz, CLOCKHZ);
	ISA4: registrador port map (CLOCK_50, R1, E2, SW(1 downto 0), LEVEL(1 downto 0));
	ISA5: Decoder port map (TIMEE(3 downto 0), LEDR(9 downto 0));
	ISA6: Counter_point port map (CLOCK_50, CLKT, R1, ENp1, U1_POINT(5 downto 0), HEXSEQ(3 downto 0), U1_29);
	ISA7: Counter_point port map (CLOCK_50, CLKT, R1, ENp0, U0_POINT(5 downto 0), HEXSEQ(3 downto 0), U0_29);
	ISA8: Counter_round port map (CLOCK_50, CLKT, R1, E3, ROUND(3 downto 0), end_game);
	PEDRO0: Logica port map (end_game, U0_POINT(5 downto 0), U1_POINT1(5 downto 0), WIN_POINT0, WIN_POINT1);
	PEDRO1: decod7seg port map (HEXSEQ(3 downto 0), HEXDEC(6 downto 0));
	PEDRO2: mux port map (sel(1 downto 0), "1111111", "1000111", HEXDEC(6 downto 0), "1100001");
	PEDRO3: decod7seg port map (ROUND(3 downto 0), ROUNDDEC(6 downto 0));
	PEDRO4: decod7seg port map ("000"&win1, JOGADOR(6 downto 0));
	ISA9: mux port map (sel(1 downto 0), "0010010", "0000110", ROUNDDEC(6 downto 0), JOGADOR(6 downto 0));
	PEDRO5: decod7seg port map ("00"&U0_POINT(5 downto 4), n1ponto0(6 downto 0));
	PEDRO6: mux port map (sel(1 downto 0), "0000111", "1100011", n1ponto0(6 downto 0), n1ponto0(6 downto 0)); 
	PEDRO7: decod7seg port map (U1_POINT(3 downto 0), n2ponto0(6 downto 0)); --
	PEDRO8: mux port map (sel(1 downto 0), "0001000", "0000110", n2ponto0(6 downto 0), n2ponto0(6 downto 0)); 
	PEDRO9: decod7seg port map ("00"&U1_POINT(5 downto 4), n1ponto1(6 downto 0));
	PEDRO10: mux port map (sel(1 downto 0), "0101111", "1000111", n1ponto1(6 downto 0), n1ponto1(6 downto 0)); 
	PEDRO11: decod7seg port map ("00"&LEVEL(1 downto 0), levelo(6 downto 0));
	PEDRO12: decod7seg port map (U1_POINT(3 downto 0), n2ponto1(6 downto 0));
	PEDRO13: mux port map (sel(1 downto 0), "0000111", levelo(6 downto 0), n2ponto1(6 downto 0), n2ponto1(6 downto 0)); 

end arqdtp;
