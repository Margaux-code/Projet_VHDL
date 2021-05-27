LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Feu_tricolore IS
		PORT ( clk, stby, test: IN STD_LOGIC;
r1,r2,o1,o2,v1,v2 : OUT STD_LOGIC) ;
END Feu_tricolore;

ARCHITECTURE behavior OF Feu_tricolore IS
	CONSTANT timeMAX : INTEGER := 2700;
	CONSTANT timeRG : INTEGER := 1800;
	CONSTANT timeRY : INTEGER := 300;
	CONSTANT timeGR : INTEGER := 2700;
	CONSTANT timeYR : INTEGER := 300;
	CONSTANT timeTEST : INTEGER := 60;
	
TYPE state IS (RG, RY, GR, YR, oo);
	SIGNAL pr_state, nx_state: state;
	SIGNAL time : INTEGER RANGE 0 TO timeMAX;
BEGIN

PROCESS (clk, stby)
VARIABLE count : INTEGER RANGE 0 TO timeMAX;
BEGIN
	IF (stby = '1') THEN
		pr_state <= oo;
		count := 0;
		ELSIF (clk'EVENT AND clk='1') THEN
		count := count + 1;
	IF (count = time) THEN
		pr_state <= nx_state;
		count := 0;
		END IF;
		END IF;
END PROCESS; 

PROCESS (pr_state, test)
BEGIN
CASE pr_state IS
	WHEN RG =>
	r1<='1';r2<='0';o1<='0';o2<='0';v1<='0';v2<='1';
	nx_state <= RY;
	IF (test='0') THEN
		time <= timeRG;
	ELSE
		time <= timeTEST;
	END IF;
	WHEN RY =>
	r1<='1'; r2<='0'; o1<='0'; o2<='1'; v1<='0'; v2<='0';
	nx_state <= GR;
	IF (test='0') THEN
		time <= timeRY;
	ELSE
		time <= timeTEST;
	END IF; 
	WHEN GR =>
	r1<='0'; r2<='1'; o1<='0'; o2<='0'; v1<='1'; v2<='0';
	nx_state <= YR;
	IF (test='0') THEN
		time <= timeGR;
	ELSE
		time <= timeTEST;
	END IF;
	WHEN YR =>
	r1<='0'; r2<='1'; o1<='1'; o2<='0'; v1<='0'; v2<='0';
	nx_state <= RG;
	IF (test='0') THEN
		time <= timeYR;
	ELSE
		time <= timeTEST;
	END IF;
	WHEN oo =>
	r1<='0'; r2<='0'; o1<='1'; o2<='1'; v1<='0'; v2<='0';
	nx_state <= RY;
	END CASE;
END PROCESS;
END behavior; 

