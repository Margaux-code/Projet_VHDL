
library ieee;
use ieee.std_logic_1164.all;
entity feu_alternant  is 
	
port (
	 HEX : OUT std_logic_vector(7 downto 0);
	 clk2 : IN std_logic
		) ;
end entity ;	


	
architecture rtl of feu_alternant is 
signal sept_segments : integer :=0;
begin
	process(clk2)
	begin
		if (rising_edge (clk2)) then
			if sept_segments = 10 then
				sept_segments <= 1;
			else
		sept_segments <= sept_segments + 1;
		end if;
		end if;
	end process;
	
	process(sept_segments)
	begin
	if (sept_segments = 1)then
			HEX <="10010000";
			end if;
			if (sept_segments = 2)then
			HEX <= "10000000";
			end if;
			if (sept_segments =3)then
			HEX <= "11111000";
			end if;
			if (sept_segments =4)then
			HEX<= "10000010";
				end if;
			if (sept_segments =5)then
			HEX <="10010010";
			end if;
			if (sept_segments =6)then
			HEX<="10011001";
			end if;
			if (sept_segments = 7)then
			HEX <= "10110000";
			end if;
			if (sept_segments = 8)then
			HEX <= "10100100";
			end if;
			if (sept_segments = 9)then
			HEX <= "11111001";
			end if;
			if (sept_segments = 10)then
			HEX <="11000000";
			end if;
		
	end process;
	
end rtl;