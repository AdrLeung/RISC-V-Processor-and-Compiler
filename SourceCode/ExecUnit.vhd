library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ExecUnit is 
generic(N : natural := 64);
port(       
		  A, B      : in  std_logic_vector(N-1 downto 0);
		  LogicFN   : in std_logic_vector(1 downto 0);
		  ShiftFN   : in std_logic_vector(1 downto 0);
		  FuncClass : in std_logic_vector(1 downto 0);
		  ExtWord   : in std_logic;
		  AddNSub   : in std_logic;
        Y         : out std_logic_vector(N-1 downto 0);
		  Zero      : out std_logic;
		  AltB      : out std_logic;
		  AltBu     : out std_logic	
        
	);
	
end entity ExecUnit;


architecture structural of ExecUnit is

component BrentKungAdder is 
    generic (N : natural := 64);
    port (
        A, B : in  std_logic_vector(N-1 downto 0);
		  Cin  : in  std_logic;
        S    : out std_logic_vector(N-1 downto 0);
		  Cout : out std_logic;
		  Ovfl : out std_logic        
    );
end component BrentKungAdder;

component ShiftUnit is 
	generic (N: natural:=64);
	port(
		A       : in  std_logic_vector(N-1 downto 0);
		B       : in  std_logic_vector(N-1 downto 0);
	   ShiftFN : in  std_logic_vector(1 downto 0);
		ExtWord : in  std_logic;
	   Y_shift : out std_logic_vector(N-1 downto 0)
	);
end component ShiftUnit;


component LogicUnit is
	generic (N: natural := 64);
	port(
	   A,B : in std_logic_vector(N-1 downto 0);
		LogicFN : in std_logic_vector(1 downto 0);
		LogicOut: out std_logic_vector (N-1 downto 0)
	);
	
end component LogicUnit;

signal input_to_Adder: std_logic_Vector(N-1 downto 0);
signal Cout : std_logic;
signal Ovfl : std_logic;
signal Y_adder: std_logic_vector (N-1 downto 0);
signal Y_adder_initial: std_logic_vector (N-1 downto 0);
signal Y_shifter : std_logic_vector (N-1 downto 0);
signal Y_arthmetic: std_logic_vector (N-1 downto 0);
signal Y_logic : std_logic_vector (N-1 downto 0);
signal Y_AltB  : std_logic_vector (N-1 downto 0) := (others => '0');
signal Y_AltBu  : std_logic_vector (N-1 downto 0) := (others => '0');

begin

/* choose the correct operand depending on if it's addition or subtraction*/


input_to_adder <= B when AddNSub = '0' else not B;


Adder0: BrentKungAdder port map(A => A, B=> input_to_adder, Cin => AddNSub, S => Y_adder_initial, Cout => Cout, Ovfl => Ovfl);

Zero <= '1' when unsigned(Y_adder) = 0 else '0';
AltBu <= not Cout;
AltB <= 	Ovfl xor Y_adder(63);
Y_AltB(0) <= AltB;
Y_AltBu(0) <= AltBu;

Y_adder <= Y_adder_initial when ExtWord = '0' else  (63 downto 32 => Y_adder_initial (31)) & Y_adder_initial(31 downto 0);

ShiftUnit0: ShiftUnit port map (A=>A, B=>B, ShiftFN => ShiftFN, ExtWord => ExtWord, Y_shift => Y_shifter);

Y_arthmetic <= Y_adder when ShiftFN = "00" else Y_shifter;


LogicUnit0: LogicUnit port map (A => A, B=>B, LogicFN => LogicFN, LogicOut => Y_logic);

with FuncClass select 
	Y <= Y_arthmetic when "00",
	     Y_logic     when "01",
		  Y_AltB      when "10",
		  Y_AltBu     when "11";
	     

end architecture;