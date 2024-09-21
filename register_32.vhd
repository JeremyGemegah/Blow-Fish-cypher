----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:12:49 10/23/2023 
-- Design Name: 
-- Module Name:    register_32 - Behavioral 
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

entity register_32 is
port(
	clk,clr,en: in std_logic;
	input: in std_logic_vector(31 downto 0);
	output: out std_logic_vector(31 downto 0)
);
end register_32;

architecture Behavioral of register_32 is

signal reg_val: std_logic_vector(31 downto 0);
begin

process(clk,clr,en)
	begin
		if(clr = '1') then
				reg_val <= (others => '0');

		elsif(en ='1') then
			if(rising_edge(clk)) then
				reg_val <= input;
			end if;
		end if;
	end process;

output <= reg_val;


end Behavioral;

