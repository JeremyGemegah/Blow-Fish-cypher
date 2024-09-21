----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:42:00 10/27/2023 
-- Design Name: 
-- Module Name:    key_adjuster - Behavioral 
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

entity key_adjuster is
port(
	input_key:in std_logic_vector(447 downto 0);
	mode: in std_logic; -- mode is 1 for ecryption
	key_size: in std_logic_vector(3 downto 0);
	output_key: out std_logic_vector(447 downto 0)
);
end key_adjuster;

architecture Behavioral of key_adjuster is

signal interim_key: std_logic_vector(447 downto 0);

begin


process(mode, key_size, input_key)
	begin
		if(mode = '1') then
			interim_key <= input_key;
		else
			case to_integer(unsigned(key_size)) is
				when 1 =>
					interim_key <= input_key;
				when 2 =>
					interim_key <= input_key(447 downto 64) & input_key(31 downto 0) & input_key(63 downto 32);
				when 3 => 
					interim_key <= input_key(447 downto 96) & input_key(31 downto 0) & input_key(63 downto 32) & input_key(95 downto 64);
				when 4 =>
					interim_key <= input_key(447 downto 128) & input_key(95 downto 64) & input_key(127 downto 96) & input_key(31 downto 0) & input_key(63 downto 32);
				when 5 =>
					interim_key <= input_key(447 downto 160) & input_key(127 downto 96) & input_key(159 downto 128) & input_key(31 downto 0) & input_key(63 downto 32) & input_key(95 downto 64);
				when 6 => 
					interim_key <= input_key(447 downto 192) & input_key(31 downto 0)  & input_key(63 downto 32) & input_key(95 downto 64) & input_key(127 downto 96) & input_key(159 downto 128) & input_key(191 downto 160);
				when 7 => 
					interim_key <= input_key(447 downto 224) & input_key(159 downto 128) & input_key(191 downto 160) & input_key(223 downto 192) & input_key(31 downto 0) & input_key(63 downto 32) & input_key(95 downto 64) & input_key(127 downto 96);
				when 8 => 
					interim_key <= input_key(447 downto 256) & input_key(95 downto 64)  & input_key(127 downto 96) & input_key(159 downto 128) & input_key(191 downto 160) & input_key(223 downto 192) & input_key(255 downto 224) & input_key(31 downto 0) & input_key(63 downto 32);
				when 9 =>
					interim_key <= input_key(447 downto 288) & input_key(31 downto 0)  & input_key(63 downto 32) & input_key(95 downto 64) & input_key(127 downto 96) & input_key(159 downto 128) & input_key(191 downto 160) & input_key(223 downto 192) & input_key(255 downto 224) & input_key(287 downto 256);
				when 10 =>
					interim_key <= input_key(447 downto 320) & input_key(287 downto 256) & input_key(319 downto 288) & input_key(31 downto 0)  & input_key(63 downto 32) & input_key(95 downto 64) & input_key(127 downto 96) & input_key(159 downto 128) & input_key(191 downto 160) & input_key(223 downto 192) & input_key(255 downto 224);
				when 11 =>
					interim_key <= input_key(447 downto 352) & input_key(255 downto 224) & input_key(287 downto 256) & input_key(319 downto 288) & input_key(351 downto 320) & input_key(31 downto 0)  & input_key(63 downto 32) & input_key(95 downto 64) & input_key(127 downto 96) & input_key(159 downto 128) & input_key(191 downto 160) & input_key(223 downto 192);
				when 12 =>
					interim_key <= input_key(447 downto 384) & input_key(223 downto 192) & input_key(255 downto 224) & input_key(287 downto 256) & input_key(319 downto 288) & input_key(351 downto 320) & input_key(383 downto 352) & input_key(31 downto 0)  & input_key(63 downto 32) & input_key(95 downto 64) & input_key(127 downto 96) & input_key(159 downto 128) & input_key(191 downto 160);
				when 13 => 
					interim_key <= input_key(447 downto 416) & input_key(191 downto 160) & input_key(223 downto 192) & input_key(255 downto 224) & input_key(287 downto 256) & input_key(319 downto 288) & input_key(351 downto 320) & input_key(383 downto 352) & input_key(415 downto 384) & input_key(31 downto 0)  & input_key(63 downto 32) & input_key(95 downto 64) & input_key(127 downto 96) & input_key(159 downto 128);
				when others =>
					interim_key <=  input_key(159 downto 128) & input_key(191 downto 160) & input_key(223 downto 192) & input_key(255 downto 224) & input_key(287 downto 256) & input_key(319 downto 288) & input_key(351 downto 320) & input_key(383 downto 352) & input_key(415 downto 384) & input_key(447 downto 416) & input_key(31 downto 0)  & input_key(63 downto 32) & input_key(95 downto 64) & input_key(127 downto 96);
				end case;
		end if;
		
	end process;

output_key <= interim_key;

end Behavioral;

