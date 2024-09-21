----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:20:51 10/23/2023 
-- Design Name: 
-- Module Name:    buffer - Behavioral 
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

entity tri_state_buffer is
port(
	input: in std_logic_vector(63 downto 0);
	output : out std_logic_vector(63 downto 0);
	output_ready: in std_logic
);
end tri_state_buffer;

architecture Behavioral of tri_state_buffer is

signal interim_output: std_logic_vector(63 downto 0);

begin


process(input,output_ready)

begin

	if(output_ready = '1') then
		interim_output <= input;
	else
		interim_output <= (others => 'Z');
	end if;
end process;

output <= interim_output;

end Behavioral;

