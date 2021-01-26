library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity mux is
    Port ( w0 : in  STD_LOGIC_VECTOR (3 downto 0);
           w1 : in  STD_LOGIC_VECTOR (3 downto 0);
           w2 : in  STD_LOGIC_VECTOR (3 downto 0);
           w3 : in  STD_LOGIC_VECTOR (3 downto 0);
           s : in  STD_LOGIC_VECTOR (1 downto 0);
           f : out  STD_LOGIC_VECTOR (3 downto 0));
end mux;

architecture Behavioral of mux is

begin
     with s select
	        f <= w0 when "00",
			     w1 when "01",
				 w2 when "10",
				 w3 when OTHERS;
end Behavioral;
