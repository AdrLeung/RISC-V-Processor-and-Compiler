library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity decode_stage is 

 port(
	instructionbits: in 	std_logic_Vector(31 downto 0);
	Rs1            : out std_logic_Vector(4 downto 0);
	Rs2            : out std_logic_vector(4 downto 0);
	Rd             : out std_logic_Vector(4 downto 0);
	opcode         : out std_logic_vector(6 downto 0);
	funct3         : out std_logic_Vector(2 downto 0);
	funct7         : out std_logic_vector(6 downto 0);
	SextJ          : out std_logic_vector(63 downto 0);
   SextB          : out std_logic_vector(63 downto 0);
   SextU          : out std_logic_vector(63 downto 0);
   SextI          : out std_logic_vector(63 downto 0);
   SextS          : out std_logic_vector(63 downto 0)

	);
	
end entity decode_stage;




architecture strucutral of decode_stage is

signal rawImmediate : std_logic_vector(24 downto 0);
signal SextJ        : std_logic_vector(63 downto 0);
signal SextB        : std_logic_vector(63 downto 0);
signal SextU        : std_logic_vector(63 downto 0);
signal SextI        : std_logic_vector(63 downto 0);
signal SextS        : std_logic_vector(63 downto 0);

 
begin

Rd <= instructionbits(11 downto 7); -- goes to register file
Rs2 <= instructionbits(24 downto 20);-- goes to register file
Rs1 <= instructionbits(19 downto 15);-- goes to register file
opcode<= instructionbits(6 downto 0); -- goes to control unit
funct3 <= instructionbits(14 downto 12);-- goes to control unit
funct7 <= instructionbits(31 downto 25); -- goes to control unit
rawImmediate <= instructionbits(31 downto 7); -- goes to UpI circuit



UpI1: entity work.UpI
	port map(rawImmediate => rawImmediate, SextJ => SextJ, SextB => sextB, SextU => SextU, SextI => SextI, SextS => SextS);





end architecture decode_stage;	