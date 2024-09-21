-----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:13:47 10/21/2023 
-- Design Name: 
-- Module Name:    rough_work - Behavioral 
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


-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rough_work is
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
end rough_work;

architecture Behavioral of rough_work is

----component combinational_shifter is port(
----	key_size: in std_logic_vector(8 downto 0);
----	input : in std_logic_vector(447 downto 0);
----	direction: in std_logic;
----	output: out std_logic_vector(31 downto 0)
----);
----end component;
--
--component sbox_1 is
--port(
--input: in std_logic_vector(7 downto 0);
--output: out std_logic_vector(31 downto 0)
--
--);
--end component;

type matrix_s is array(0 to 255) of bit_vector(31 downto 0);

impure function filereader(filename: string) return matrix_s is
	file readfile: text open read_mode is filename;
	variable lineread: Line;
	variable my_rom: matrix_s;
	
	begin
			
			for t in 0 to 8 loop
				readline(readfile,lineread);
				read(lineread,my_rom(t));
			end loop;
		
		file_close(readfile);
	return my_rom;
end function;

--signal myrom: matrix_s := filereader("C:\Users\jerem\OneDrive\Desktop\projects\blowfish\SBOX1.txt");


begin



----shifter: combinational_shifter port map(
----		key_size => std_logic_vector(to_unsigned(63,9)),
----		input => x"26cc6fc7f561570086f99538f3da2759b449db3ebbe1910e73f53f3e1672e8908d57ec4bcfe0329a4ebd556d6fadf4f5d690f668729f6e79",
----		direction => '1',
----		output => output
----);
--
--sbox: sbox_1 port map(
--	input => x"26",
--	output => decode
--); 


--RAMB16_S36_inst : RAMB16_S36
--   generic map (
--      INIT => X"000000000",  --  Value of output RAM registers at startup
--      SRVAL => X"000000000", --  Output value upon SSR assertion
--      WRITE_MODE => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
--      -- The following INIT_xx declarations specify the initial contents of the RAM
--      -- Address 0 to 127
--      INIT_00 => X"f12c7f99ba7c90456a267e96b8e1afedd01adfb72ffd72db98dfb5acd1310ba6",
--      INIT_01 => X"f4933d7ea458fea371574e69636920d8858efc160801f2e2b3916cf724a19947",
--      INIT_02 => X"2af260139c30d539c25a59b57b54a41d82154aee718bcd58728eb6580d95748f",
--      INIT_03 => X"b01e8a3e6c9e0e8b603a180e8e79dcb0b8db38efca417918286085f0c5d1b023",
--      INIT_04 => X"63e8144057489862aa55ab94e65525f355605c6078af2fdabd314b27d71577c1",
--      INIT_05 => X"636fbc2ab3ee14117c72e993a15486af1141e8ceb4cc5c342aab10b655ca396a",
--      INIT_06 => X"289586777a3253816c24cf5cafd6ba339b87931ece5c3e16741831f62ba9c55d",
--      INIT_07 => X"5dec8032487cac60fb21a99161d809cc66282193c4bfe81b6b4bb9af3b8f4898",
--      INIT_08 => X"83f442390f6d6ff3d396acc523893e81eb651b88dc262302e98575b1ef845d5d",
--      INIT_09 => X"abd388f0670c9c61f6e96c9a21c668429e1f9b5e69c8f04aa48420042e0b4482",
--      INIT_0A => X"7efb2a98ba3bf050137a3be46eef0b6cab5133a3960fa728d8542f686a51a0d2",
--      INIT_0B => X"3b8b5ebe7d84a5c3456f9fb48cee861982430e8866ca593e39af0176a1f1651d",
--      INIT_0C => X"429b023d1bfedf72363f77064ed3aa6256c16aa6401a449f85c12073e06f75d8",
--      INIT_0D => X"f6e8def725d479d880991b7b075372c949f1c09bdb0fead3d00a124837d0d724",
--      INIT_0E => X"196a24635e5c9ec2409f60c4c1a94fb604c006ba976ce0bdb6794c3be3fe501a",
--      INIT_0F => X"af5ebd09cc8145449b30952c6dfc511f3b52ec6f1339b2eb3e6c53b568fb6faf",
--      -- Address 128 to 255
--      INIT_10 => X"b9d3fbdbd20b5f3945c8740fc0cba857192e4bb3660f2807de334afdbee3d004",
--      INIT_11 => X"db3222f88ea5e9f8fb1fa3cc679f25fe402c7279d6a100c61a60320a5579c0bd",
--      INIT_12 => X"3e00df8253317b48fd238760323db5faad0552ab2f501ec8fd616b153c7516df",
--      INIT_13 => X"8c4f5573ac6732c6287effc3d542a8f6df1769db1a87562eca6f8ca09e5c57bb",
--      INIT_14 => X"2dd1d35b4afcb56cfd2183b810fa3d98b8f011a0e1ffa35dbbca58c8695b27b0",
--      INIT_15 => X"cee4c6e862fb1341a4cb7e33e1ddf2da4bfb9790d28e49bcb6f845659a53e479",
--      INIT_16 => X"6b93d5a0eaad8e71ae90919895dbda4d2bf11fb4d07e9efe36774c01ef20cada",
--      INIT_17 => X"900df01c8888b812f2122b648ff6e2fb8e7594b78e3c5b2fafc725e0d08ed1d0",
--      INIT_18 => X"8b021fa1ea752dfebe0e17772f2f2218b3a8c1add1cff191688fc31c4fad5ea0",
--      INIT_19 => X"d2ada8d97cc43b81fd13e0b7b4a84fe0ce89e29918acf3d6b56f74e8e5a0cc0f",
--      INIT_1A => X"fb9d35cfc75442f577b5fa86e6ad2065211a147793cc731480957705165fa266",
--      INIT_1B => X"57b8e0af226800bb2071b35e00250e2dae1e7e49d6411bd37b3e89a0ebcdaf0c",
--      INIT_1C => X"02e5b9c5207d5ba2d95a537f78c1438959dfa6aa5563911df009b91e2464369b",
--      INIT_1D => X"9a5329151b5100527b14a94ab3472dca4e734a4111c819686295cfa983260376",
--      INIT_1E => X"2a0dd915f296ec6b571be91f08ba6fb581e674002b60a476bc9bc6e4d60f573f",
--      INIT_1F => X"6e85076a08ba4799a99f8fa153b02d5dc5855664ff34052ee7b9f9b6b6636521",
--      -- Address 256 to 383
--      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
--      -- Address 384 to 511
--      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_3E => X"ffffffff67890123000000000000000000000000000000000000000000000000",
--      INIT_3F => X"ffffffff67890123000000000000000000000000000000000000000000000000",
--      -- The next set of INITP_xx are for the parity bits
--      -- Address 0 to 127
--      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      -- Address 128 to 255
--      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      -- Address 256 to 383
--      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      -- Address 384 to 511
--      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
--		
--      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000")
--   port map (
--      DO => DO,      -- 32-bit Data Output
--      DOP => DOP,    -- 4-bit parity Output
--      ADDR => ADDR,  -- 9-bit Address Input
--      CLK => CLK,    -- Clock
--      DI => DI,      -- 32-bit Data Input
--      DIP => DIP,    -- 4-bit parity Input
--      EN => EN,      -- RAM Enable Input
--      SSR => SSR,    -- Synchronous Set/Reset Input
--      WE => WE       -- Write Enable Input
--   );
--	


----------------------------------sbox 2---------------------------------------------------

--RAMB16_S36_inst : RAMB16_S36
--   generic map (
--      INIT => X"000000000",  --  Value of output RAM registers at startup
--      SRVAL => X"000000000", --  Output value upon SSR assertion
--      WRITE_MODE => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
--      -- The following INIT_xx declarations specify the initial contents of the RAM
--      -- Address 0 to 127
--      INIT_00 => X"8fedb2669cee60b849a7df7dad6ea6b0c4192623db75092eb5b329444b7a70e9",
--      INIT_01 => X"e4183a3ea059134075094c29193602a5c2b19ee15664526c699a17ffecaa8c71",
--      INIT_02 => X"f0255dc14d2d38e6efe830f5a1d29c0799f73fd66b8fe4d65b429d653f54989a",
--      INIT_03 => X"6b6a70a13c9718143ebaefc909686b3f021ecc5e6382e9c68470eb264cdd2086",
--      INIT_04 => X"5716f2b88e7d44ec7fdeae5c3e07841caa500737b79c530552a0e286687f3584",
--      INIT_05 => X"dc0921bd25837a583cb574b2ae0cf51a0200b3fff01c1f04f0500c0db03ada37",
--      INIT_06 => X"9af3dda7c8b5763437c2dadc3ae5e58122f54701943247737ca92ff6d19113f9",
--      INIT_07 => X"183eb3313280bba13bea0e2fe238cd99a4751e41ecc8c73e0fd0030ea9446146",
--      INIT_08 => X"bcaf89af5679b07224977c792cb81290f60a04bf6f420d034f6db9084e548b38",
--      INIT_09 => X"9f84cd87501adde62e6b71245512721fdccf3f2eb38bae12d9930810de9a771f",
--      INIT_0A => X"c464c3d263094366db851dfaec7aec3ae94b7d8cbc9f9abc7408da177a584718",
--      INIT_0B => X"133ae4dd509400022a65c45112a14d4324c2ba16dd433b373215d908ef1c1847",
--      INIT_0C => X"5924a5093c11183bd7a3c76b043556f15f11199b81ac77d610314e5571dff89e",
--      INIT_0D => X"5a3e2ab3860e5e0aeae96fb186e345701e153c6e9ebabf2c97f1fbfaf28fe6ed",
--      INIT_0E => X"9c10b36a2e4cc9785266c825803e89d699e71d0f2965dcb94e3d06fa771fe71c",
--      INIT_0F => X"19c279601939260f361d2b3df2f74ea71e0a2df4a5fc3c5394e2ea78c6150eba",
--      -- Address 128 to 255
--      INIT_10 => X"018cff28b17f37d1a67bc883e3bc4595eac31f66ebadfe6ef71312b65223a708",
--      INIT_11 => X"5b6e2f842aef7daddb2f953beecea50f68ab980265582185be6c5aa5c332ddef",
--      INIT_12 => X"aa0363cf0334fe1eeb61bd9613cca830619f1510ecdd4775290761701521b628",
--      INIT_13 => X"b2f3846e9cab5cab60622ca7eecc86bccbaade14d59e9e0b4c70a239b5735c90",
--      INIT_14 => X"c021b8f7319ee9d53c2ab4b340685a32655abb50a02369b919bdf0ca648b1eaf",
--      INIT_15 => X"1668128111ed935f97e32d77f837889a623d7da895f7997e875fa0999b540b19",
--      INIT_16 => X"1ac246969b83c3ff1b22726357f584a57858ba9996dedfa1c7e61fd60e358829",
--      INIT_17 => X"ee7c3c73fe28ed6134c6ffea58ebf2ef6dbc31288fd948e4532e3054cdb30aeb",
--      INIT_18 => X"facb4fd0db6c4f15a3aaabea45eee2b6203e13e042105d14e864b7e35d4a14d9",
--      INIT_19 => X"3d816250e44b476a86854dc7d81e799e41cd2105654f3b1def6abbb5c742f442",
--      INIT_1A => X"5692b28547848a0b69cb74927f1524c3c1c7b6a3fc8883a05b8d2646cf62a1f2",
--      INIT_1B => X"233f70611dadf43e0c55f5ea58428d2a23820e001462b174ad19489d095bbf00",
--      INIT_1C => X"ce77326e4085f2a7cbee74607cde37596c223bdbd65fecf18d937e413372f092",
--      INIT_1D => X"800bcadc5a04abfcc50c06c2a969a7aa61d99735e8efd85519f8509ea6078084",
--      INIT_1E => X"e3674340675fda79105588cddb73dbd30e1e9ec9fdd56705c34534849e447a2e",
--      INIT_1F => X"db83adf7e6e39f2b8fb03d4a153e21e7f16dff203d28f89e713e38d8c5c43465",
--      -- Address 256 to 383
--      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
--      -- Address 384 to 511
--      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
--      -- The next set of INITP_xx are for the parity bits
--      -- Address 0 to 127
--      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      -- Address 128 to 255
--      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      -- Address 256 to 383
--      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      -- Address 384 to 511
--      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000")
--   port map (
--      DO => DO,      -- 32-bit Data Output
--      DOP => DOP,    -- 4-bit parity Output
--      ADDR => ADDR,  -- 9-bit Address Input
--      CLK => CLK,    -- Clock
--      DI => DI,      -- 32-bit Data Input
--      DIP => DIP,    -- 4-bit parity Input
--      EN => EN,      -- RAM Enable Input
--      SSR => SSR,    -- Synchronous Set/Reset Input
--      WE => WE       -- Write Enable Input
--   );



--------------------------sbox 3----------------------------------------------------------

--RAMB16_S36_inst : RAMB16_S36
--   generic map (
--      INIT => X"000000000",  --  Value of output RAM registers at startup
--      SRVAL => X"000000000", --  Output value upon SSR assertion
--      WRITE_MODE => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
--      -- The following INIT_xx declarations specify the initial contents of the RAM
--      -- Address 0 to 127
--      INIT_00 => X"d4a20068bcf46b2e7602d4f7411520f794692934f64c261c948140f7e93d5a68",
--      INIT_01 => X"bf8b884014214f74972445461e39f62e500061af43b7d4b73320f46ad4082471",
--      INIT_02 => X"31cb85047fac6dd003bd9785bfbc09ec66a02f4570f4ddd396b591af4d95fc1d",
--      INIT_03 => X"e9b66dfb0a2c86da530429f428507825abca0a9ada2547e655fd394196eb27b3",
--      INIT_04 => X"7af4d6b6b58ce006e887ad8c4f3ffea227a18dee680ec0a4d748690068dc1462",
--      INIT_05 => X"3b124e8bee39d7abd9f385b920fe9e35406b2a42ce78a399d3375fecaace1e7c",
--      INIT_06 => X"ca7820fb6841e7f7dd5b43323a6efa74eae397b226a366314b6d18561dc9faf7",
--      INIT_07 => X"d096954bfe6ba9b720838d8755533a3aba489527454056acd8feb397fb0af54e",
--      INIT_08 => X"9029317c5ef47e1c3f3125f9a62a4a5699e1db33cca92963a1159a5855a867bc",
--      INIT_09 => X"c70f86dc48c1133fe4c66d2295c1154805282ce380bb155c04272f70fdf8e802",
--      INIT_0A => X"41113564f2bcc18fd59bc0d1325f51eb5d886e17404779a441041f0f07f9c9ee",
--      INIT_0B => X"cad18115af664fd102e1329e0e12b4c21f636c1bdff8e8a3602a9c60257b7834",
--      INIT_0C => X"2da2f728de720c8ce6ba0d9985b2a20eeebeb9223b240b62333e92e16b2395e0",
--      INIT_0D => X"f33e8d1ec39dfd27877d48fa5449a36fe7ccf5f0647d086295b794fdd0127845",
--      INIT_0E => X"db6e6b0d991be14ca1ebddf8a812dc60f4f8fd373a6f6eab992eff740a476341",
--      INIT_0F => X"690fed0bb5390f92cc00ffa3f1290dc7dcd0e8042765d43b6d672c37c67b5510",
--      -- Address 128 to 255
--      INIT_10 => X"763bd6eb7b9479bf515bad24bb132f88d9155ea3a091cf0bcedb7d9c667b9ffb",
--      INIT_11 => X"782ef11c12754cccc66a2b3b6842ada7f42e312d8026e297cc11597937392eb3",
--      INIT_12 => X"e2e1c3c93d25bdd811caedfa1a6b10184bfb635006a1bbe6b79251e76a124237",
--      INIT_13 => X"64e4c3febebfe988da86a85f64af674ed5abea2ad90cec6e0a12138644421659",
--      INIT_14 => X"d736fccc7745ae04f6381fb0d1fd83466003604d60787bf8f0f7c0869dbc8057",
--      INIT_15 => X"bf582e6155464299bde8ae2477a057be3c005e5fb0804187f01eab7183426b33",
--      INIT_16 => X"46fcd9b9b475f255c8b38e745366f9c38789bdc2f474ef38f2ddfda24e58f48f",
--      INIT_17 => X"c902de4c8cd5559120b45770466e598e915f95e2846a0e798b1ddf847aeb2661",
--      INIT_18 => X"c4324633662d09a1e0a9dc09b77f19b67574a99e11a86248bb8205d0b90bace1",
--      INIT_19 => X"2868f169a186f20f0ba5a4df1ab93d1d1d6efe104a99a02509f0be8ce85a1f02",
--      INIT_1A => X"0de6d027a002b5c4a70683fa50115e014fcd7f52a1e2ce9b573906fedcb7da83",
--      INIT_1B => X"30dc7d62006058aac0f586e0f0177a2861a806b5c3604c06773f86419af88c27",
--      INIT_1C => X"ce591d76ebfc7da190bcb6debbcbee56c2c2163453c2dd942338ea6311e69ed7",
--      INIT_1D => X"d39eb8fc1ac15bb4724d9db986e3725f7c927c2439720a3d4b7c01886f05e409",
--      INIT_1E => X"6c51133ca28514d9b161e6f81e50ef5e4dad0fc4d83d7cd308fca5b5ed545578",
--      INIT_1F => X"406000e0670efa8e92638212d79a3234ddc6c837362abfce56e14ec46fd5c7e7",
--      -- Address 256 to 383
--      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
--      -- Address 384 to 511
--      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
--      -- The next set of INITP_xx are for the parity bits
--      -- Address 0 to 127
--      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      -- Address 128 to 255
--      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      -- Address 256 to 383
--      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      -- Address 384 to 511
--      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
--      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000")
--   port map (
--      DO => DO,      -- 32-bit Data Output
--      DOP => DOP,    -- 4-bit parity Output
--      ADDR => ADDR,  -- 9-bit Address Input
--      CLK => CLK,    -- Clock
--      DI => DI,      -- 32-bit Data Input
--      DIP => DIP,    -- 4-bit parity Input
--      EN => EN,      -- RAM Enable Input
--      SSR => SSR,    -- Synchronous Set/Reset Input
--      WE => WE       -- Write Enable Input
--   );








---------------------------------sbox 4 -------------------------------------------------------

RAMB16_S36_inst : RAMB16_S36
   generic map (
      INIT => X"000000000",  --  Value of output RAM registers at startup
      SRVAL => X"000000000", --  Output value upon SSR assertion
      WRITE_MODE => "WRITE_FIRST", --  WRITE_FIRST, READ_FIRST or NO_CHANGE
      -- The following INIT_xx declarations specify the initial contents of the RAM
      -- Address 0 to 127
      INIT_00 => X"99bc9bbed38227404fa337425cb0679e5ac52d1babc27737d3faf5cf3a39ce37",
      INIT_01 => X"6a366eb4b26eb1be21a19045b78c1b6bc700c47bd62d1c7ebf0f7315d5118e9d",
      INIT_02 => X"4cd04dc6d5730a1d468dde7d530ff8ee6549c2c8c6a376d2bc946e795748ab2f",
      INIT_03 => X"9a86ee2263ef8ce26a2d519aa1fad5f0be5ee304ac9526e8a9ba46502939bbdb",
      INIT_04 => X"ba645bd68fe515509be96a4d83c061ba9cf2d0a4a51e03aa43242ef6c089c2b8",
      INIT_05 => X"77fa0a593f046f69f752f7dac72fefd3ef5562e94ba99586a73a3ae12826a2f9",
      INIT_06 => X"022b8b512cf0b7d99e34d797e990fd5a3b3ee5939b09e6ad87b0860180e4a915",
      INIT_07 => X"5a88f54c5ad6b472adf2b89b1f9f25cf7c7d2d28d1cf3ed6017da67d96d5ac3a",
      INIT_08 => X"79132e28f8d56629283b57cce8d3c48ded93fa9b47b0acfde019a5e6e029ac71",
      INIT_09 => X"0564f0bd03a1612588f46dba15056dd4e3d35e8cf7960e44ed756055785f0191",
      INIT_0A => X"26dcf319f59c66fb1e6321f51b3f6d9ba93a072a97271aec3c9057a2c3eb9e15",
      INIT_0B => X"ccad925fabcc5167c20ad9f8285177118aba3cbb03563482b155fdf57533d928",
      INIT_0C => X"774fbe325121ce64fb3e7bceea7a90c29320f991379d58623830dc8e4de81751",
      INIT_0D => X"0907216669852dfddd6db224a2ae08106413e68048de5369c3293d46a8b6e37e",
      INIT_0E => X"6bb4e3bbccd2017f1b588d405bbef7dd1c20c8ae586cdecf6445c0ddb39a460a",
      INIT_0F => X"bf3c6f478d6612aefa6484bb72eacea8bcb4cdd53e350a443a59ff45dda26a7e",
      -- Address 128 to 255
      INIT_10 => X"af537d5df8721671e75b1357740e0d8df64e6370aec2771b542f5d9ed29be463",
      INIT_11 => X"ce6ea04806b89fb495983a1de1b004280115af8434d2466a4eb4e2cc4040cb08",
      INIT_12 => X"344525bdbb3a792be7933fdc611560b1277227f8011a1d4b3520ab826f3f3b82",
      INIT_13 => X"a1e8aac7cf0111c3bcc7d1f6e01cc87ea01fbac92f32c9b751ce794ba08839e1",
      INIT_14 => X"e0b12b4f8df9317cc69136670339c32ad50ada38d0dadecbd44fbd9a1a908749",
      INIT_15 => X"9b9415250f91fc7115e6fc2abf97222c27d9459cf2d519ff43f5bb3af79e59b7",
      INIT_16 => X"cb03a44210d25065e3056a0cb6c1075e12baa8d1c2a86459ceb69cebfae59361",
      INIT_17 => X"8971f21ed3a0342be0d392df9f1f95323278e9644c98a0be1698db3be0ec6e0e",
      INIT_18 => X"0fe3f11de60b6f479b992f2edf359f8dc37632d8c5be71204ba3348c1b0a7441",
      INIT_19 => X"f6fb2299848fd2c5fd2c1d051618b166cd3e7e6fce6279cf1edad891e54cda54",
      INIT_1A => X"88d273cc6e1636975a75ebb5acf0816256cccd0293a83531a6327623f523f357",
      INIT_1B => X"c3f27b9a45e1d006327a140ae6c6c7bd71c656144c50901b81b949d0de966292",
      INIT_1C => X"cd769c2bb6cbcf7cb20402227112690535bdd2f6bb25bfe262a80f00c9aa53fd",
      INIT_1D => X"2075606077afa1c5f746ce76ba38209c2547adf038abbd601640e3d353113ec0",
      INIT_1E => X"d6ebe1f901c36ae402fb8a8c1948c25c4cf9aa7e7aaaf9b08ae88dd885cbfe4e",
      INIT_1F => X"3ac372e6578fdfe3ce77e25bb74e6132c208e69f3f09252da65cdea090d4f869",
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
      ADDR => ADDR,  -- 9-bit Address Input
      CLK => CLK,    -- Clock
      DI => DI,      -- 32-bit Data Input
      DIP => DIP,    -- 4-bit parity Input
      EN => EN,      -- RAM Enable Input
      SSR => SSR,    -- Synchronous Set/Reset Input
      WE => WE       -- Write Enable Input
   );
	end Behavioral;

