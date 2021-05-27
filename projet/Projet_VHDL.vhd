

library ieee;
use ieee.std_logic_1164.all;
use work.all;
entity Projet_VHDL is 
	
port (
		 clk_50m : in std_logic;
		 led_vert1 : buffer std_logic;  
		 led_orange1 : buffer std_logic;
		 led_rouge1 : buffer std_logic;
		 pieton_vert1 : buffer std_logic;
		 pieton_rouge1 : buffer std_logic;
		 led_vert2 : buffer std_logic;  
		 led_orange2 : buffer std_logic;
		 led_rouge2 : buffer std_logic;
		 pieton_vert2 : buffer std_logic;
		 pieton_rouge2 : buffer std_logic;
		 signal HEX : OUT std_logic_vector(7 downto 0)
		) ;
end entity ;		
		
architecture rtl of Projet_VHDL is 
component compteur
port 
(		
		clock_50m : in std_logic;
		clock_1hz : out std_logic);
	end component ;
	signal clk : std_logic;
	
	begin
	f1: entity work.feu_alternant(rtl)
	port map(clk2 => clk, HEX => HEX);
	clkdiv : compteur port map (clk_50m, clk);
	process(clk)
	
	 variable compter : integer := 0 ;
	 variable sept_segments : integer :=0;
	 variable temps_rouge : integer := 10;
	 variable temps_vert : integer := 10;

	begin
	

	
	if (rising_edge (clk)) then
	
	
		compter:= compter+1;
		if(compter < temps_vert) then
		--Feu voiture 1 : vert
			led_vert1 <= '1';
			led_orange1 <= '0';
			led_rouge1<= '0';
		--Feu pieton 1 : rouge
			pieton_rouge1 <='1';
			pieton_vert1 <= '0';
		--Feu voiture 2 : rouge
			led_vert2 <= '0';
			led_orange2 <= '0';
			led_rouge2<= '1';
		--Feu pieton 2 : vert
			pieton_rouge2 <='0';
			pieton_vert2 <= '1';	
			
			
		end if;
		if (compter = temps_vert) then
		--feu voiture 1 : orange
			led_vert1 <= '0';
			led_orange1 <= '1';
			led_rouge1<= '0';
			
			
		end if;
		if (compter  > temps_vert) then
			--Feu voiture 1 : rouge
			led_vert1 <= '0';
			led_orange1 <= '0';
			led_rouge1<= '1';
		--Feu pieton 1 : vert
			pieton_rouge1 <='0';
			pieton_vert1 <= '1';
		--Feu voiture 2 : vert
			led_vert2 <= '1';
			led_orange2 <= '0';
			led_rouge2<= '0';
		--Feu pieton 2 : rouge
			pieton_rouge2 <='1';
			pieton_vert2 <= '0';	

		end if;
		
		if (compter =temps_vert + temps_vert) then
		--Feu voiture 2 : orange
			led_vert2 <= '0';
			led_orange2 <= '1';
			led_rouge2<= '0';
		--Reinitialisation du compteur à 0 : on recommence la boucle
			compter :=0;	
		end if;
		--led_rouge <= Not(led_rouge);
	
	end if;
	end process;
	end rtl;