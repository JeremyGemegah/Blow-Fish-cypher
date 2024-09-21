----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:52:22 10/23/2023 
-- Design Name: 
-- Module Name:    register_576 - Behavioral 
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

entity register_576 is
port(
      DO : out  std_logic_vector(31 downto 0);      -- 32-bit Data Output
      ADDR : in std_logic_vector(8 downto 0);  -- 9-bit Address Input
      CLK : in std_logic;   -- Clock
      DI : in std_logic_vector(31 downto 0);      -- 32-bit Data Input
      SSR :in std_logic;   -- Synchronous Set/Reset Input
      WE : in std_logic
);
end register_576;


architecture Behavioral of register_576 is

type p_array is array (0 to 17) of std_logic_vector(31 downto 0); 

signal myp_array_init: p_array := (x"243f6a88",x"85a308d3",x"13198a2e",x"03707344",x"a4093822",x"299f31d0",x"082efa98",x"ec4e6c89",x"452821e6",x"38d01377",x"be5466cf",x"34e90c6c",x"c0ac29b7",x"c97c50dd",x"3f84d5b5",x"b5470917",x"9216d5d9",x"8979fb1b");

signal my_actual_parray : p_array ;--:= (x"243f6a88",x"85a308d3",x"13198a2e",x"03707344",x"a4093822",x"299f31d0",x"082efa98",x"ec4e6c89",x"452821e6",x"38d01377",x"be5466cf",x"34e90c6c",x"c0ac29b7",x"c97c50dd",x"3f84d5b5",x"b5470917",x"9216d5d9",x"8979fb1b");

signal address: integer range 0 to 17;



begin


address <= to_integer(unsigned(addr));


myp_array_init <= (x"243f6a88",x"85a308d3",x"13198a2e",x"03707344",x"a4093822",x"299f31d0",x"082efa98",x"ec4e6c89",x"452821e6",x"38d01377",x"be5466cf",x"34e90c6c",x"c0ac29b7",x"c97c50dd",x"3f84d5b5",x"b5470917",x"9216d5d9",x"8979fb1b");


process(clk,ssr,we)

begin
	my_actual_parray <= my_actual_parray;
	if ssr = '1' then
		my_actual_parray <= myp_array_init;
	elsif rising_edge(clk) then
		if we = '1' then
			my_actual_parray(address) <= di;
		end if;
	end  if;

	
end process;

do <= my_actual_parray(address);

end Behavioral;

--x"";
