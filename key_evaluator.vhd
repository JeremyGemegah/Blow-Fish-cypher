----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:39:01 10/23/2023 
-- Design Name: 
-- Module Name:    key_evaluator - Behavioral 
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

entity key_evaluator is
port(
	input: in std_logic_vector(447 downto 0);
	key_size: out integer range 0 to 14
);
end key_evaluator;

architecture Behavioral of key_evaluator is

function	check_for_one( value: std_logic_vector ) return boolean is
	variable compare: std_logic_vector( (value'length-1) downto 0) :=  (others => '0');
	variable res: boolean;
	begin
		
		if(value = compare) then
			res := false;
		else
			res := true;
		end if;
		return res;
end function;

function find_key_size( input: std_logic_vector(447 downto 0)) return integer is
	variable pos: integer;
	begin
		if(check_for_one(input(447 downto 416))) then
			pos := 14;
		elsif(check_for_one(input(415 downto 384))) then
			pos := 13;
		elsif(check_for_one(input(383 downto 352))) then
			pos := 12;
		elsif(check_for_one(input(351 downto 320))) then
			pos := 11;
		elsif(check_for_one(input(319 downto 288))) then
			pos := 10;
		elsif(check_for_one(input(287 downto 256))) then
			pos := 9;
		elsif(check_for_one(input(255 downto 224))) then
			pos := 8;
		elsif(check_for_one(input(223 downto 192))) then
			 pos := 7;
		elsif(check_for_one(input(191 downto 160))) then
			pos := 6;
		elsif(check_for_one(input(159 downto 128))) then
			pos := 5;
		elsif(check_for_one(input(127 downto 96))) then
			pos := 4;
		elsif(check_for_one(input(95 downto 64))) then
			pos := 3;
		elsif(check_for_one(input(63 downto 32))) then
			pos := 2;
		else
			pos := 1;
		end if;
		return pos;
	end function;
	
	
	signal size: integer range 0 to 14;

begin



size <= find_key_size(input);
key_size <= size;

end Behavioral;

