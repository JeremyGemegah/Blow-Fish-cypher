----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:40:00 11/09/2023 
-- Design Name: 
-- Module Name:    database - Behavioral 
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

entity database is
port(
	inter_cypher: in std_logic_vector(63 downto 0);
	clk,p_we,s1_we,s2_we,s3_we,s4_we,s1_re,s2_re,s3_re,s4_re,p_re,state: in std_logic; --- state is 1 for encryption or decryption and 0 for key and sbox expansion
	input_mux: in std_logic_vector(1 downto 0);
	P_expander_input: in std_logic_vector(31 downto 0);
	database_counter: in integer;
	address: in std_logic_vector(31 downto 0);
	p_address: in std_logic_vector(8 downto 0);
	p_out,sbox1_out,sbox2_out,sbox3_out,sbox4_out: out std_logic_vector(31 downto 0)
	
);
end database;

architecture Behavioral of database is

-----------------------------------Declaration of components---------------------------

component new_sbox1 is
port(
      DO : out  std_logic_vector(31 downto 0);      -- 32-bit Data Output
      DOP : out  std_logic_vector(3 downto 0);    -- 4-bit parity Output
      ADDR : in integer range 0 to 256;   -- 9-bit Address Input
      CLK : in std_logic;   -- Clock
      DI : in std_logic_vector(31 downto 0);      -- 32-bit Data Input
      DIP :in std_logic_vector(3 downto 0);  -- 4-bit parity Input
      EN : in std_logic;     -- RAM Enable Input
      SSR :in std_logic;   -- Synchronous Set/Reset Input
      WE : in std_logic
);
end component;

component new_sbox2 is
port(
      DO : out  std_logic_vector(31 downto 0);      -- 32-bit Data Output
      DOP : out  std_logic_vector(3 downto 0);    -- 4-bit parity Output
      ADDR : in integer range 0 to 256;   -- 9-bit Address Input
      CLK : in std_logic;   -- Clock
      DI : in std_logic_vector(31 downto 0);      -- 32-bit Data Input
      DIP :in std_logic_vector(3 downto 0);  -- 4-bit parity Input
      EN : in std_logic;     -- RAM Enable Input
      SSR :in std_logic;   -- Synchronous Set/Reset Input
      WE : in std_logic
);
end component;

component new_sbox3 is
port(
      DO : out  std_logic_vector(31 downto 0);      -- 32-bit Data Output
      DOP : out  std_logic_vector(3 downto 0);    -- 4-bit parity Output
      ADDR : in integer range 0 to 256;   -- 9-bit Address Input
      CLK : in std_logic;   -- Clock
      DI : in std_logic_vector(31 downto 0);      -- 32-bit Data Input
      DIP :in std_logic_vector(3 downto 0);  -- 4-bit parity Input
      EN : in std_logic;     -- RAM Enable Input
      SSR :in std_logic;   -- Synchronous Set/Reset Input
      WE : in std_logic
);
end component;

component new_sbox4 is
port(
      DO : out  std_logic_vector(31 downto 0);      -- 32-bit Data Output
      DOP : out  std_logic_vector(3 downto 0);    -- 4-bit parity Output
      ADDR : in integer range 0 to 17;   -- 9-bit Address Input
      CLK : in std_logic;   -- Clock
      DI : in std_logic_vector(31 downto 0);      -- 32-bit Data Input
      DIP :in std_logic_vector(3 downto 0);  -- 4-bit parity Input
      EN : in std_logic;     -- RAM Enable Input
      SSR :in std_logic;   -- Synchronous Set/Reset Input
      WE : in std_logic
);
end component;


component register_576 is
port(
      DO : out  std_logic_vector(31 downto 0);      -- 32-bit Data Output
      ADDR : in std_logic_vector(8 downto 0);   -- 9-bit Address Input
      CLK : in std_logic;   -- Clock
      DI : in std_logic_vector(31 downto 0);      -- 32-bit Data Input
      SSR :in std_logic;   -- Synchronous Set/Reset Input
      WE : in std_logic
);
end component;


function translate( address: std_logic_vector(7 downto 0)) return integer is
	variable coordinate1: integer range 0 to 16;
	variable coordinate2: integer range 0 to 16;
	variable number: integer range 0 to 256;
	begin
		coordinate1:= to_integer(unsigned(address(7 downto 4)));
		coordinate2:= to_integer(unsigned(address(3 downto 0)));
		
		case coordinate1 is
			when 0 =>
				number := 0 + coordinate2;
			when 1 =>
				number := 16 + coordinate2;
			when 2 =>
				number := 32 + coordinate2;
			when 3 =>
				number := 48 + coordinate2;
			when 4 =>
				number := 64 + coordinate2;
			when 5 =>
				number := 80 + coordinate2;
			when 6 =>
				number := 96 + coordinate2;
			when 7 =>
				number := 112 + coordinate2;
			when 8 =>
				number := 128 + coordinate2;
			when 9 =>
				number := 144 + coordinate2;
			when 10 =>
				number := 160 + coordinate2;
			when 11 =>
				number := 176 + coordinate2;
			when 12 =>
				number := 192 + coordinate2;
			when 13 =>
				number := 208 + coordinate2;
			when 14 =>
				number := 224 + coordinate2;
			when others =>
				number := 240 + coordinate2;
			end case;
	return number;
end function;


-------------------------------Signals------------------------------------------------
signal box_input : std_logic_vector(31 downto 0);
signal parity: std_logic_vector(3 downto 0);
signal s1_addr,s2_addr,s3_addr,s4_addr: integer range 0 to 256 := 40;
signal address_refined : std_logic_vector(8 downto 0);

begin

parity <= (others => '0');


--------------------multiplexers------------------------------------------------------

with input_mux select
	box_input <= p_expander_input when "00",	-------input from the key expander
				inter_cypher(63 downto 32) when "01",	---------left side of intermidiary cyphertext
				inter_cypher(31 downto 0) when others;	----------right side of intermidiary cyphertext
				

with state select
	s4_addr <= database_counter when '0',
				translate(address(7 downto 0)) when others;
				
with state select
	s3_addr <= database_counter when '0',
				translate(address(15 downto 8))  when others;
				
with state select
	s2_addr <= database_counter when '0',
				translate(address(23 downto 16)) when others;
				
with state select
	s1_addr <= database_counter when '0',
				translate(address(31 downto 24)) when others;


---------------Refine the p_address--------------------------------
process(clk,p_address)
begin
if to_integer(unsigned(p_address)) > 17 then
	address_refined <= (others => '0');
else
	address_refined <= p_address;
end if;
end process;


my_p_box: register_576 port map(
	do => p_out,
	addr => address_refined,
	clk => clk,
	di => box_input,
	ssr => p_re,
	we => p_we
);


my_sbox_1: new_sbox1 port map(
	do => sbox1_out,
	dop => open,
	addr => s1_addr,
	clk => clk,
	di => box_input,
	dip => parity,
	en => '1',
	ssr => s1_re,
	we => s1_we
);

my_sbox_2: new_sbox2 port map(
	do => sbox2_out,
	dop => open,
	addr => s2_addr,
	clk => clk,
	di => box_input,
	dip => parity,
	en => '1',
	ssr => s2_re,
	we =>s2_we
);

my_sbox_3: new_sbox3 port map(
	do => sbox3_out,
	dop => open,
	addr => s3_addr,
	clk => clk,
	di => box_input,
	dip => parity,
	en => '1',
	ssr => s3_re,
	we => s3_we
);


my_sbox_4: new_sbox4 port map(
	do => sbox4_out,
	dop => open,
	addr => s4_addr,
	clk => clk,
	di => box_input,
	dip => parity,
	en => '1',
	ssr => s4_re,
	we => s4_we
);



end Behavioral;

