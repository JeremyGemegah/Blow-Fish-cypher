----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:51:51 11/16/2023 
-- Design Name: 
-- Module Name:    new_sbox2 - Behavioral 
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


entity new_sbox2 is
port(
      DO : out  std_logic_vector(31 downto 0);      -- 32-bit Data Output
      DOP : out  std_logic_vector(3 downto 0);    -- 4-bit parity Output
      addr : in integer range 0 to 256;   -- 9-bit Address Input
      CLK : in std_logic;   -- Clock
      DI : in std_logic_vector(31 downto 0);      -- 32-bit Data Input
      DIP :in std_logic_vector(3 downto 0);  -- 4-bit parity Input
      EN : in std_logic;     -- RAM Enable Input
      SSR :in std_logic;   -- Synchronous Set/Reset Input
      WE : in std_logic
);
end new_sbox2;

architecture Behavioral of new_sbox2 is
signal address : std_logic_vector(8 downto 0);

begin



address <= std_logic_vector(to_unsigned(addr,9));
--------------------------------sbox 2---------------------------------------------------

RAMB16_S36_inst : RAMB16_S36
   generic map (
      INIT => X"000000000",  --  Value of output RAM registers at startup
      SRVAL => X"000000000", --  Output value upon SSR assertion
      WRITE_MODE => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
      -- The following INIT_xx declarations specify the initial contents of the RAM
      -- Address 0 to 127
      INIT_00 => X"8fedb2669cee60b849a7df7dad6ea6b0c4192623db75092eb5b329444b7a70e9",
      INIT_01 => X"e4183a3ea059134075094c29193602a5c2b19ee15664526c699a17ffecaa8c71",
      INIT_02 => X"f0255dc14d2d38e6efe830f5a1d29c0799f73fd66b8fe4d65b429d653f54989a",
      INIT_03 => X"6b6a70a13c9718143ebaefc909686b3f021ecc5e6382e9c68470eb264cdd2086",
      INIT_04 => X"5716f2b88e7d44ec7fdeae5c3e07841caa500737b79c530552a0e286687f3584",
      INIT_05 => X"dc0921bd25837a583cb574b2ae0cf51a0200b3fff01c1f04f0500c0db03ada37",
      INIT_06 => X"9af3dda7c8b5763437c2dadc3ae5e58122f54701943247737ca92ff6d19113f9",
      INIT_07 => X"183eb3313280bba13bea0e2fe238cd99a4751e41ecc8c73e0fd0030ea9446146",
      INIT_08 => X"bcaf89af5679b07224977c792cb81290f60a04bf6f420d034f6db9084e548b38",
      INIT_09 => X"9f84cd87501adde62e6b71245512721fdccf3f2eb38bae12d9930810de9a771f",
      INIT_0A => X"c464c3d263094366db851dfaec7aec3ae94b7d8cbc9f9abc7408da177a584718",
      INIT_0B => X"133ae4dd509400022a65c45112a14d4324c2ba16dd433b373215d908ef1c1847",
      INIT_0C => X"5924a5093c11183bd7a3c76b043556f15f11199b81ac77d610314e5571dff89e",
      INIT_0D => X"5a3e2ab3860e5e0aeae96fb186e345701e153c6e9ebabf2c97f1fbfaf28fe6ed",
      INIT_0E => X"9c10b36a2e4cc9785266c825803e89d699e71d0f2965dcb94e3d06fa771fe71c",
      INIT_0F => X"19c279601939260f361d2b3df2f74ea71e0a2df4a5fc3c5394e2ea78c6150eba",
      -- Address 128 to 255
      INIT_10 => X"018cff28b17f37d1a67bc883e3bc4595eac31f66ebadfe6ef71312b65223a708",
      INIT_11 => X"5b6e2f842aef7daddb2f953beecea50f68ab980265582185be6c5aa5c332ddef",
      INIT_12 => X"aa0363cf0334fe1eeb61bd9613cca830619f1510ecdd4775290761701521b628",
      INIT_13 => X"b2f3846e9cab5cab60622ca7eecc86bccbaade14d59e9e0b4c70a239b5735c90",
      INIT_14 => X"c021b8f7319ee9d53c2ab4b340685a32655abb50a02369b919bdf0ca648b1eaf",
      INIT_15 => X"1668128111ed935f97e32d77f837889a623d7da895f7997e875fa0999b540b19",
      INIT_16 => X"1ac246969b83c3ff1b22726357f584a57858ba9996dedfa1c7e61fd60e358829",
      INIT_17 => X"ee7c3c73fe28ed6134c6ffea58ebf2ef6dbc31288fd948e4532e3054cdb30aeb",
      INIT_18 => X"facb4fd0db6c4f15a3aaabea45eee2b6203e13e042105d14e864b7e35d4a14d9",
      INIT_19 => X"3d816250e44b476a86854dc7d81e799e41cd2105654f3b1def6abbb5c742f442",
      INIT_1A => X"5692b28547848a0b69cb74927f1524c3c1c7b6a3fc8883a05b8d2646cf62a1f2",
      INIT_1B => X"233f70611dadf43e0c55f5ea58428d2a23820e001462b174ad19489d095bbf00",
      INIT_1C => X"ce77326e4085f2a7cbee74607cde37596c223bdbd65fecf18d937e413372f092",
      INIT_1D => X"800bcadc5a04abfcc50c06c2a969a7aa61d99735e8efd85519f8509ea6078084",
      INIT_1E => X"e3674340675fda79105588cddb73dbd30e1e9ec9fdd56705c34534849e447a2e",
      INIT_1F => X"db83adf7e6e39f2b8fb03d4a153e21e7f16dff203d28f89e713e38d8c5c43465",
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
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
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
