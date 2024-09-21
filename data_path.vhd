----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:11:58 10/23/2023 
-- Design Name: 
-- Module Name:    data_path - Behavioral 
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

entity data_path is
port(
 
 plaintext: in std_logic_vector(63 downto 0);
 input_key: in std_logic_vector(447 downto 0);
 key_reg_en,mode_reg_en,mode_reg_val,clk,clr,key_mux_select,pi_preset,round_reg_en,round_mux_select,output_ready,pp_en_left,pp_en_right: in std_logic;
 cyphertext: out std_logic_vector(63 downto 0)
);
end data_path;

architecture Behavioral of data_path is

--------------------------------------------------------------------------------------------
-----------------------------Component Decalaration-----------------------------------------

component key_generator is
port(
	input_key: in std_logic_vector(447 downto  0);
	clk,clr,en,mode,mux_select,pi_preset: in std_logic;
	round_key: out std_logic_vector(31 downto 0)
);
end component;

component round is
port(
	input: in std_logic_vector(63 downto 0);
	sub_key: in std_logic_vector(31 downto 0);
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

component mode_register is
port(
	en,clk,input: in std_logic;
	mode: out std_logic
);
end component;

-------------------------------------------------------------------------------------
------------------Signal Declarations------------------------------------------------

signal round_key,round_left, round_right: std_logic_vector(31 downto 0);
signal mode: std_logic;

begin

--mode register

store_mode: mode_register port map(
		en => mode_reg_en,
		clk => clk,
		input => mode_reg_val,
		mode => mode
);

generating_keys: key_generator port map(
		input_key => input_key,-- x"f912b226458d842b9f0a10da0efd032da6e461b67b8d086418dabe43780d464269e17b2d14f4dfe3dac5eca1d4b1c15df5c26d4f6abd433d",
		clk => clk,
		clr => clr,
		en => key_reg_en,
		mode => mode,
		mux_select => key_mux_select,
		pi_preset => pi_preset,
		round_key => round_key
);

recurring_rounds: round port map(
		input => plaintext,
		sub_key => round_key,
		clk => clk,
		clr => clr,
		en => round_reg_en,
		round_mux_select => round_mux_select,
		left_side => round_left,
		right_side => round_right
		
);

post_process: post_processing port map(
		right_input => round_right,
		left_input => round_left,
		sub_key => round_key,
		output => cyphertext,
		clk => clk,
		clr => clr,
		en_left => pp_en_left,
		en_right => pp_en_right,
		output_ready => output_ready
		
);


end Behavioral;

