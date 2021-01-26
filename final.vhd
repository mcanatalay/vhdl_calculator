library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity final is
 Port ( clk : in  STD_LOGIC;
           run : in  STD_LOGIC;
           step : in  STD_LOGIC;
           MOP : in  STD_LOGIC_VECTOR (3 DOWNTO 0);
           input_select : out  STD_LOGIC_VECTOR (1 DOWNTO 0);
           load_a : out  STD_LOGIC;
           load_b : out  STD_LOGIC;
           alu_op : out  STD_LOGIC_VECTOR (2 DOWNTO 0);
           cin : out  STD_LOGIC;
           reset : out  STD_LOGIC;
           out_state : out  STD_LOGIC_VECTOR (3 DOWNTO 0));
end final;

architecture Behavioral of final is
signal y_present, y_next : std_logic_vector (10 downto 0);
	constant s0 : std_logic_vector (10 downto 0) := "00000000001" ;
	constant s1 : std_logic_vector (10 downto 0) := "00000000010" ;
	constant s2 : std_logic_vector (10 downto 0) := "00000000100" ;
	constant s3 : std_logic_vector (10 downto 0) := "00000001000" ;
	constant s4 : std_logic_vector (10 downto 0) := "00000010000" ;
	constant s5 : std_logic_vector (10 downto 0) := "00000100000" ;
	constant s6 : std_logic_vector (10 downto 0) := "00001000000" ;
	constant s7 : std_logic_vector (10 downto 0) := "00010000000" ;
	constant s8 : std_logic_vector (10 downto 0) := "00100000000" ;
	constant s9 : std_logic_vector (10 downto 0) := "01000000000" ;
	constant s10 : std_logic_vector (10 downto 0) := "10000000000";

begin
	process (run, step, y_present)
	begin
	     case y_present is 
		    when s0 => 
		        if run='0' then y_next <= s0;
			   elsif run='1' and step='0' then y_next <= s1;
			   elsif run='1' and step='1' then y_next <= s4;
				
				
			   end if;
		    
		    when s1 =>
		         if run='0' then y_next <= s0;
			    elsif run='1' and step='0' then y_next <= s2;
			    elsif run='1' and step='1' then y_next <= s2;
				 end if;
				 
			    
		     when s2 =>
		         if run='0' then y_next <= s0;
			    elsif run='1' and step='0' then y_next <= s3;
			   elsif run='1' and step='1' then y_next <= s3;
				  end if;
		    
		     when s3 =>
		         if run='0' then y_next <= s0;
			    elsif run='1' and step='0' then y_next <= s10;
			   elsif run='1' and step='1' then y_next <= s10;
				end if;

               when s4 =>
		         if run='0' then y_next <= s0;
			    elsif run='1' and step='0' then y_next <= s5;
			   elsif run='1' and step='1' then y_next <= s5;
				end if;

		    when s5 => 
		        if run='0' then y_next <= s0;
			   elsif run='1' and step='0' then y_next <= s6;
			   elsif run='1' and step='1' then y_next <= s5;
				end if;

			when s6 =>
		         if run='0' then y_next <= s0;
			  elsif run='1' and step='0' then y_next <= s7;
			   elsif run='1' and step='1' then y_next <= s7;
				end if;
				

			when s7 => 
		        if run='0' then y_next <= s0;
			   elsif run='1' and step='0' then y_next <= s7;
			   elsif run='1' and step='1' then y_next <= s8;
				end if;
				

			when s8 =>
		         if run='0' then y_next <= s0;
			    elsif run='1' and step='0' then y_next <= s9;
			   elsif run='1' and step='1' then y_next <= s9;
				end if;

			when s9 => 
		        if run='0' then y_next <= s0;
			   elsif run='1' and step='0' then y_next <= s10;
			   elsif run='1' and step='1' then y_next <= s9;
				end if;
			
			when s10 =>
		         if run='0' then y_next <= s0;
			   elsif run='1' and step='0' then y_next <= s10;
			   elsif run='1' and step='1' then y_next <= s10;
				end if;

			when others =>
			     y_next <= s0;
			    
	     end case;
		end process;
		process (clk)
		begin
		   If (clk 'EVENT AND clk='1') then
		        y_present <= y_next;
			   end if;
           end process;
			  
			  process (y_present, MOP)
		begin
		 if y_present = s0 then 
		      if (MOP="0001") then
				out_state <= "0000";
				input_select <= "00";
				load_a <= '0';
				load_b <= '0';
				cin <= '0';
				alu_op <= "000";
				reset <= '0';
				
				else
				out_state <= "0000";
				input_select <= "00";
				load_a <= '0';
				load_b <= '0';
				cin <= '0';
				alu_op <= "000";
				reset <= '0';		 
				end if; 
		 	
		elsif y_present = s1 then  
		  	if (MOP="0111") then
				out_state <= "0001";
				input_select <= "01";
				load_a <= '0';
				load_b <= '1';
				cin <= '0';
				alu_op <= "001";
				reset <= '0';
				
				else
				out_state <= "0001";
				input_select <= "00";
				load_a <= '0';
				load_b <= '0';
				cin <= '0';
				alu_op <= "000";
				reset <= '0';
			    end if;
       
		elsif y_present = s2 then   
		     	if (MOP="0111") then
				out_state <= "0010";
				input_select <= "11";
				load_a <= '1';
				load_b <= '0';
				cin <= '0';
				alu_op <= "000";
				reset <= '0';
				else
				out_state <= "0010";
				input_select <= "00";
				load_a <= '0';
				load_b <= '0';
				cin <= '0';
				alu_op <= "000";
				reset <= '0';
			    end if;
       
		 elsif y_present = s3 then  
				
				if (MOP="0000") then
				out_state <= "0011";
				input_select <= "00";
				load_a <= '0';
				load_b <= '0';
				cin <= '0';
				alu_op <= "000";
				reset <= '0';
				
				elsif (MOP="0001") then
				out_state <= "0011";
            input_select <= "00";
            load_a <= '0';
            load_b <= '0';
				cin <= '0';
				alu_op <= "000";
	         reset <= '1';

				
				elsif (MOP="0010") then
				out_state <= "0011";
				
input_select <= "11";

				load_a <= '1';

				load_b <= '0';

				cin <= '0';

				alu_op <= "000";

				reset <= '0';

				
				elsif (MOP="0011") then
				out_state <= "0011";
				input_select <= "11";
				load_a <= '0';
				load_b <= '1';
				cin <= '0';
				alu_op <= "000";
				reset <= '0';
				
				elsif (MOP="0100") then
				out_state <= "0011";
				input_select <= "01";
				load_a <= '1';
				load_b <= '0';
				cin <= '0';
				alu_op <= "000";
				reset <= '0';
				
				elsif (MOP="0101") then
				out_state <= "0011";
				input_select <= "00";
				load_a <= '0';
				load_b <= '1';
				cin <= '0';
				alu_op <= "000";
				reset <= '0';
				
				elsif (MOP="0110") then
				out_state <= "0011";
				input_select <= "01";
				load_a <= '0';
				load_b <= '1';
				cin <= '0';
				alu_op <= "001";
				reset <= '0';
				
				elsif (MOP="0111") then
				out_state <= "0011";
				input_select <= "01";
				load_a <= '0';
				load_b <= '1';
				cin <= '0';
				alu_op <= "001";
				reset <= '0';
				
				elsif (MOP="1000") then
				out_state <= "0011";
				input_select <= "10";
				load_a <= '0';
				load_b <= '1';
				cin <= '1';
				alu_op <= "001";
				reset <= '0';
				
				elsif (MOP="1001") then
				out_state <= "0011";
				input_select <= "10";
				load_a <= '0';
				load_b <= '1';
				cin <= '0';
				alu_op <= "000";
				reset <= '0';
				
				elsif (MOP="1010") then
				out_state <= "0011";
				input_select <= "01";
				load_a <= '0';
				load_b <= '1';
				cin <= '0';
				alu_op <= "010";
				reset <= '0';
				
				elsif (MOP="1011") then
				out_state <= "0011";
				input_select <= "01";
				load_a <= '0';
				load_b <= '1';
				cin <= '0';
				alu_op <= "011";
				reset <= '0';
				
				elsif (MOP="1100") then
				out_state <= "0011";
				input_select <= "01";
				load_a <= '0';
				load_b <= '1';
				cin <= '0';
				alu_op <= "100";
				reset <= '0';
				
				elsif (MOP="1101") then
				out_state <= "0011";
				input_select <= "01";
				load_a <= '0';
				load_b <= '1';
				cin <= '0';
				alu_op <= "110";
				reset <= '0';
				
				elsif (MOP="1110") then
				out_state <= "0011";
				input_select <= "01";
				load_a <= '0';
				load_b <= '1';
				cin <= '0';
				alu_op <= "101";
				reset <= '0';
				
				elsif (MOP="1111") then
				out_state <= "0011";
				input_select <= "01";
				load_a <= '0';
				load_b <= '1';
				cin <= '0';
				alu_op <= "111";
				reset <= '0';
				
				 
			    end if; 
		 
		 elsif y_present = s4 then  
		  	if (MOP="0111") then
				out_state <= "0100";
				input_select <= "01";
				load_a <= '0';
				load_b <= '1';
				cin <= '0';
				alu_op <= "001";
				reset <= '0';
				
				else
				out_state <= "0100";
				input_select <= "00";
				load_a <= '0';
				load_b <= '0';
				cin <= '0';
				alu_op <= "000";
				reset <= '0';
			    end if;
       
		 elsif y_present = s5 then  
		      if (MOP="0001") then
				out_state <= "0101";
				input_select <= "00";
				load_a <= '0';
				load_b <= '0';
				cin <= '0';
				alu_op <= "000";
				reset <= '0';
			   end if;
       elsif y_present = s6 then   
		     	if (MOP="0111") then
				out_state <= "0110";
				input_select <= "11";
				load_a <= '1';
				load_b <= '0';
				cin <= '0';
				alu_op <= "000";
				reset <= '0';
				
				else
				out_state <= "0110";
				input_select <= "00";
				load_a <= '0';
				load_b <= '0';
				cin <= '0';
				alu_op <= "000";
				reset <= '0';
			    end if;
       
		 
		 elsif y_present = s7 then  
		      if (MOP="0001") then
				out_state <= "0111";
				input_select <= "00";
				load_a <= '0';
				load_b <= '0';
				cin <= '0';
				alu_op <= "000";
				reset <= '0';
			   end if; 
       
		 elsif y_present = s8 then  
		      
				if (MOP="0000") then
				out_state <= "1000";
				input_select <= "00";
				load_a <= '0';
				load_b <= '0';
				cin <= '0';
				alu_op <= "000";
				reset <= '0';
				
				elsif (MOP="0001") then
				out_state <= "1000";
	
				input_select <= "00";

				load_a <= '0';

				load_b <= '0';
				
cin <= '0';
				
alu_op <= "000";
	
				reset <= '1';

				
				elsif (MOP="0010") then
				out_state <= "1000";
				
input_select <= "11";

				load_a <= '1';

				load_b <= '0';

				cin <= '0';

				alu_op <= "000";

				reset <= '0';

				
				elsif (MOP="0011") then
				out_state <= "1000";
				input_select <= "11";
				load_a <= '0';
				load_b <= '1';
				cin <= '0';
				alu_op <= "000";
				reset <= '0';
				
				elsif (MOP="0100") then
				out_state <= "1000";
				input_select <= "01";
				load_a <= '1';
				load_b <= '0';
				cin <= '0';
				alu_op <= "000";
				reset <= '0';
				
				elsif (MOP="0101") then
				out_state <= "1000";
				input_select <= "00";
				load_a <= '0';
				load_b <= '1';
				cin <= '0';
				alu_op <= "000";
				reset <= '0';
				
				elsif (MOP="0110") then
				out_state <= "1000";
				input_select <= "01";
				load_a <= '0';
				load_b <= '1';
				cin <= '0';
				alu_op <= "001";
				reset <= '0';
				
				elsif (MOP="0111") then
				out_state <= "1000";
				input_select <= "01";
				load_a <= '0';
				load_b <= '1';
				cin <= '0';
				alu_op <= "001";
				reset <= '0';
				
				elsif (MOP="1000") then
				out_state <= "1000";
				input_select <= "10";
				load_a <= '0';
				load_b <= '1';
				cin <= '1';
				alu_op <= "001";
				reset <= '0';
				
				elsif (MOP="1001") then
				out_state <= "1000";
				input_select <= "10";
				load_a <= '0';
				load_b <= '1';
				cin <= '0';
				alu_op <= "000";
				reset <= '0';
				
				elsif (MOP="1010") then
				out_state <= "1000";
				input_select <= "01";
				load_a <= '0';
				load_b <= '1';
				cin <= '0';
				alu_op <= "010";
				reset <= '0';
				
				elsif (MOP="1011") then
				out_state <= "1000";
				input_select <= "01";
				load_a <= '0';
				load_b <= '1';
				cin <= '0';
				alu_op <= "011";
				reset <= '0';
				
				elsif (MOP="1100") then
				out_state <= "1000";
				input_select <= "01";
				load_a <= '0';
				load_b <= '1';
				cin <= '0';
				alu_op <= "100";
				reset <= '0';
				
				elsif (MOP="1101") then
				out_state <= "1000";
				input_select <= "01";
				load_a <= '0';
				load_b <= '1';
				cin <= '0';
				alu_op <= "110";
				reset <= '0';
				
				elsif (MOP="1110") then
				out_state <= "1000";
				input_select <= "01";
				load_a <= '0';
				load_b <= '1';
				cin <= '0';
				alu_op <= "101";
				reset <= '0';
				
				elsif (MOP="1111") then
				out_state <= "1000";
				input_select <= "01";
				load_a <= '0';
				load_b <= '1';
				cin <= '0';
				alu_op <= "111";
				reset <= '0';
				
				 
			    end if; 
       
		 elsif y_present = s9 then  
		      if (MOP="0001") then
				out_state <= "1001";
				input_select <= "00";
				load_a <= '0';
				load_b <= '0';
				cin <= '0';
				alu_op <= "000";
				reset <= '0';
			   end if; 

       
		 elsif y_present = s10 then  
		      if (MOP="0001") then
				out_state <= "1010";
				input_select <= "00";
				load_a <= '0';
				load_b <= '0';
				cin <= '0';
				alu_op <= "000";
				reset <= '0';
				else
				out_state <= "1010";
				input_select <= "00";
				load_a <= '0';
				load_b <= '0';
				cin <= '0';
				alu_op <= "000";
				reset <= '0';
			    end if;
		 
		 end if;
		 end process;
end Behavioral;
