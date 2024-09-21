----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:21:23 11/20/2023 
-- Design Name: 
-- Module Name:    c_unit - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
	use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity c_unit is
port(
	clk,start_exp, decrypt, user_encrypt: in std_logic; --start_exp signals the unit to start key expansion
	box_input_mux_sel,plaintext_mux: out std_logic_vector(1 downto 0);
	s_box_addr: out integer; --p_cyp_addr is the address input for the p box when we are doing either encryption or decryption
	p_addr: out std_logic_vector(8 downto 0);
	key_reg_en,key_mux_sel,s_box_addr_sel,p_we,s1_we,s2_we,s3_we,s4_we,p_re,round_reg_en,round_mux,pp_right,pp_left,state_en: out std_logic
);
end c_unit;

architecture Behavioral of c_unit is

type state is (idle,st0,st1,st2,st3,st4,st5,st6,st7,st8,st9); 
signal initialize,prev: state := idle; --states for key and sbox expansion, prev is the current state and initialize is the next state : imptomtu naming
signal encrypt,en_prev: state := idle;	--states for encryption, en_prev is the current state and encrypt is the next state : again, impromtu naming
signal s_key_reg_en,s_key_mux_sel,s_s_box_addr_sel,s_p_we,s_s1_we,s_s2_we,s_s3_we,s_s4_we,s_p_addr_sel,s_round_reg_en,s_round_mux,s_pp_right,s_pp_left: std_logic;
signal s_box_input_mux_sel,s_plaintext_mux: std_logic_vector(1 downto 0);
signal subkey_gen_count: integer :=0; -- signal for counting the number of subkeys that have been generated and the address for subkeys during subkey generation and expansion
signal encrypt_count : integer := 0; -- signal for counting the number of encryptions that are done during the key expansion
signal mux_count: integer := 0; -- signal for selecting the side of the intemidiary cypher text that should be stored
signal ex_addr_count: integer := 0; -- specifies the address input for the s boxes during key expansion
signal round_count: integer := 0;
signal p_enc_addr_count : integer := 0;
signal p_dec_addr_count : integer := 17;
--signal count,count2,count3: std_logic_vector(7 downto 0);
signal start_encrypt,encrypt_done, allow_decrypt: std_logic := '0';
signal mysig: std_logic_vector(1 downto 0);
signal mysig1: std_logic_vector(2 downto 0);
signal start_encrypt_by_user: std_logic;
signal p_cyp_addr,p_exp_addr: integer := 0;
signal s_state,s_p_re: std_logic;
signal s_my_p_addr: integer range 0 to 17:=0;

begin
--count <= std_logic_vector(to_unsigned(p_enc_addr_count,8));
--count2 <= std_logic_vector(to_unsigned(mux_count,8));
--count3 <= std_logic_vector(to_unsigned(p_cyp_addr,8));

key_reg_en <= s_key_reg_en;
key_mux_sel <= s_key_mux_sel;
s_box_addr_sel <= s_s_box_addr_sel;
p_we <= s_p_we;
s1_we <= s_s1_we;
s2_we <= s_s2_we;
s3_we <= s_s3_we;
s4_we <= s_s4_we;
box_input_mux_sel <= s_box_input_mux_sel;
--p_addr_sel <= s_p_addr_sel;
round_reg_en <= s_round_reg_en;
round_mux <= s_round_mux;
pp_left <= s_pp_left;
pp_right <= s_pp_right; 
s_box_addr <= ex_addr_count;
p_exp_addr <= subkey_gen_count;
plaintext_mux <= s_plaintext_mux; -- 00 is all zero plaintext, 01 is intermidiary cyphertext and 10 is user plaintext
state_en <= s_state; -- 1 when i am doing encryption
p_re <= s_p_re;

	mysig <= allow_decrypt & decrypt;
	with mysig select
		p_cyp_addr <= p_dec_addr_count when "11",
						  p_enc_addr_count when others;
						  
	mysig1 <= allow_decrypt & decrypt & user_encrypt;
	
	with mysig1 select
		start_encrypt_by_user <= '1' when "110",
										'1' when "101",
										'0' when others;
										
	with s_p_addr_sel select
		s_my_p_addr <= p_exp_addr when '1',
					 p_cyp_addr when others;
					 
p_addr <= std_logic_vector(to_unsigned(s_my_p_addr,9));

process(clk,initialize)
begin
if rising_edge(clk) then
	
	prev <= initialize;
	en_prev <= encrypt;
end if;
end process;


counters: process(clk)
begin
if rising_edge(clk) then
	
		case prev is
		when st1 =>
			subkey_gen_count <= 0;
			mux_count <= 0;
			encrypt_count <= 0;
		when st3 =>
			if encrypt_done = '1' then
				encrypt_count <= encrypt_count + 1;
			end if;
			
			if mux_count > 1 then
				mux_count <= 0;
			end if;
			
		when st2 =>
			subkey_gen_count <= subkey_gen_count + 1;
			if subkey_gen_count = 17 then
				
				subkey_gen_count <= 0;
				end if;
		
		when st4 =>
			mux_count <= mux_count + 1;
			subkey_gen_count <= subkey_gen_count + 1;

			

			if subkey_gen_count = 17 then
				subkey_gen_count <= 0;
				end if;
			
		when st5 | st6 | st7 | st8 =>
			ex_addr_count <= ex_addr_count + 1;
			mux_count <= mux_count + 1;

			if ex_addr_count = 255 then
				ex_addr_count <= 0;
			end if;
	when others =>
		
	end case;
	
	case en_prev is
		when idle =>
			p_enc_addr_count <= 0;
			p_dec_addr_count <= 17;
		when st1 =>
			--p_enc_addr_count <= p_enc_addr_count + 1;
			--p_dec_addr_count <= p_dec_addr_count - 1;
			--round_count <= round_count + 1;
		when st2 =>
			p_enc_addr_count <= p_enc_addr_count + 1;
			p_dec_addr_count <= p_dec_addr_count - 1;
			
		when st3 =>
			p_enc_addr_count <= p_enc_addr_count + 1;
			p_dec_addr_count <= p_dec_addr_count - 1;
			
			if p_enc_addr_count = 17 then
				p_enc_addr_count <= 0;
			end if;
		when st5 =>
			round_count <= round_count + 1 ;
			p_enc_addr_count <= p_enc_addr_count + 1;
			p_dec_addr_count <= p_dec_addr_count - 1;

		when others =>
			round_count <= 0;
	end case;
	
end if;
end process;


initialization: process(prev,start_exp,subkey_gen_count,mux_count,encrypt_done,encrypt_count)
	
	
	begin
	

		
			s_key_reg_en <= '0';
			s_key_mux_sel <= '1';
			s_box_input_mux_sel <= "00";
			s_s_box_addr_sel <= '0';
			s_p_we <= '0';
			s_s1_we <= '0';
			s_s2_we <= '0';
			s_s3_we <= '0';
			s_s4_we <= '0';
			s_p_addr_sel <= '0';
			start_encrypt <= '0';
			allow_decrypt <= '0';
			s_plaintext_mux <= "01";
			s_state <= '0';
			s_p_re <= '0';
			
			case prev is 
				when idle =>
				s_plaintext_mux <= "10";
				--s_p_addr_sel <= '1';
				allow_decrypt <= '1';
				s_state <= '1';

				if start_exp = '1' then
					initialize <= st0;
				else 
					initialize <= idle;
				end if;



					
				when st0 => 
					initialize <= st1;
					s_key_reg_en <= '1';
					s_key_mux_sel <= '0';
					s_p_addr_sel <= '1';
					s_p_re <= '1';
					
					
				when st1 =>
					initialize <= st2;
					s_p_addr_sel <= '1';
					s_key_reg_en <= '1';
					
				when st2 => 
				
					
					if subkey_gen_count < 17 then
						initialize <= st2;
					else
						initialize <= st3;
					end if;
					
					s_key_reg_en <= '1';
					s_p_addr_sel <= '1';
					s_p_we <= '1';
					

				when st3 =>
					s_state <= '1';
					if encrypt_count = 0 then
						s_plaintext_mux <= "00";
					end if;
					start_encrypt <= '1';
					
					if encrypt_done = '1' then
					
					start_encrypt <= '0';
						if encrypt_count < 9 then
							initialize <= st4;
						elsif encrypt_count < 137 then
							initialize <= st5;
						elsif encrypt_count < 265 then
							initialize <= st6;
						elsif encrypt_count < 393 then
							initialize <= st7;
						elsif encrypt_count < 521 then
							initialize <= st8;
						else
							initialize <= st9;
							
						end if;
					else
						initialize <= st3;
				end if;
					
					
					
				when st4 =>

					if mux_count = 0 then
						initialize <= st4;
						s_box_input_mux_sel <= "01";
					elsif mux_count = 1 then
						initialize <= st3;
						s_box_input_mux_sel <= "10";
						

					end if;

					

					s_p_addr_sel <= '1';
					s_p_we <= '1';
					
				when st5 =>
				
					if mux_count = 0 then
						initialize <= st5;
						s_box_input_mux_sel <= "01";
					elsif mux_count = 1 then
						initialize <= st3;
						s_box_input_mux_sel <= "10";
						

					end if;
					
					

					

					s_s_box_addr_sel <= '1';
					s_s1_we <= '1';
	
					
				when st6 =>
				
					if mux_count = 0 then
						initialize <= st6;
						s_box_input_mux_sel <= "01";
					elsif mux_count = 1 then
						initialize <= st3;
						s_box_input_mux_sel <= "10";
						

					end if;
				

					

					s_s_box_addr_sel <= '1';
					s_s2_we <= '1';	
					
				when st7 =>
				
					if mux_count = 0 then
						initialize <= st7;
						s_box_input_mux_sel <= "01";
					elsif mux_count = 1 then
						initialize <= st3;
						s_box_input_mux_sel <= "10";
						

					end if;
				

					
					s_s_box_addr_sel <= '1';
					s_s3_we <= '1';	
					
				when st8 =>
				
					if mux_count = 0 then
						initialize <= st8;
						s_box_input_mux_sel <= "01";
					elsif mux_count = 1 then
						initialize <= st3;
						s_box_input_mux_sel <= "10";
						

					end if;
				
				

					
					s_s_box_addr_sel <= '1';
					s_s4_we <= '1';
					
				when st9 =>
					if start_exp = '1' then
						initialize <= st9;
					else
						initialize <= idle;
					end if;
	
				when others => 
				
				 initialize <= idle;
				end case;
			
	
	end process;


encryption_decryption: process(clk,en_prev,start_encrypt, round_count,start_encrypt_by_user)
	begin
	
	encrypt_done <= '0';
	s_round_reg_en <= '0';
	s_round_mux <= '1';
	s_pp_left <= '0';
	s_pp_right <= '0';
		case en_prev is
		when idle =>
		
		if(start_encrypt = '1' or start_encrypt_by_user = '1')  then
			encrypt <= st0;
			
		else
			encrypt <= idle;
		end if;
		when st0 =>
			encrypt <= st1;
			s_round_mux <= '0';
			s_round_reg_en <= '1';
		when st1 => 
			encrypt <= st5;
			--s_round_reg_en <= '1';

		when st5 =>
			s_round_reg_en <= '1';
			if round_count < 15 then
				encrypt <= st1;
				

			else
				encrypt <= st2;
			end if;
			
		when st2 =>
			encrypt <= st3; -- right post-processing
			s_pp_right <= '1';
		when st3 =>   -- left post-processing
			encrypt <= st4;
			s_pp_left <= '1';
		when others =>
			encrypt_done <= '1';
			if start_encrypt_by_user = '0' then
				encrypt <= idle;
			else
				encrypt <= st4;
			end if;
		end case;
	

	end process;
	



end Behavioral;

