----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:31:22 10/19/2023 
-- Design Name: 
-- Module Name:    combinational_shifter - Behavioral 
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

entity combinational_shifter is
port(
	
	
	key_size: in std_logic_vector(3 downto 0);
	input : in std_logic_vector(447 downto 0);
	output: out std_logic_vector(447 downto 0)
);

end combinational_shifter;

architecture Behavioral of combinational_shifter is





		


signal result: std_logic_vector(447 downto 0);



begin

with key_size select 
-----------key of 448 bits------------------
	result <= input(415 downto 0) & input(447 downto 416) when "1110",
				 
				 -----key of 416 bits-------
				 input(447 downto 416)& input(383 downto 0) & input(415 downto 384) when "1101",
				 
				 -------key of 384 bits--------
				 input(447 downto 384) & input(351 downto 0) & input(383 downto 352) when "1100",
				
				 -----------key of 352 bits----------
				 input(447 downto 352) & input(319 downto 0) & input(351 downto 320) when "1011",
				 
				 ----------key of 320 bits------------
				 input(447 downto 320) & input(287 downto 0) & input(319 downto 288) when "1010",
				 
				 -------key of 288 bits------------
				 input(447 downto 288) & input(255 downto 0) & input(287 downto 256) when "1001",
				 
				 ----------key of 256 bits----------
				 input(447 downto 256) & input(223 downto 0) & input(255 downto 224) when "1000",
				 
				 -----------key of 224 bits----------
				 input(447 downto 224) & input(191 downto 0) & input(223 downto 192) when "0111",
				 
				 ------------key of 192 bits-------------
				 input(447 downto 192) & input(159 downto 0)  & input(191 downto 160) when "0110",
				 
				 ------------key of 160 bits-------------
				 input(447 downto 160) & input(127 downto 0) & input(159 downto 128) when "0101",
				 
				 ------------key of 128 bits------------
				 input(447 downto 128) & input(95 downto 0) & input(127 downto 96) when "0100",
				 
				 -----------key of 96 bits-------------
				 input(447 downto 96) & input(63 downto 0) & input(95 downto 64) when "0011",
				 
				 ------------key of 64 bits-----------
				 input(447 downto 64) & input(31 downto 0) & input(63 downto 32) when "0010",				 

				 ------------key of 32 bits-------------
				 input(447 downto 0) when others;


output <= result;

end Behavioral;

