----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:51:18 11/16/2023 
-- Design Name: 
-- Module Name:    new_sbox1 - Behavioral 
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
	Library UNISIM;
	use UNISIM.vcomponents.all;
		use std.textio.all;
	use ieee.std_logic_textio.all;


entity new_sbox1 is
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
end new_sbox1;

architecture Behavioral of new_sbox1 is
signal address : std_logic_vector(8 downto 0);

begin

address <= std_logic_vector(to_unsigned(addr,9));

RAMB16_S36_inst : RAMB16_S36
   generic map (
      INIT => X"000000000",  --  Value of output RAM registers at startup
      SRVAL => X"000000000", --  Output value upon SSR assertion
      WRITE_MODE => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
      -- The following INIT_xx declarations specify the initial contents of the RAM
      -- Address 0 to 127
      INIT_00 => X"f12c7f99ba7c90456a267e96b8e1afedd01adfb72ffd72db98dfb5acd1310ba6",
      INIT_01 => X"f4933d7ea458fea371574e69636920d8858efc160801f2e2b3916cf724a19947",
      INIT_02 => X"2af260139c30d539c25a59b57b54a41d82154aee718bcd58728eb6580d95748f",
      INIT_03 => X"b01e8a3e6c9e0e8b603a180e8e79dcb0b8db38efca417918286085f0c5d1b023",
      INIT_04 => X"63e8144057489862aa55ab94e65525f355605c6078af2fdabd314b27d71577c1",
      INIT_05 => X"636fbc2ab3ee14117c72e993a15486af1141e8ceb4cc5c342aab10b655ca396a",
      INIT_06 => X"289586777a3253816c24cf5cafd6ba339b87931ece5c3e16741831f62ba9c55d",
      INIT_07 => X"5dec8032487cac60fb21a99161d809cc66282193c4bfe81b6b4bb9af3b8f4898",
      INIT_08 => X"83f442390f6d6ff3d396acc523893e81eb651b88dc262302e98575b1ef845d5d",
      INIT_09 => X"abd388f0670c9c61f6e96c9a21c668429e1f9b5e69c8f04aa48420042e0b4482",
      INIT_0A => X"7efb2a98ba3bf050137a3be46eef0b6cab5133a3960fa728d8542f686a51a0d2",
      INIT_0B => X"3b8b5ebe7d84a5c3456f9fb48cee861982430e8866ca593e39af0176a1f1651d",
      INIT_0C => X"429b023d1bfedf72363f77064ed3aa6256c16aa6401a449f85c12073e06f75d8",
      INIT_0D => X"f6e8def725d479d880991b7b075372c949f1c09bdb0fead3d00a124837d0d724",
      INIT_0E => X"196a24635e5c9ec2409f60c4c1a94fb604c006ba976ce0bdb6794c3be3fe501a",
      INIT_0F => X"af5ebd09cc8145449b30952c6dfc511f3b52ec6f1339b2eb3e6c53b568fb6faf",
      -- Address 128 to 255
      INIT_10 => X"b9d3fbdbd20b5f3945c8740fc0cba857192e4bb3660f2807de334afdbee3d004",
      INIT_11 => X"db3222f88ea5e9f8fb1fa3cc679f25fe402c7279d6a100c61a60320a5579c0bd",
      INIT_12 => X"3e00df8253317b48fd238760323db5faad0552ab2f501ec8fd616b153c7516df",
      INIT_13 => X"8c4f5573ac6732c6287effc3d542a8f6df1769db1a87562eca6f8ca09e5c57bb",
      INIT_14 => X"2dd1d35b4afcb56cfd2183b810fa3d98b8f011a0e1ffa35dbbca58c8695b27b0",
      INIT_15 => X"cee4c6e862fb1341a4cb7e33e1ddf2da4bfb9790d28e49bcb6f845659a53e479",
      INIT_16 => X"6b93d5a0eaad8e71ae90919895dbda4d2bf11fb4d07e9efe36774c01ef20cada",
      INIT_17 => X"900df01c8888b812f2122b648ff6e2fb8e7594b78e3c5b2fafc725e0d08ed1d0",
      INIT_18 => X"8b021fa1ea752dfebe0e17772f2f2218b3a8c1add1cff191688fc31c4fad5ea0",
      INIT_19 => X"d2ada8d97cc43b81fd13e0b7b4a84fe0ce89e29918acf3d6b56f74e8e5a0cc0f",
      INIT_1A => X"fb9d35cfc75442f577b5fa86e6ad2065211a147793cc731480957705165fa266",
      INIT_1B => X"57b8e0af226800bb2071b35e00250e2dae1e7e49d6411bd37b3e89a0ebcdaf0c",
      INIT_1C => X"02e5b9c5207d5ba2d95a537f78c1438959dfa6aa5563911df009b91e2464369b",
      INIT_1D => X"9a5329151b5100527b14a94ab3472dca4e734a4111c819686295cfa983260376",
      INIT_1E => X"2a0dd915f296ec6b571be91f08ba6fb581e674002b60a476bc9bc6e4d60f573f",
      INIT_1F => X"6e85076a08ba4799a99f8fa153b02d5dc5855664ff34052ee7b9f9b6b6636521",
      -- Address 256 to 383
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      -- Address 384 to 511
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"ffffffff67890123000000000000000000000000000000000000000000000000",
      INIT_3F => X"ffffffff67890123000000000000000000000000000000000000000000000000",
      -- The next set of INITP_xx are for the parity bits
      -- Address 0 to 127
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      -- Address 128 to 255
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      -- Address 256 to 383
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      -- Address 384 to 511
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
		
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000")
   port map (
      DO => DO,      -- 32-bit Data Output
      DOP => DOP,    -- 4-bit parity Output
      ADDR => address,  -- 9-bit Address Input
      CLK => CLK,    -- Clock
      DI => DI,      -- 32-bit Data Input
      DIP => DIP,    -- 4-bit parity Input
      EN => EN,      -- RAM Enable Input
      SSR => SSR,    -- Synchronous Set/Reset Input
      WE => WE       -- Write Enable Input
   );
	


end Behavioral;

