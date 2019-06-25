library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity FSM_clock is
	port (reset, enable: in std_logic;
			clock: in std_logic;
			C0_5Hz, C1Hz, C2Hz, C4Hz, C10Hz: out std_logic
			);
end FSM_clock;

architecture topo_beh of FSM_clock is
	signal contador1, contador2, contador3, contador4: std_logic_vector(27 downto 0);
	signal contador5: std_logic_vector(31 downto 0);
	-- registra valor da contagem
	Begin
	P1: process(clock, reset, enable, contador1)
	begin
	if reset= '0' then
		contador1 <= x"0000000";
	elsif clock'event and clock= '1' and enable= '1' then
		contador1 <= contador1 + 1;
		if contador1 = x"0BEBC1F" then
			contador1 <= x"0000000";
			C0_5Hz <= '1';
		else
			C0_5Hz <= '0';
		end if;
	end if;
	end process;
	
		P2: process(clock, reset, enable, contador2)
	begin
	if reset= '0' then
		contador2 <= x"0000000";
	elsif clock'event and clock= '1' and enable= '1' then
		contador2 <= contador2 + 1;
		if contador2 = x"17D783F" then
			contador2 <= x"0000000";
			C1Hz <= '1';
		else
			C1Hz <= '0';
		end if;
	end if;
	end process;
	
		P3: process(clock, reset, enable, contador3)
	begin
	if reset= '0' then
		contador3 <= x"0000000";
	elsif clock'event and clock= '1' and enable= '1' then
		contador3 <= contador3 + 1;
		if contador3 = x"2FAF07F" then
			contador3 <= x"0000000";
			C2Hz <= '1';
		else
			C2Hz <= '0';
		end if;
	end if;
	end process;
	
		P4: process(clock, reset, enable, contador4)
	begin
	if reset= '0' then
		contador4 <= x"0000000";
	elsif clock'event and clock= '1' and enable= '1' then
		contador4 <= contador4 + 1;
		if contador4 = x"5F5E0FF" then
			contador4 <= x"0000000";
			C4Hz <= '1';
		else
			C4Hz <= '0';
		end if;
	end if;
	end process;
	
		P5: process(clock, reset, enable, contador5)
	begin
	if reset= '0' then
		contador5 <= x"0000000";
	elsif clock'event and clock= '1' and enable= '1' then
		contador5 <= contador5 + 1;
		if contador5 = x"1DCD64FF" then
			contador5 <= x"00000000";
			C10Hz <= '1';
		else
			C10Hz <= '0';
		end if;
	end if;
	end process;
end topo_beh;
