----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:10:35 11/22/2023 
-- Design Name: 
-- Module Name:    encryption_datapath - Behavioral 
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

entity encryption_datapath is
port(
	plaintext: in std_logic_vector (63 downto 0);
	cyphertext : out std_logic_vector(63 downto 0);
	subkey : in std_logic_vector(31 downto 0);
	s_box_addr : out std_logic_vector(31 downto 0);
	s_box1_val,s_box2_val,s_box3_val,s_box4_val: in std_logic_vector(31 downto 0);
	clk,clr,round_reg_en,round_mux_sel,pp_en_left,pp_en_right,output_ready: in std_logic
);
end encryption_datapath;

architecture Behavioral of encryption_datapath is

component round is
port(
	input: in std_logic_vector(63 downto 0);
	sub_key: in std_logic_vector(31 downto 0);
	s_box_addr: out std_logic_vector(31 downto 0);
	s_box1_val,s_box2_val,s_box3_val,s_box4_val: in std_logic_vector(31 downto 0);
	clk,clr,en,round_mux_select: in std_logic;
	left_side,right_side: out std_logic_vector(31 downto 0)
);
end component;


component post_processing is
port(
	right_input,left_input,sub_key: in std_logic_vector(31 downto 0);
	output: out std_logic_vector(63 downto 0);
	clk,clr,en_right,en_left, output_ready: in std_logic
);
end component;

signal round_left,round_right: std_logic_vector(31 downto 0);

begin


recurring_rounds: round port map(
		input => plaintext,
		sub_key => subkey,
		clk => clk,
		clr => clr,
		en => round_reg_en,
		round_mux_select => round_mux_sel,
		left_side => round_left,
		s_box_addr => s_box_addr,
		s_box1_val => s_box1_val,
		s_box2_val => s_box2_val,
		s_box3_val => s_box3_val,
		s_box4_val => s_box4_val,
		right_side => round_right
		
);

post_process: post_processing port map(
		right_input => round_right,
		left_input => round_left,
		sub_key => subkey,
		output => cyphertext,
		clk => clk,
		clr => clr,
		en_left => pp_en_left,
		en_right => pp_en_right,
		output_ready => output_ready
		
);

end Behavioral;

