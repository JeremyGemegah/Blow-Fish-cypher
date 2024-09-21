----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:49:12 10/22/2023 
-- Design Name: 
-- Module Name:    key_generator - Behavioral 
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

entity key_generator is
port(
	input_key: in std_logic_vector(447 downto  0);
	clk,clr,en,mux_select: in std_logic;
	pi_lsb: in std_logic_vector(31 downto 0); -- the instatial p-array element from the p-array
	round_key: out std_logic_vector(31 downto 0)
);
end key_generator;

architecture Behavioral of key_generator is

-----------------------------------------------------------------------------------
--------------------Component declarations---------------------------------------

component combinational_shifter is
port(
	key_size: in std_logic_vector(3 downto 0);
	input : in std_logic_vector(447 downto 0);
	output: out std_logic_vector(447 downto 0)
);

end component;



component register_448 is
port(
	input: in std_logic_vector(447 downto 0);
	output: out std_logic_vector(447 downto 0);
	clk,clr,en: in std_logic
);
end component;



component key_evaluator is
port(
	input: in std_logic_vector(447 downto 0);
	key_size: out integer range 0 to 14
);
end component;


component key_mux is
port(
line1,line2: in std_logic_vector(447 downto 0);
mux_select: in std_logic;
output: out std_logic_vector(447 downto 0)
);
end component;


-------------------------------------------------------------------------------
-------------------------Signal Declarations-----------------------------------
signal key_size: integer range 0 to 14;
signal key_size_vector: std_logic_vector(3 downto 0);
signal mux_output,key_reg_out, next_key: std_logic_vector(447 downto 0);
signal key_lsb: std_logic_vector(31 downto 0);


begin

key_size_vector <= std_logic_vector(to_unsigned(key_size,4));
evaluate_key : key_evaluator port map(
		input => input_key,
		key_size => key_size
);

key_multiplexer: key_mux port map(
		line1 => input_key,
		line2 => next_key,
		mux_select => mux_select,
		output => mux_output
		
);

key_register: register_448 port map(
		input => mux_output,
		output => key_reg_out,
		clk => clk,
		clr => clr,
		en => en
);

key_combinational_shifter: combinational_shifter port map(
		key_size => key_size_vector,
		input => key_reg_out,
		output => next_key
);




key_lsb<= key_reg_out(31 downto 0);
round_key <= key_lsb xor pi_lsb;

end Behavioral;

