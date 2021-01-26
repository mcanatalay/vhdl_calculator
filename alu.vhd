library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity alu is
    Port ( alu_op : in  STD_LOGIC_VECTOR (2 DOWNTO 0);
           x : in  STD_LOGIC_VECTOR (3 DOWNTO 0);
           y : in  STD_LOGIC_VECTOR (3 DOWNTO 0);
           cin : in  STD_LOGIC;
           alu_out : out  STD_LOGIC_VECTOR (3 DOWNTO 0));
end alu;

architecture Behavioral of alu is

begin
    process (alu_op, x, y, cin)
	       begin
			     case alu_op is
				      when "000" =>
						  alu_out <= x;
						  
						 when "001" =>
						  alu_out <= x + y + cin ;
						 
						 when "010" =>
						  alu_out <= x and y;
						  
						  when "011" =>
						   alu_out <= x or y;
						  
						  when "100" =>
						   alu_out <= x xor y;
							
						  when "110" =>
						   alu_out(3) <= '0' ;
							alu_out(2) <= x(3);
							alu_out(1) <= x(2);
							alu_out(0) <= x(1);
						  
						  when "101" =>
						   alu_out(3) <= x(2);
							alu_out(2) <= x(1);
							alu_out(1) <= x(0);
							alu_out(0) <= '0';
						  
						  when OTHERS =>
						   alu_out(3) <= x(3);
							alu_out(2) <= x(3);
							alu_out(1) <= x(2);
							alu_out(0) <= x(1);
						
					  end case;
				end process;
						  


end Behavioral;
