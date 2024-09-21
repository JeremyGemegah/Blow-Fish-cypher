----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:08:41 10/23/2023 
-- Design Name: 
-- Module Name:    f_function - Behavioral 
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

entity f_function is
port(
	s_box1_val,s_box2_val,s_box3_val,s_box4_val: in std_logic_vector(31 downto 0);
	
	output: out std_logic_vector(31 downto 0)
);
end f_function;

architecture Behavioral of f_function is



-----------------------------------------------------------------------------------
------------------------Signal Declaration-----------------------------------------





begin





output <= s_box4_val + (s_box3_val xor (s_box1_val + s_box2_val));


end Behavioral;

