----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:14:03 10/28/2023 
-- Design Name: 
-- Module Name:    mode_register - Behavioral 
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

entity mode_register is
port(
	en,clk,input: in std_logic;
	mode: out std_logic
);
end mode_register;

architecture Behavioral of mode_register is
signal interim: std_logic := '1';

begin

process(clk,en)
	begin
		if rising_edge(clk) then
			if en = '1' then
				interim <= input;
			end if;
		end if;
	end process;
	
mode <= interim;
end Behavioral;

