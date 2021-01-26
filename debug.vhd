library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity debug is
    Port ( a : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           b : in  STD_LOGIC_VECTOR(3 DOWNTO 0);
           s : in  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR(3 DOWNTO 0));
end debug;

architecture Behavioral of debug is
begin
     WITH s SELECT
	         z <= a when '0',
				  b when others;
end Behavioral;
