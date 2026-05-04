library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LogicUnit is
	generic (N: natural := 64);
	port(
	   A,B : in std_logic_vector(N-1 downto 0);
		LogicFN : in std_logic_vector(1 downto 0);
		LogicOut: out std_logic_vector (N-1 downto 0)
	);
	
end entity LogicUnit;


architecture rtl of LogicUnit is
signal output_xor : std_logic_vector(N-1 downto 0);
signal output_or  : std_logic_vector(N-1 downto 0);
signal output_and : std_logic_vector(N-1 downto 0);
signal output_lui : std_logic_vector(N-1 downto 0);

begin

output_xor <= A xor B;
output_or  <= A or  B;
output_and <= A and B;
output_lui <= B; -- sextu comes in the right format already

with LogicFN select
	LogicOut <= output_xor when "01",
				   output_and when "10",
					output_or  when "11",
					output_lui when "00";
					

end architecture;