----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:53:01 11/22/2023 
-- Design Name: 
-- Module Name:    datapath1 - Behavioral 
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

entity datapath1 is
port(
	clk,round_reg_en,round_mux,pp_left,pp_right,state: in std_logic;
	p_we,s1_we,s2_we,s3_we,s4_we,p_re,s1_re,s2_re,s3_re,s4_re, key_reg_en,key_mux_sel: in std_logic;
	plaintext_mux,input_mux: in std_logic_vector(1 downto 0);
	user_plaintext: in std_logic_vector(63 downto 0);
	s_box_addr: in integer;
	p_addr: in std_logic_vector(8 downto 0);
	input_key: in std_logic_vector(447 downto 0);
	cyphertext : out std_logic_vector(63 downto 0)
);
end datapath1;

architecture Behavioral of datapath1 is

------------------------Declaration of components------------------------------------------


component database is
port(
	inter_cypher: in std_logic_vector(63 downto 0);
	clk,p_we,s1_we,s2_we,s3_we,s4_we,s1_re,s2_re,s3_re,s4_re,p_re,state: in std_logic; --- state is 1 for encryption or decryption and 0 for key and sbox expansion
	input_mux: in std_logic_vector(1 downto 0);
	P_expander_input: in std_logic_vector(31 downto 0);
	database_counter: in integer;
	address: in std_logic_vector(31 downto 0);
	p_address: in std_logic_vector(8 downto 0);
	p_out,sbox1_out,sbox2_out,sbox3_out,sbox4_out: out std_logic_vector(31 downto 0)
	
);
end component;

component encryption_datapath is
port(
	plaintext: in std_logic_vector (63 downto 0);
	cyphertext : out std_logic_vector(63 downto 0);
	subkey : in std_logic_vector(31 downto 0);
	s_box_addr: out std_logic_vector(31 downto 0);
	s_box1_val,s_box2_val,s_box3_val,s_box4_val: in std_logic_vector(31 downto 0);
	clk,clr,round_reg_en,round_mux_sel,pp_en_left,pp_en_right,output_ready: in std_logic
);
end component;


component key_expansion is
port(
	input_key: in std_logic_vector(447 downto  0);
	clk,clr,en,mux_select: in std_logic;
	pi_lsb: in std_logic_vector(31 downto 0); -- the instatial p-array element from the p-array
	round_key: out std_logic_vector(31 downto 0)
);
end component;

---------------------------Signals --------------------------------------------

signal all_zero_plaintext,intermediary_cypher,plaintext: std_logic_vector(63 downto 0);
signal s_box_addr_enc,s_box1_val,s_box2_val,s_box3_val,s_box4_val: std_logic_vector(31 downto 0);
signal p_expander_input, p_out: std_logic_vector(31 downto 0);



begin



all_zero_plaintext <= ( others => '0');

--multiplex plaintext
with plaintext_mux select
	plaintext <= all_zero_plaintext when "00",
				 intermediary_cypher when "01",
				 user_plaintext when others;

expand_key: key_expansion port map(
	input_key => input_key,--x"000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffff",
	pi_lsb => p_out,
	round_key => p_expander_input,
	clk => clk,
	en => key_reg_en,
	mux_select => key_mux_sel,
	clr => '0' -----i would'nt need to clear the register
);

encrypt_and_decrypt: encryption_datapath port map(
	plaintext => plaintext,
	cyphertext => intermediary_cypher,
	subkey => p_out,
	clk	 => clk,
	clr	 => '0', ----------------- the clear signal is actually not needed so i just set it to a constant 0
	round_reg_en => round_reg_en,
	round_mux_sel => round_mux,
	pp_en_left	=> pp_left,
	pp_en_right => pp_right,
	s_box_addr => s_box_addr_enc,
	s_box1_val => s_box1_val,
	s_box2_val => s_box2_val,
	s_box3_val => s_box3_val,
	s_box4_val => s_box4_val,
	output_ready => '1' -----------------for testing sake i will always display the output
);

store_data: database port map(
	inter_cypher => intermediary_cypher,
	input_mux => input_mux,
	p_expander_input => p_expander_input,
	database_counter => s_box_addr,
	address => s_box_addr_enc,
	p_address => p_addr,
	p_out => p_out,
	sbox1_out => s_box1_val,
	sbox2_out => s_box2_val,
	sbox3_out => s_box3_val,
	sbox4_out => s_box4_val,
	p_we => p_we,
	s1_we => s1_we,
	s2_we => s2_we,
	s3_we => s3_we,
	s4_we => s4_we,
	s1_re => s1_re,
	s2_re => s2_re,
	s3_re => s3_re,
	s4_re => s4_re,
	p_re =>  p_re,
	state => state,
	clk => clk
);

cyphertext <= intermediary_cypher;

end Behavioral;

