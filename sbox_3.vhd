----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:20:15 10/16/2023 
-- Design Name: 
-- Module Name:    sbox_3 - Behavioral 
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

entity sbox_3 is
port(

input: in std_logic_vector(31 downto 0);
en ,clk: in std_logic;
output: out std_logic_vector(31 downto 0)

);
end sbox_3;

architecture Behavioral of sbox_3 is

type matrix_s is array ( 0 to 255) of std_logic_vector(31 downto 0);



-------------------------Function to open file and read hex values into matrix format-----------------------
impure function filereader(filename: string) return matrix_s is
	file readfile: text open read_mode is filename;
	variable lineread: Line;
	variable my_rom: matrix_s;
	
	begin
		for i in 0 to 255 loop 
			
			
				readline(readfile,lineread);
				hread(lineread,my_rom(i));
			
		end loop;
		file_close(readfile);
	return my_rom;
end function;



---------------------------Initialization of rom during synthesis with values returned from file function---------

signal myrom: matrix_s := filereader("C:\Users\jerem\OneDrive\Desktop\projects\blowfish\SBOX4.txt");


component rough_work is
port(
      DO : out  std_logic_vector(31 downto 0);      -- 32-bit Data Output
      DOP : out  std_logic_vector(3 downto 0);    -- 4-bit parity Output
      ADDR : in std_logic_vector(8 downto 0);   -- 9-bit Address Input
      CLK : in std_logic;   -- Clock
      DI : in std_logic_vector(31 downto 0);      -- 32-bit Data Input
      DIP :in std_logic_vector(3 downto 0);  -- 4-bit parity Input
      EN : in std_logic;     -- RAM Enable Input
      SSR :in std_logic;   -- Synchronous Set/Reset Input
      WE : in std_logic
);
end component;

signal ram_val : std_logic_vector(31 downto 0);
signal address: integer;
signal check_status: std_logic;

signal addr_vec: std_logic_vector(8 downto 0);
begin

addr_vec <= std_logic_vector(to_unsigned(address,9));

myram: rough_work port map(
	Do => ram_val,
	dop => open,
	addr => addr_vec,
	clk => clk,
	di => (others => '0'),
	dip => ( others => '0'),
	en => '1',
	ssr => '0',
	we => '0'
);


 
process(clk)

variable inter : integer := 0;

variable myrom_val : std_logic_vector(31 downto 0);

begin
	myrom_val := myrom(inter);
	if falling_edge(clk) then
		if (myrom_val = ram_val) then
			check_status <= '1';
			
		else
			check_status <= '0';
			
			end if;
			inter := inter + 1;
			address <= inter;
	end if;

end process;


			
			
		
		
	

end Behavioral;
