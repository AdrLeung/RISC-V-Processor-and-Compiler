library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity UpI is 

port(

	rawImmediate : in std_logic_vector(24 downto 0);
	SextJ          : out std_logic_vector(63 downto 0);
	SextB          : out std_logic_Vector(63 downto 0);
	SextI          : out std_logic_Vector(63 downto 0);
	SextU          : out std_logic_vector(63 downto 0);
	SextS          : out std_logic_vector(63 downto 0)
);

end entity UpI;

architecture rtl of UpI is



begin 


SextI(11 downto 0) <= rawImmediate(24 downto 13);
SextI(63 downto 12) <= (others => rawImmediate(24));


SextU(11 downto 0)  <= (others => '0');              -- lower 12 bits always 0
SextU(31 downto 12) <= rawImmediate(24 downto 5);    -- the immediate itself
SextU(63 downto 32) <= (others => rawImmediate(24)); 


SextJ(20 downto 0) <= rawImmediate(24) & rawImmediate(12 downto 5) & rawImmediate(13) & rawImmediate(23 downto 14) & '0';
SextJ(63 downto 21) <= (others => rawImmediate(24));

SextS(11 downto 0) <= rawImmediate(24 downto 18) & rawImmediate(4 downto 0);
SextS(63 downto 12) <= (others => rawImmediate(24));


SextB(12 downto 0) <= rawImmediate(24) & rawImmediate(0) & rawImmediate(23 downto 18) & rawImmediate(4 downto 1) & '0';
SextB(63 downto 13) <= (others => rawImmediate(24));


end architecture;