----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:21:13 10/16/2023 
-- Design Name: 
-- Module Name:    sbox_4 - Behavioral 
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
	use std.textio.all;
	use ieee.std_logic_textio.all;
	

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sbox_4 is
port(
address: in std_logic_vector(7 downto 0);
input: in std_logic_vector(31 downto 0);
en : in std_logic;
output: out std_logic_vector(31 downto 0)

);
end sbox_4;

architecture Behavioral of sbox_4 is

type matrix_s is array ( 0 to 15, 0 to 15) of std_logic_vector(31 downto 0);



-------------------------Function to open file and read hex values into matrix format-----------------------
impure function filereader(filename: string) return matrix_s is
	file readfile: text open read_mode is filename;
	variable lineread: Line;
	variable my_rom: matrix_s;
	
	begin
		for i in 0 to 15 loop 
			
			for t in 0 to 15 loop
				readline(readfile,lineread);
				hread(lineread,my_rom(i,t));
			end loop;
		end loop;
		file_close(readfile);
	return my_rom;
end function;

---------------------------Initialization of rom during synthesis with values returned from file function---------

signal myrom: matrix_s := filereader("C:\Users\jerem\OneDrive\Desktop\projects\blowfish\SBOX4.txt");


begin


 
process(en)
begin
	if en = '1' then
		myrom(to_integer(unsigned(address(7 downto 4))),to_integer(unsigned(address(3 downto 0)))) <= input;
		output <= myrom(to_integer(unsigned(address(7 downto 4))),to_integer(unsigned(address(3 downto 0))));
	else
		output <= myrom(to_integer(unsigned(address(7 downto 4))),to_integer(unsigned(address(3 downto 0))));
	end if;
end process;


			
			
		
		
	

end Behavioral;
