
library ieee;
use ieee.std_logic_1164.all;
entity feu_alternant  is 
	
port (
	 HEX : OUT std_logic_vector(7 downto 0);
	 HEX2 : OUT std_logic_vector(7 downto 0);
	 HEX3 : OUT std_logic_vector (7 downto 0);
	 HEX4 : OUT std_logic_vector (7 downto 0);
	 clk2 : IN std_logic
		) ;
end entity ;	


	
architecture rtl of feu_alternant is 
signal sept_segments : integer :=0;
begin
	process(clk2)
	begin
		if (rising_edge (clk2)) then
			if sept_segments = 20 then
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
			HEX3 <="10111111";
			HEX2 <= "11000000";
			HEX4 <= "10111111";
			end if;
			if (sept_segments = 2)then
			HEX <= "10000000";
			HEX3 <="10111111";
			HEX2 <= "11000000";
			HEX4 <= "10111111";
			end if;
			if (sept_segments =3)then
			HEX <= "11111000";
			HEX3 <="10111111";
			HEX2 <= "11000000";
			HEX4 <= "10111111";
			end if;
			if (sept_segments =4)then
			HEX<= "10000010";
			HEX3 <="10111111";
			HEX2 <= "11000000";
			HEX4 <= "10111111";
				end if;
			if (sept_segments =5)then
			HEX <="10010010";
			HEX3 <="10111111";
			HEX2 <= "11000000";
			HEX4 <= "10111111";
			end if;
			if (sept_segments =6)then
			HEX<="10011001";
			HEX3 <="10111111";
			HEX2 <= "11000000";
			HEX4 <= "10111111";
			end if;
			if (sept_segments = 7)then
			HEX <= "10110000";
			HEX3 <="10111111";
			HEX2 <= "11000000";
			HEX4 <= "10111111";
			end if;
			if (sept_segments = 8)then
			HEX <= "10100100";
			HEX3 <="10111111";
			HEX2 <= "11000000";
			HEX4 <= "10111111";
			end if;
			if (sept_segments = 9)then
			HEX <= "11111001";
			HEX3 <="10111111";
			HEX2 <= "11000000";
			HEX4 <= "10111111";
			end if;
			if (sept_segments = 10)then
			HEX <="11000000";
			HEX3 <="10111111";
			HEX2 <= "11000000";
			HEX4 <= "10111111";
			end if;
			if (sept_segments = 11)then
			HEX3 <="10010000";
			HEX <="10111111";
			HEX4 <= "11000000";
			HEX2 <= "10111111";
			end if;
			if (sept_segments = 12)then
			HEX3 <= "10000000";
			HEX <="10111111";
			HEX4 <= "11000000";
			HEX2 <= "10111111";
			end if;
			if (sept_segments =13)then
			HEX3 <= "11111000";
			HEX <="10111111";
			HEX4 <= "11000000";
			HEX2 <= "10111111";
			
			end if;
			if (sept_segments =14)then
			HEX3<= "10000010";
			HEX <="10111111";
			HEX4 <= "11000000";
			HEX2 <= "10111111";
				end if;
			if (sept_segments =15)then
			HEX3 <="10010010";
			HEX <="10111111";
			HEX4 <= "11000000";
			HEX2 <= "10111111";
			end if;
			if (sept_segments =16)then
			HEX3<="10011001";
			HEX <="10111111";
			HEX4 <= "11000000";
			HEX2 <= "10111111";
			end if;
			if (sept_segments = 17)then
			HEX3 <= "10110000";
			HEX <="10111111";
			HEX4 <= "11000000";
			HEX2 <= "10111111";
			end if;
			if (sept_segments = 18)then
			HEX3 <= "10100100";
			HEX <="10111111";
			HEX4 <= "11000000";
			HEX2 <= "10111111";
			end if;
			if (sept_segments = 19)then
			HEX3 <= "11111001";
			HEX <="10111111";
			HEX4 <= "11000000";
			HEX2 <= "10111111";
			end if;
			if (sept_segments = 20)then
			HEX3 <="11000000";
			HEX <="10111111";
			HEX4 <= "11000000";
			HEX2 <= "10111111";
			end if;
		
	end process;
	
end rtl;