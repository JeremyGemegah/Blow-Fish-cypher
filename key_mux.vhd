----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:56:16 10/27/2023 
-- Design Name: 
-- Module Name:    key_mux - Behavioral 
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

entity key_mux is
port(
line1,line2: in std_logic_vector(447 downto 0);
mux_select: in std_logic;
output: out std_logic_vector(447 downto 0)
);
end key_mux;

architecture Behavioral of key_mux is

begin

with mux_select select
	output <= line1 when '0',
				line2 when others;



end Behavioral;

