library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decoder_5to32 is 
	port(
       Input  : in std_logic_vector(4 downto 0);
		 Enable : in std_logic;
		 Output : out std_logic_vector(31 downto 0)
		);
end entity decoder_5to32;




architecture behaviour of decoder_5to32 is 


begin


process(Enable, Input)
begin
  Output <= (others => '0');
  if Enable = '1' then
    Output(to_integer(unsigned(Input))) <= '1';
  end if;
end process;



end architecture;