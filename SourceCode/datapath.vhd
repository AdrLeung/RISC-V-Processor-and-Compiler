library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity datapath is
	port(
		Clk      : in std_logic;
		AddnSub  : in std_logic;
		ExtWord  : in std_logic;
		PCwr     : in std_logic;
		InstAddr : in std_logic;
		MemSize  : in std_logic_vector(2 downto 0);
		MemWr    : in std_logic;
		MemRd    : in std_logic;
		IRWr     : in std_logic;
		RegWr    : in std_logic;
		RegInSrc : in std_logic;
		ExuSrcB  : in std_logic_vector(2 downto 0);
		ExuSrcA  : in std_logic;
		FuncClass: in std_logic_vector(1 downto 0);
		ShiftFn  : in std_logic_vector(1 downto 0);
		LogicFn  : in std_logic_vector(1 downto 0);
		PCSrc    : in std_logic_vector(1 downto 0);
		Opcode   : out std_logic_vector(6 downto 0);
		funct7   : out std_logic_vector(6 downto 0);
		funct3   : out std_logic_vector(2 downto 0);
		Zero     : out std_logic;
		AltB     : out std_logic;
		AltBu    : out std_logic
	);
end entity datapath;



component ExecUnit is 
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
	
end component ExecUnit;

component MemUnit is
	 Port (
        clk      : in  std_logic;
        Address  : in  std_logic_vector(63 downto 0);
        DataIn   : in  std_logic_vector(63 downto 0);
        DataOut  : out std_logic_vector(63 downto 0);
        MemSize  : in  std_logic_vector(2 downto 0);
        MemWr    : in  std_logic;
        MemRd    : in  std_logic
    );
end component MemUnit;


component decode_stage is
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
end component decode_stage;


component Reg is 
	generic(N: natural := 64);
	port(
		Datain  : in std_logic_vector(N-1 downto 0);
		Clk     : in std_logic;
		Enable  : in std_logic;
		DataOut : out std_logic_vector(N-1 downto 0)
	);
	
end component Reg;

component RegFile is 
		generic(N    : natural:= 64;
	        Regs : natural:= 32
			 );
	port(
		Rs1    : in std_logic_vector(4 downto 0); -- these are bits to select which register
		Rs2    : in std_logic_vector(4 downto 0); -- these are bits to select which register
		Rd     : in std_logic_vector(4 downto 0); -- these are bits to select which register
		Rdin   : in std_logic_vector(N-1 downto 0); -- register value we want to write
		RegWr  : in std_logic; -- write signal for registers
		Clk    : in std_logic;
		Rs1Out : out std_logic_vector(N-1 downto 0); -- operand bits
		Rs2Out : out std_logic_vector(N-1 downto 0)  -- operand bits
		);
end component RegFile;


signal Address : std_logic_vector(63 downto 0);
signal MemIn  : std_logic_vector(63 downto 0);
signal MemOut : std_logic_vector(63 downto 0);
signal PCout   : std_logic_vector(63 downto 0);
signal XregisterOut : std_logic_vector(63 downto 0);
signal IROut : std_logic_vector (63 downto 0);
signal DROut : std_logic_vector (63 downto 0);
signal Rs1Out: std_logic_vector (63 downto 0);
signal Rs2Out: std_logic_vector (63 downto 0);
signal ACI   : std_logic_vector (63 downto 0);
signal SextJ        : std_logic_vector(63 downto 0);
signal SextB        : std_logic_vector(63 downto 0);
signal SextU        : std_logic_vector(63 downto 0);
signal SextI        : std_logic_vector(63 downto 0);
signal SextS        : std_logic_vector(63 downto 0);
signal Rs1            : std_logic_Vector(4 downto 0);
signal Rs2            : std_logic_vector(4 downto 0);
signal Rd             : std_logic_Vector(4 downto 0);
signal Rdin  : std_logic_vector(63 downto 0);
signal Rs1Out : std_logic_vector(63 downto 0); -- operand bits
signal Rs2Out : std_logic_vector(63 downto 0)  -- operand bits
signal Rs1Out_s : std_logic_vector(63 downto 0); -- operand bits
signal Rs2Out_s : std_logic_vector(63 downto 0)  -- operand bits
signal A : std_logic_vector (63 downto 0);
signal B : std_logic_vector (63 downto 0);
signal ExuOUt: std_logic_vector(63 downto 0);

architecture structural of datapath is


		

		
SharedCache: MemUnit port map(clk => Clk, Address => Address, DataIn => MemIn, DataOut => MemOut, MemSize => MemSize, MemRd => MemRd, MemWr => MemWr);




X: Reg port map(Clk => Clk, Datain => PCout, DataOut => XregisterOut, Enable => IRWr);

IR: Reg port map (Clk => Clk, Datain => MemOut, DataOut => IROut, Enable => IRWr);

DR: Reg port map (Clk => Clk, Datain => MemOut, Dataout => DROut, Enable => '1');

ACI <= PCout when IRWr = '1' else Xregisterout;


decode_stage1: decode_stage port map(instructionbits => IROut(31 downto 0), Rs1 => Rs1, Rs2=>Rs2,Rd=>Rd,opcode => Opcode, funct3=> funct3, funct7=>funct7, SextJ => SextJ, SextB=>SextB, SextU=> SextU, SextI=> SextI, SextS=>SextS);

reg_file: RegFile port map(Rs1 => Rs1, Rs2 => Rs2, Rdin => Rdin, RegWr=>RegWr, Clk=>Clk, Rs1Out => Rs1Out, Rs2Out => Rs2Out);

A: Reg port map (Clk => Clk, Datain => Rs1Out, Dataout => Rs1Out_s, Enable => '1');
B: Reg port map (Clk => Clk, Datain => Rs2Out, Dataout => Rs2Out_s, Enable => '1');

MemIn <= Rs2Out_s;

A <= Rs1Out_s when ExuSrcA = '0' else ACI;


with ExuSrcB select
    B <= Rs2Out_s when "000",
         SextI    when "001",
         SextS    when "010",
         SextU    when "011",
         SextB    when "100",
         SextJ    when "101",
         "0000000000000000000000000000000000000000000000000000000000000100" when "111",
         (others => '0') when others;
			
ALU : ExecUnit port map( A => A, B => B, LogicFN => LogicFn, ShiftFN => ShiftFn, ExtWord => ExtWord, AddNSub => AddNSub, Y => ExuOUt, Zero => Zero, AltB => AltB, AltBu => AltBu);

end architecture;
