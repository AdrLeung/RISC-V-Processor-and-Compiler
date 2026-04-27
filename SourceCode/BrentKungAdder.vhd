library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BrentKungAdder is
    generic (N : natural := 64);
    port (
        A, B : in  std_logic_vector(N-1 downto 0);
        S    : out std_logic_vector(N-1 downto 0);
        Cin  : in  std_logic;
        Cout : out std_logic;
        Ovfl : out std_logic
    );
end entity BrentKungAdder;	

architecture structural of BrentKungAdder is
signal G : std_logic_vector(N-1 downto 0);
signal P : std_logic_vector(N-1 downto 0);


begin


/* first we need to make the generate and propagate block*/

PnGblock: for i in 0 to N-1 generate
	G(i) <= A(i) and B(i);
	P(i) <= A(i) xor B(i);
end generate;



end architecture;
