----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:01:47 10/23/2023 
-- Design Name: 
-- Module Name:    round - Behavioral 
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

entity round is
port(
	input: in std_logic_vector(63 downto 0);
	sub_key: in std_logic_vector(31 downto 0);
	s_box_addr: out std_logic_vector(31 downto 0);
	s_box1_val,s_box2_val,s_box3_val,s_box4_val: in std_logic_vector(31 downto 0);
	clk,clr,en,round_mux_select: in std_logic;
	left_side,right_side: out std_logic_vector(31 downto 0)
);
end round;

architecture Behavioral of round is

component f_function is
port(
	s_box1_val,s_box2_val,s_box3_val,s_box4_val: in std_logic_vector(31 downto 0);
	
	output: out std_logic_vector(31 downto 0)
);
end component;

component register_32 is
port(
	input: in std_logic_vector(31 downto 0);
	clk,clr,en: in std_logic;
	output: out std_logic_vector(31 downto 0)
);
end component;


-----------------------------------------------------------------
-----------------Signal Declaration------------------------------

signal left_mux_out,right_mux_out,left_result,right_result,right_reg_out,left_reg_out,substitute_value: std_logic_vector(31 downto 0);

begin


-------------------------------------------------------------------
---------------left multiplexer-----------------------------------

with round_mux_select select
	left_mux_out <= input(63 downto 32) when '0', ---select left side of plaintext
					  right_result when others;
					 
---------------------------------------------------------------------
-----------------Right multiplexeer----------------------------------

with round_mux_select select
	right_mux_out <= input(31 downto 0) when '0', --select right side of plaintext
					   left_result when others;
					  
					  
----------------------------------------------------------------------
------------------Left register---------------------------------------

left_register: register_32 port map(
	input => left_mux_out,
	output => left_reg_out,
	en => en,
	clk => clk,
	clr => clr
);

-----------------------------------------------------------------------
--------------------Right register-------------------------------------

right_register: register_32 port map(
	input => right_mux_out,
	output => right_reg_out,
	en => en,
	clk => clk,
	clr => clr
);


the_f_function: f_function port map(
	s_box1_val => s_box1_val,
	s_box2_val => s_box2_val,
	s_box3_val => s_box3_val,
	s_box4_val => s_box4_val,
	output => substitute_value
);

left_result <= left_reg_out xor sub_key;
right_result <= substitute_value xor right_reg_out;

left_side <= right_reg_out;
right_side <= left_result;
s_box_addr <= left_result;
end Behavioral;

