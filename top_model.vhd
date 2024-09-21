----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:25:48 10/28/2023 
-- Design Name: 
-- Module Name:    top_model - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_model is
port(
	clk,start_exp, decrypt, user_encrypt : in std_logic;
	cyphertext: out std_logic_vector(63 downto 0);
	input_key: in std_logic_vector(447 downto 0);
	user_plaintext: in std_logic_vector(63 downto 0)
);
end top_model;

architecture Behavioral of top_model is

-------------------------------Declaring Components------------------------------

component datapath1 is
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
end component;

component c_unit is
port(
	clk,start_exp, decrypt, user_encrypt: in std_logic; --start_exp signals the unit to start key expansion
	box_input_mux_sel,plaintext_mux: out std_logic_vector(1 downto 0);
	s_box_addr: out integer; --p_cyp_addr is the address input for the p box when we are doing either encryption or decryption
	p_addr: out std_logic_vector(8 downto 0);
	key_reg_en,key_mux_sel,s_box_addr_sel,p_we,s1_we,s2_we,s3_we,s4_we,p_re,round_reg_en,round_mux,pp_right,pp_left, state_en: out std_logic
);
end component;


------------------------------Signals------------------------------------------------

signal state,key_reg_en,key_mux_sel,s_box_addr_sel,p_we,s1_we,s2_we,s3_we,s4_we,p_re,round_reg_en,round_mux,pp_right,pp_left: std_logic;
signal s_box_addr: integer;
signal p_addr: std_logic_vector(8 downto 0);
signal box_input_mux_sel,plaintext_mux: std_logic_vector(1 downto 0);

begin

my_datapath: datapath1 port map(
	clk => clk,
	round_reg_en => round_reg_en,
	round_mux => round_mux,
	pp_left => pp_left,
	pp_right => pp_right,
	state => state,
	p_we => p_we,
	s1_we => s1_we,
	s2_we => s2_we,
	s3_we => s3_we,
	s4_we => s4_we,
	p_re => p_re,
	s1_re => '0',
	s2_re => '0',
	s3_re => '0',
	s4_re => '0',
	key_reg_en => key_reg_en,
	key_mux_sel => key_mux_sel,
	plaintext_mux => plaintext_mux,
	input_mux => box_input_mux_sel,
	user_plaintext => user_plaintext,
	s_box_addr => s_box_addr,
	p_addr => p_addr,
	input_key => input_key,
	cyphertext => cyphertext
);

my_control_unit: c_unit port map(
	clk => clk,
	start_exp => start_exp,
	decrypt => decrypt,
	user_encrypt => user_encrypt,
	box_input_mux_sel => box_input_mux_sel,
	plaintext_mux => plaintext_mux, 
	s_box_addr => s_box_addr,
	p_addr => p_addr,
	key_reg_en => key_reg_en,
	key_mux_sel => key_mux_sel,
	s_box_addr_sel => s_box_addr_sel,
	p_we => p_we,
	s1_we => s1_we,
	s2_we => s2_we,
	s3_we => s3_we,
	s4_we => s4_we,
	p_re => p_re,
	round_reg_en => round_reg_en,
	round_mux => round_mux,
	pp_right => pp_right,
	state_en => state,
	pp_left => pp_left

);


end Behavioral;

