library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity Reg is 
	generic(N: natural := 64);
	port(
		Datain  : in std_logic_vector(N-1 downto 0);
		Clk     : in std_logic;
		Enable  : in std_logic;
		DataOut : out std_logic_vector(N-1 downto 0)
	);
	
end entity Reg;

-- the data going into the register and data going out of the register should be parallely loaded in and parallely loaded out


architecture behavioural of Reg is


begin

process(Clk)
begin
if (rising_edge(Clk)) then
if Enable = '1' then
	DataOut <= Datain;
end if;

end if;
end process;


end behavioural;





