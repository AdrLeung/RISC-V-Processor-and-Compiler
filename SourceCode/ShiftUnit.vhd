library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- shift unit should only be concerned with shifting, we should have the operands already ready from execunit.vhd. 

entity ShiftUnit is 
	generic (N: natural:=64);
	port(
		A       : in  std_logic_vector(N-1 downto 0);
		B       : in  std_logic_vector(N-1 downto 0);
	   ShiftFN : in  std_logic_vector(1 downto 0);
		ExtWord : in  std_logic;
	   Y_shift : out std_logic_vector(N-1 downto 0)
	);
end entity ShiftUnit;

architecture rtl of ShiftUnit is

    -- Only 2 stages needed for Radix-8 (Log8 of 64 = 2)
    type stage_t is array(0 to 2) of std_logic_vector(N-1 downto 0);
    signal rs : stage_t;
    
    signal shamt        : std_logic_vector(5 downto 0);
    signal shift_input  : std_logic_vector(N-1 downto 0);
    signal shift_in     : std_logic_vector(N-1 downto 0);
    signal shift_ext    : std_logic;
    signal do_left      : std_logic;
    signal rev_out      : std_logic_vector(N-1 downto 0);
    signal raw_result   : std_logic_vector(N-1 downto 0);
    
BEGIN
    do_left <= '1' when ShiftFN = "01" else '0';

    -- Input Mux (32-bit vs 64-bit)
    shift_input <= A when ExtWord = '0' else
                   (63 downto 32 => A(31)) & A(31 downto 0) when ShiftFN = "11" else
                   (63 downto 32 => '0')    & A(31 downto 0);

    shift_ext <= shift_input(N-1) when (ShiftFN = "11") else '0';
    
    -- Fix: Ensure B is sliced safely
    shamt <= '0' & B(4 downto 0) when ExtWord = '1' else B(5 downto 0);
    
    -- Bi-directional reversal (Flip input for left shifts)
    gen_in: for i in 0 to N-1 GENERATE
        shift_in(i) <= shift_input(N-1-i) when do_left = '1' else shift_input(i);
    END GENERATE;
    
    rs(0) <= shift_in;
    
    -- Stage 0: Shift by 0 to 7
    with shamt(2 downto 0) select
        rs(1) <= rs(0) when "000",
                 (N-1 downto N-1 => shift_ext) & rs(0)(N-1 downto 1) when "001",
                 (N-1 downto N-2 => shift_ext) & rs(0)(N-1 downto 2) when "010",
                 (N-1 downto N-3 => shift_ext) & rs(0)(N-1 downto 3) when "011",
                 (N-1 downto N-4 => shift_ext) & rs(0)(N-1 downto 4) when "100",
                 (N-1 downto N-5 => shift_ext) & rs(0)(N-1 downto 5) when "101",
                 (N-1 downto N-6 => shift_ext) & rs(0)(N-1 downto 6) when "110",
                 (N-1 downto N-7 => shift_ext) & rs(0)(N-1 downto 7) when others;

    -- Stage 1: Shift by multiples of 8 (0, 8, 16...56)
    with shamt(5 downto 3) select
        rs(2) <= rs(1) when "000",
                 (N-1 downto N-8 => shift_ext) & rs(1)(N-1 downto 8)  when "001",
                 (N-1 downto N-16 => shift_ext) & rs(1)(N-1 downto 16) when "010",
                 (N-1 downto N-24 => shift_ext) & rs(1)(N-1 downto 24) when "011",
                 (N-1 downto N-32 => shift_ext) & rs(1)(N-1 downto 32) when "100",
                 (N-1 downto N-40 => shift_ext) & rs(1)(N-1 downto 40) when "101",
                 (N-1 downto N-48 => shift_ext) & rs(1)(N-1 downto 48) when "110",
                 (N-1 downto N-56 => shift_ext) & rs(1)(N-1 downto 56) when others;

    -- Undo reversal for Left Shifts
    gen_out: for i in 0 to N-1 GENERATE
        rev_out(i) <= rs(2)(N-1-i);
    END GENERATE;
    
    raw_result <= rev_out when do_left = '1' else rs(2);

    PROCESS(raw_result, ExtWord, ShiftFN)
    BEGIN
        if ShiftFN = "00" then
            Y_shift <= (others => '0');
        elsif ExtWord = '1' then
            Y_shift <= (63 downto 32 => raw_result(31)) & raw_result(31 downto 0);
        else
            Y_shift <= raw_result;
        end if;
    END PROCESS;

end architecture;