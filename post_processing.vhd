----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:14:25 10/23/2023 
-- Design Name: 
-- Module Name:    post_processing - Behavioral 
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

entity post_processing is
port(
	right_input,left_input,sub_key: in std_logic_vector(31 downto 0);
	output: out std_logic_vector(63 downto 0);
	clk,clr,en_right,en_left, output_ready: in std_logic
);
end post_processing;

architecture Behavioral of post_processing is

component register_32 is
port(
	clk,clr,en: in std_logic;
	input: in std_logic_vector(31 downto 0);
	output: out std_logic_vector(31 downto 0)
);
end component;

component tri_state_buffer is
port(
	input: in std_logic_vector(63 downto 0);
	output : out std_logic_vector(63 downto 0);
	output_ready: in std_logic
);
end component;


------------------------------------------------------------------------
-------------------Signal declarations---------------------------------

signal left,left_side,right_side: std_logic_vector(31 downto 0);
signal cyphertext: std_logic_vector(63 downto 0);


begin

left_register: register_32 port map(
	clk => clk,
	clr => clr,
	en => en_left,
	input => left,
	output => left_side
);


right_register: register_32 port map(
	clk => clk,
	clr => clr,
	en => en_right,
	input => right_input,
	output => right_side
);

cyphertext <= left_side & right_side;

my_buffer: tri_state_buffer port map(
	input => cyphertext,
	output_ready => output_ready,
	output => output
	
);

left <= left_input xor sub_key;

end Behavioral;

