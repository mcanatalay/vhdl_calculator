library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity registera is
    Port ( d : in  STD_LOGIC_VECTOR (3 DOWNTO 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           load : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (3 DOWNTO 0));
end registera;

architecture Behavioral of registera is

begin
     PROCESS (clk,reset,load)
	     begin
		       if clk'event and clk ='1' then
				    if reset='1' then
					 q <= "0000";
					 elsif load='1' then
					 q <= d;
					 end if;
				end if;
			end process;
end Behavioral;
