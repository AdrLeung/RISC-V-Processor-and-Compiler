library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ControlUnit is 

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
end entity ControlUnit;


architecture behaviour of ControlUnit is 
Type StateName is (Fetch, Decode, BranchExecute, ArthemeticExecute, ArthemeticWriteBack,JumpExecute,storeLoadExecute, memAccessLoad,writeBackLoad,memAccessStore);

signal PresentState, NextState : StateName;
begin 




NextState <= 
           Decode              when PresentState = Fetch else
           ArthemeticExecute   when PresentState = Decode and (Opcode = "0110011"  or Opcode = "0010011" or Opcode = "0110111" or Opcode = "0010111" or Opcode = "0111011" or Opcode = "0011011") else -- still need to include W instructions
           BranchExecute       when PresentState = Decode and (Opcode = "1100011") else
			  JumpExecute         when PresentState = Decode and (Opcode = "1101111" or Opcode = "1100111") else
			  storeLoadExecute    when PresentState = Decode and (Opcode = "0000011" or Opcode = "0100011") else
           ArthemeticWriteBack when PresentState = ArthemeticExecute else
			  memAccessStore      when PresentState = storeLoadExecute and (Opcode = "0100011") else
			  memAccessLoad       when PresentState = storeLoadExecute and (Opcode = "0000011") else
			  writeBackLoad       when PresentState = memAccessLoad else
			  Fetch;
           
state_register: process(Clk)
begin
    if rising_edge(Clk) then
        PresentState <= NextState;
    end if;
end process;



process(PresentState, Opcode,funct7,funct3,Zero,AltB,AltBu)

begin
    PCSrc     <= "00";
    PCWr      <= '0';
    InstAddr  <= '0';
    MemSize   <= "000";
    MemWr     <= '0';
    MemRd     <= '0';
    IRWr      <= '0';
    RegWr     <= '0';
    RegInSrc  <= '0';
    ExuSrcB   <= "000";
    ExuSrcA   <= '0';
    FuncClass <= "00";
    LogicFn   <= "00";
    ShiftFn   <= "00";
    AddNSub   <= '0';
    ExtWord   <= '0';

if PresentState = Fetch then
	PCSrc     <= "10";
	PCWr      <= '1';
	InstAddr  <= '1';
	MemSize   <= "000";
	MemWr     <= '0';
	MemRd     <= '1';
	IRWr      <= '1';
	RegWr     <= '0';
	RegInSrc  <= '-';
	ExuSrcB   <= "111";
	ExuSrcA   <= '1';
	FuncClass <= "00";
	LogicFn   <= "--";
	ShiftFn   <= "00";
	AddNSub   <= '0';
	ExtWord   <= '0';
	
elsif PresentState = Decode then
	PCSrc     <= "--";
	PCWr      <= '0';
	InstAddr  <= '-';
	MemSize   <= "---";
	MemWr     <= '0';
	MemRd     <= '0';
	IRWr      <= '0';
	RegWr     <= '0';
	RegInSrc  <= '-';
	ExuSrcB   <= "100";
	ExuSrcA   <= '1';
	FuncClass <= "00";
	LogicFn   <= "--";
	ShiftFn   <= "00";
	AddNSub   <= '0';
	ExtWord   <= '0';

elsif PresentState = JumpExecute then


	if Opcode = "1101111" then
		PCSrc     <= "10";
		PCWr      <= '1';
		InstAddr  <= '1';
		MemSize   <= "---";	
		MemWr     <= '0';
		MemRd     <= '0';
		IRWr      <= '0';
		RegWr     <= '1';
		RegInSrc  <= '1';
		ExuSrcB   <= "101";
		ExuSrcA   <= '1';
		FuncClass <= "00";
		LogicFn   <= "--";
		ShiftFn   <= "00";
		AddNSub   <= '0';
		ExtWord   <= '0';
	else 
		PCSrc     <= "11";
		PCWr      <= '1';
		InstAddr  <= '1';
		MemSize   <= "---";	
		MemWr     <= '0';
		MemRd     <= '0';
		IRWr      <= '0';
		RegWr     <= '1';
		RegInSrc  <= '1';
		ExuSrcB   <= "001";
		ExuSrcA   <= '0';
		FuncClass <= "00";
		LogicFn   <= "--";
		ShiftFn   <= "00";
		AddNSub   <= '0';
		ExtWord   <= '0';
end if;

elsif PresentState = ArthemeticExecute then
 
		PCSrc     <= "--";
		PCWr      <= '0';
		InstAddr  <= '-';
		MemSize   <= "---";
		MemWr     <= '0';
		MemRd     <= '0';
		IRWr      <= '0';
		RegWr     <= '0';
		RegInSrc  <= '-';
		
	if Opcode = "0110011" then  -- R-type instructions (non - W instructions)
		ExuSrcB <= "000";
		ExuSrcA <= '0';
		case funct3	is 
			when "000" =>
				if funct7 = "0000000" then -- addition
					FuncClass <= "00";
					LogicFn   <= "--";
					ShiftFn   <= "00";
					AddNSub   <= '0';
					ExtWord   <= '0';
				elsif funct7 = "0100000" then -- subtraction
					FuncClass <= "00";
					LogicFn   <= "--";
					ShiftFn   <= "00";
					AddNSub   <= '1';
					ExtWord   <= '0';
			end if;
		
	    when "100" =>
			if funct7 = "0000000" then -- XOR
					FuncClass <= "01";
					LogicFn   <= "01";
					ShiftFn   <= "--";
					AddNSub   <= '-';
					ExtWord   <= '-';
			end if;
		when "110" =>
			if funct7 = "0000000" then -- OR
					FuncClass <= "01";
					LogicFn   <= "11";
					ShiftFn   <= "--";
					AddNSub   <= '-';
					ExtWord   <= '-';
			end if;
			when "111" =>
			if funct7 = "0000000" then -- AND
					FuncClass <= "01";
					LogicFn   <= "10";
					ShiftFn   <= "--";
					AddNSub   <= '-';
					ExtWord   <= '-';
			end if;
		when "001" =>
			if funct7 = "0000000" then -- SLL
					FuncClass <= "00";
					LogicFn   <= "--";
					ShiftFn   <= "01";
					AddNSub   <= '-';
					ExtWord   <= '0';
			end if;
		when "101" =>
			if funct7 = "0000000" then -- SRL
					FuncClass <= "00";
					LogicFn   <= "--";
					ShiftFn   <= "10";
					AddNSub   <= '-';
					ExtWord   <= '0';
			elsif funct7 = "0100000" then --SRA
					FuncClass <= "00";
					LogicFn   <= "--";
					ShiftFn   <= "11";
					AddNSub   <= '-';
					ExtWord   <= '0';
			end if;
		when "010" =>
			if funct7 = "0000000" then -- SLT
					FuncClass <= "10";
					LogicFn   <= "--";
					ShiftFn   <= "--";
					AddNSub   <= '1';
					ExtWord   <= '0';
			end if;
		when "011" =>
			if funct7 = "0000000" then -- SLTU
					FuncClass <= "11";
					LogicFn   <= "--";
					ShiftFn   <= "--";
					AddNSub   <= '1';
					ExtWord   <= '0';
			end if;
		when others => null;
	end case;
	
	elsif Opcode = "0010011" then -- I-Type
		ExuSrcB <= "001";
		ExuSrcA <= '0';
	
		case funct3 is
			when "000" =>	   -- addi
				FuncClass <= "00";
			   LogicFn   <= "--";
				ShiftFn   <= "00";
				AddNSub   <= '0';
				ExtWord   <= '0';
			when "100" =>    -- xori
				FuncClass <= "01";
				LogicFn   <= "01";
				ShiftFn   <= "--";
				AddNSub   <= '-';
				ExtWord   <= '-';
			when "110" =>    -- ori
				FuncClass <= "01";
				LogicFn   <= "11";
				ShiftFn   <= "--";
				AddNSub   <= '-';
				ExtWord   <= '-';
			when "111" =>   -- andi
				FuncClass <= "01";
				LogicFn   <= "10";
				ShiftFn   <= "--";
				AddNSub   <= '-';
				ExtWord   <= '-';
			when "010" => --slti
				FuncClass <= "10";
				LogicFn   <= "--";
				ShiftFn   <= "--";
				AddNSub   <= '1';
				ExtWord   <= '0';
			when "011" =>  -- sltiu
				FuncClass <= "10";
				LogicFn   <= "--";
				ShiftFn   <= "--";
				AddNSub   <= '1';
				ExtWord   <= '0';
				
			when "001" => -- Slli
				FuncClass <= "00";
				LogicFn   <= "--";
				ShiftFn   <= "01";
				AddNSub   <= '-';
				ExtWord   <= '0';
			when "101" =>
				if funct7 = "0000000" then-- srli
					FuncClass <= "00";
					LogicFn   <= "--";
					ShiftFn   <= "10";
					AddNSub   <= '-';
					ExtWord   <= '0';
				elsif funct7 = "0100000" then -- srai
					FuncClass <= "00";
					LogicFn   <= "--";
					ShiftFn   <= "11";
					AddNSub   <= '-';
					ExtWord   <= '0';
				end if;
		   when others => null;
		end case;
		
	elsif Opcode = "0110111" then -- U type instructions (LUI)
		ExuSrcB <= "011";
		ExuSrcA <= '0';
		FuncClass <= "01";
		LogicFn   <= "00";
		ShiftFn   <= "--";
		AddNSub   <= '-';
		ExtWord   <= '-';
	elsif Opcode = "0010111" then -- U type instructions (AUIPC)
		ExuSrcB <= "011";
		ExuSrcA <= '1';
		FuncClass <= "00";
		LogicFn   <= "--";
		ShiftFn   <= "00";
		AddNSub   <= '0';
		ExtWord   <= '0';
	elsif Opcode = "0111011" then -- W instructions (R-Type)
		case funct3	is 
			when "000" =>
				if funct7 = "0000000" then -- addition
					FuncClass <= "00";
					LogicFn   <= "--";
					ShiftFn   <= "00";
					AddNSub   <= '0';
					ExtWord   <= '1';
				elsif funct7 = "0100000" then -- subtraction
					FuncClass <= "00";
					LogicFn   <= "--";
					ShiftFn   <= "00";
					AddNSub   <= '1';
					ExtWord   <= '1';
			end if;
					when "001" =>
			if funct7 = "0000000" then -- SLLW
					FuncClass <= "00";
					LogicFn   <= "--";
					ShiftFn   <= "01";
					AddNSub   <= '-';
					ExtWord   <= '1';
			end if;
		 when "101" =>
			if funct7 = "0000000" then -- SRLW
					FuncClass <= "00";
					LogicFn   <= "--";
					ShiftFn   <= "10";
					AddNSub   <= '-';
					ExtWord   <= '1';
			elsif funct7 = "0100000" then --SRAW
					FuncClass <= "00";
					LogicFn   <= "--";
					ShiftFn   <= "11";
					AddNSub   <= '-';
					ExtWord   <= '1';
			end if;
		when others => null;
 end case;
  elsif Opcode = "0011011" then 
		case funct3 is
			when "000" =>	   -- addiw
				FuncClass <= "00";
			   LogicFn   <= "--";
				ShiftFn   <= "00";
				AddNSub   <= '0';
				ExtWord   <= '1';
			when "001" => -- Slliw
				FuncClass <= "00";
				LogicFn   <= "--";
				ShiftFn   <= "01";
				AddNSub   <= '-';
				ExtWord   <= '1';
			when "101" =>
				if funct7 = "0000000" then-- srliw
					FuncClass <= "00";
					LogicFn   <= "--";
					ShiftFn   <= "10";
					AddNSub   <= '-';
					ExtWord   <= '1';
				elsif funct7 = "0100000" then -- sraiw
					FuncClass <= "00";
					LogicFn   <= "--";
					ShiftFn   <= "11";
					AddNSub   <= '-';
					ExtWord   <= '1';
				end if;
		   when others => null;
		end case;
	
end if;

elsif PresentState = storeLoadExecute then
		PCSrc     <= "--";
		PCWr      <= '0';
		InstAddr  <= '-';
		MemSize   <= "---";
		MemWr     <= '0';
		MemRd     <= '0';
		IRWr      <= '0';
		RegWr     <= '0';
		RegInSrc  <= '-';
		ExuSrcA <= '0';
		FuncClass <= "00";
		LogicFn   <= "--";
		ShiftFn   <= "00";
		AddNSub   <= '0';
		ExtWord   <= '0';
	if Opcode = "0000011" then
				ExuSrcB   <= "001"; -- Load
		else 
				ExuSrcB   <= "010"; -- Store
  end if;

elsif PresentState = BranchExecute then

		PCSrc     <= "01";
		InstAddr  <= '1';
		MemSize   <= "---";	
		MemWr     <= '0';
		MemRd     <= '0';
		IRWr      <= '0';
		RegWr     <= '0';
		RegInSrc  <= '-';
		ExuSrcB   <= "000";
		ExuSrcA   <= '0';
		FuncClass <= "00";
		LogicFn   <= "--";
		ShiftFn   <= "00";
		AddNSub   <= '1';
		ExtWord   <= '0';
	case funct3 is 
		when "000" => 
			if (Zero = '1') then -- BEQ
				PCWr <= '1';
			else
				PCWr <= '0';
			end if;
		when "001" =>
			if (Zero = '0') then -- BNE
				PCWr <= '1';
			else 
				PCWr <= '0';
			end if;
		when "100" =>
			if (AltB = '1') then -- BLT
				PCWr <= '1';
			else
				PCWr <= '0';
			end if;
		when "110" =>
			if (AltBu = '1') then -- BLTU
				PCWr <= '1';
			else 
				PCWr <= '0';
			end if;
		when "101" =>
			if (Zero = '1' or AltB = '0') then -- BGE
				PCWr <= '1';
			else
				PCWr <= '0';
			end if;
		when "111"=>
			if (Zero = '1' or AltBu = '0') then -- BGEU
				PCWr <= '1';
			else 
				PCWr <= '0';
			end if;
		when others => null;
	end case;
elsif PresentState = ArthemeticWriteBack then
	 PCSrc     <= "--";
    PCWr      <= '0';
    InstAddr  <= '0';
    MemSize   <= "---";
    MemWr     <= '0';
    MemRd     <= '0';
    IRWr      <= '0';
    RegWr     <= '1';
    RegInSrc  <= '0';
    ExuSrcB   <= "---";
    ExuSrcA   <= '-';
    FuncClass <= "--";
    LogicFn   <= "--";
    ShiftFn   <= "--";
    AddNSub   <= '-';
    ExtWord   <= '-';
elsif PresentState = memAccessLoad then
	 PCSrc     <= "--";
    PCWr      <= '0';
    InstAddr  <= '0';
    MemWr     <= '0';
    MemRd     <= '1';
    IRWr      <= '0';
    RegWr     <= '0';
    RegInSrc  <= '0';
    ExuSrcB   <= "---";
    ExuSrcA   <= '-';
    FuncClass <= "--";
    LogicFn   <= "--";
    ShiftFn   <= "--";
    AddNSub   <= '-';
    ExtWord   <= '-';
	 
	 case funct3 is 
		when "000" =>
			MemSize <= "101";
		when "001" =>
			MemSize <= "110";
		when "010" =>
			MemSize <= "111";
		when "100" =>
			MemSize <= "001";
		when "101" =>
			MemSize <= "010";
		when "110" =>
			MemSize <= "011";
		when others => null;
	
	end case;
elsif PresentState = writeBackLoad then
	 PCSrc     <= "--";
    PCWr      <= '0';
    InstAddr  <= '0';
	 MemSize   <= "---";
    MemWr     <= '0';
    MemRd     <= '0';
    IRWr      <= '0';
    RegWr     <= '1';
    RegInSrc  <= '1';
    ExuSrcB   <= "---";
    ExuSrcA   <= '-';
    FuncClass <= "--";
    LogicFn   <= "--";
    ShiftFn   <= "--";
    AddNSub   <= '-';
    ExtWord   <= '-';
elsif PresentState = memAccessStore then
	 PCSrc     <= "--";
    PCWr      <= '0';
    InstAddr  <= '0';
    MemWr     <= '1';
    MemRd     <= '0';
    IRWr      <= '0';
    RegWr     <= '0';
    RegInSrc  <= '0';
    ExuSrcB   <= "---";
    ExuSrcA   <= '-';
    FuncClass <= "--";
    LogicFn   <= "--";
    ShiftFn   <= "--";
    AddNSub   <= '-';
    ExtWord   <= '-';
	case funct3 is
		when "000" =>
			MemSize <= "100";
		when "001" =>
			MemSize <= "101";
		when "010" =>
			MemSize <= "110";
		when "011" =>
			MemSize <= "111";
		when others => null;
	end case;
		
end if;

end process;

end architecture;