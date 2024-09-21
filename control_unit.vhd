----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:23:40 10/28/2023 
-- Design Name: 
-- Module Name:    control_unit - Behavioral 
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

entity control_unit is
port(
	mode,clr,clk: in std_logic;
	mode_reg_val,mode_reg_en,key_reg_en,key_mux_select,pi_preset,round_reg_en,round_mux_select,output_ready,pp_en_left,pp_en_right: out std_logic
);
end control_unit;

architecture Behavioral of control_unit is

type state is (st0,st1,st2,st3,st4,st5);
signal ps,ns : state := st0;
signal count : integer range 0 to 20 := 0;
signal my_num: std_logic_vector(4 downto 0);


begin

timing: process(clk)
	begin
		if(rising_edge(clk)) then
			ps <= ns;
			if (ps = st2 or ps = st4) then
				count <= count + 1;
			elsif ps = st0 then
				count <= 0;
			else
				count <= count;
			end if;
		end if;
	end process timing;

controlling_unit: process(ps,clr,count)
	begin
	output_ready <= '0';
	pp_en_right <= '0';
	pp_en_left <='0';
	round_mux_select <= '1';
	round_reg_en <= '0';
		case ps is
			when st0 =>
				if clr ='1' then
					ns <= st0;
				else
					ns <= st1;
				end if;
					key_mux_select <= '0';
					round_mux_select <= '0';
					round_reg_en <= '1';
					key_reg_en <= '1';
					pi_preset <= '1';
					mode_reg_en <= '1';
					--count <= 0;
				
			when st1 => 
				if clr = '1' then
					ns <= st0;
				else
					ns <= st2;
				end if;
					key_reg_en <= '1';
					key_mux_select <= '1';
					pi_preset <= '0';
					mode_reg_en <= '0';
					--count <= count;
				
			when st2 =>
				if clr = '1' then
					ns <= st0;
				else
					ns <= st3;
				end if;
					key_reg_en <= '0';
					key_mux_select <= '1';
					pi_preset <= '0';
					mode_reg_en <= '0';
					round_reg_en <= '1';
					--count <= count + 1;
				
			when st3 =>
				if clr = '1' then
					ns <= st0;
				else
					if count = 16 then
						ns <= st4;
					elsif count = 17 then
						ns <= st5;
					else
						ns <= st2;
					end if;
				end if;
					key_mux_select <= '1';
					pi_preset <= '0';
					mode_reg_en <='0';
					key_reg_en <= '1';
					--count <= count;
			when st4 =>
				if clr = '1' then
					ns <= st0;
				else
					ns <= st3;
				end if;
					key_reg_en <= '0';
					pi_preset <= '0';
					mode_reg_en <= '0';
					key_mux_select <= '1';
					pp_en_right <= '1';
					--count <= count + 1;
			when others =>
				if clr = '1' then
					ns <= st0;
				else
					ns <= st5;
					end if;
					key_reg_en <= '0';
					pi_preset <= '0';
					mode_reg_en <= '0';
					key_mux_select <= '1';
					--count <= count;
					pp_en_left <= '1';
					output_ready <= '1';
			end case;
					
					
				
	end process controlling_unit;

my_num <= std_logic_vector(to_unsigned(count,5));
mode_reg_val <= mode;
end Behavioral;

