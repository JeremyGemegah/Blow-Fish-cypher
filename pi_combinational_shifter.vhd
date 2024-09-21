----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:33:39 10/22/2023 
-- Design Name: 
-- Module Name:    pi_combinational_shifter - Behavioral 
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

entity pi_combinational_shifter is
    port(
	input : in std_logic_vector(575 downto 0);
	direction: in std_logic;
	output: out std_logic_vector(575 downto 0)
);
end pi_combinational_shifter;

architecture Behavioral of pi_combinational_shifter is

    signal result: std_logic_vector(575 downto 0);
	
begin

with direction select 
    result <= input(543 downto 0) & input(575 downto 544) when '1',
              input(31 downto 0) & input(575 downto 32) when others;

output <= result;

end Behavioral;

