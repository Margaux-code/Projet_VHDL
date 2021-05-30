library ieee;
use ieee.std_logic_1164.all;
entity buzzer  is 
	
port (
		buzzer1 : buffer std_logic;
		 clk2 : IN std_logic;
		 clk_50m : IN std_logic
		 
		) ;
end entity ;	


	
architecture rtl of buzzer is 
signal sept_segments : integer :=0;
begin
	process(clk2)
	begin
		if (rising_edge (clk2)) then
			if (sept_segments = 10) then
				sept_segments <= 1;
			else
			sept_segments <= sept_segments + 1;
			end if;
		end if;
	end process;
	process(sept_segments)
	begin
	if (sept_segments = 3 or sept_segments = 7 or sept_segments = 9 or  sept_segments =10) then
	buzzer1 <= '1';
	else buzzer1 <= '0';
	end if;
	end process;
end rtl;