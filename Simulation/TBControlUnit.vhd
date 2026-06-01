
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity TBControlUnit is
end entity TBControlUnit;

architecture testbench of TBControlUnit is 
	component ControlUnit is
	  port(
	   	Clk      : in std_logic;
		Opcode   : in std_logic_vector(6 downto 0);
		funct7   : in std_logic_vector(6 downto 0);
		funct3   : in std_logic_vector(2 downto 0);
		Zero     : in std_logic;
		AltB     : in std_logic;
		AltBu    : in std_logic;
		AddnSub  : out std_logic;
		ExtWord  : out std_logic;
		PCwr     : out std_logic;
		InstAddr : out std_logic;
		MemSize  : out std_logic_vector(2 downto 0);
		MemWr    : out std_logic;
		MemRd    : out std_logic;
		IRWr     : out std_logic;
		RegWr    : out std_logic;
		RegInSrc : out std_logic;
		ExuSrcB  : out std_logic_vector(2 downto 0);
		ExuSrcA  : out std_logic;
		FuncClass: out std_logic_vector(1 downto 0);
		ShiftFn  : out std_logic_vector(1 downto 0);
		LogicFn  : out std_logic_vector(1 downto 0);
		PCSrc    : out std_logic_vector(1 downto 0)
	   );
	end component;

	signal ClkTB : std_logic := '0';
	signal OpcodeTB : std_logic_vector(6 downto 0);
	signal funct7TB : std_logic_vector(6 downto 0);
	signal funct3TB : std_logic_vector(2 downto 0);
	signal ZeroTB  : std_logic;
	signal AltBTB  : std_logic;
	signal AltBuTB   : std_logic;
	signal AddnSubTB : std_logic;
	signal ExtWordTB  : std_logic;
	signal PCwrTB     : std_logic;
	signal InstAddrTB : std_logic;
	signal MemSizeTB  : std_logic_vector(2 downto 0);
	signal MemWrTB    : std_logic;
	signal MemRdTB    : std_logic;
	signal IRWrTB    : std_logic;
	signal RegWrTB    : std_logic;
	signal RegInSrcTB : std_logic;
	signal ExuSrcBTB  : std_logic_vector(2 downto 0);
	signal ExuSrcATB : std_logic;
	signal FuncClassTB : std_logic_vector(1 downto 0);
	signal ShiftFnTB  : std_logic_vector(1 downto 0);
	signal LogicFnTB  : std_logic_vector(1 downto 0);
	signal PCSrcTB    : std_logic_vector(1 downto 0);
	
	constant clk_period : time := 10 ns;

begin

dut: ControlUnit
port map (
   Clk => ClkTB,     
   Opcode => OpcodeTB,  
   funct7 => funct7TB,   
   funct3 => funct3TB,   
   Zero => ZeroTB,    
   AltB => AltBTB,     
   AltBu =>  AltBuTB,    
   AddnSub => AddnSubTB,  
   ExtWord  => ExtWordTB, 
   PCwr => PCwrTB,     
   InstAddr => InstAddrTB, 
   MemSize => MemSizeTB,  
   MemWr  => MemWrTB,   
   MemRd => MemRdTB,    
   IRWr  => IRWrTB,   
   RegWr => RegWrTB,    
   RegInSrc => RegInSrcTB, 
   ExuSrcB  => ExuSrcBTB, 
   ExuSrcA => ExuSrcATB, 
   FuncClass=> FuncClassTB, 
   ShiftFn=> ShiftFnTB,   
   LogicFn => LogicFnTB, 
   PCSrc   => PCSrcTB  
);



clk_process: process
begin
	ClkTB <='0'; wait for clk_period/2;
	ClkTB <='1'; wait for clk_period/2;
end process;

stim_process: process
begin
-- Wait for reset / initial state
wait until rising_edge(ClkTB);
OpcodeTB <= "1100011";
funct7TB <= "0000000";
funct3TB <= "000";
ZeroTB   <= '1';
AltBTB   <= '0';
AltBuTB  <= '0';  -- edge 1: Fetch
wait until rising_edge(ClkTB);  -- edge 2: -> Decode

-- Now apply BEQ inputs, stable before edge 3


wait until rising_edge(ClkTB);  -- edge 3: -> BranchExecute           -- edge 4: -> Fetch (check PCwr here)



wait;
end process;

end testbench;
