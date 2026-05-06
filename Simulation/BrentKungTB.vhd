library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BrentKungTB is
end entity BrentKungTB;

architecture testbench of BrentKungTB is
    component BrentKungAdder is
        generic (N : natural := 64);
        port (
            A, B : in  std_logic_vector(N-1 downto 0);
            Cin  : in  std_logic;
            S    : out std_logic_vector(N-1 downto 0);
            Cout : out std_logic
        );
    end component;

    signal A, B : std_logic_vector(63 downto 0);
    signal Cin  : std_logic;
    signal S    : std_logic_vector(63 downto 0);
    signal Cout : std_logic;

begin
    uut: BrentKungAdder
        generic map(N => 64)
        port map(
            A    => A,
            B    => B,
            Cin  => Cin,
            S    => S,
            Cout => Cout
        );

    stim: process
        procedure check(
            test_num : integer;
            a_val    : std_logic_vector(63 downto 0);
            b_val    : std_logic_vector(63 downto 0);
            cin_val  : std_logic
        ) is
            variable expected : std_logic_vector(64 downto 0);
        begin
            A   <= a_val;
            B   <= b_val;
            Cin <= cin_val;
            wait for 20 ns;
            expected := std_logic_vector(
                unsigned('0' & a_val) + unsigned('0' & b_val) + (x"0000000000000000" & cin_val)
            );
            if (S = expected(63 downto 0) and Cout = expected(64)) then
                report "PASS Test " & integer'image(test_num) &
                       ": A=0x" & to_hstring(a_val) &
                       " B=0x" & to_hstring(b_val) &
                       " Cin=" & std_logic'image(cin_val) &
                       " Got S=0x" & to_hstring(S) &
                       " Cout=" & std_logic'image(Cout)
                    severity note;
            else
                report "FAIL Test " & integer'image(test_num) &
                       ": A=0x" & to_hstring(a_val) &
                       " B=0x" & to_hstring(b_val) &
                       " Cin=" & std_logic'image(cin_val) &
                       " Expected S=0x" & to_hstring(expected(63 downto 0)) &
                       " Cout=" & std_logic'image(expected(64)) &
                       " Got S=0x" & to_hstring(S) &
                       " Cout=" & std_logic'image(Cout)
                    severity error;
            end if;
        end procedure;

    begin
        -- Basic
        check(1,  x"0000000000000000", x"0000000000000000", '0');
        check(2,  x"0000000000000000", x"0000000000000000", '1');
        check(3,  x"0000000000000001", x"0000000000000001", '0');
        check(4,  x"0000000000000001", x"0000000000000001", '1');
        -- No carry out
        check(5,  x"000000000000000F", x"0000000000000001", '0');
        check(6,  x"5555555555555555", x"2222222222222222", '0');
        check(7,  x"7FFFFFFFFFFFFFFF", x"0000000000000000", '1');
        -- Carry out
        check(8,  x"FFFFFFFFFFFFFFFF", x"0000000000000001", '0');
        check(9,  x"FFFFFFFFFFFFFFFF", x"FFFFFFFFFFFFFFFF", '0');
        check(10, x"FFFFFFFFFFFFFFFF", x"FFFFFFFFFFFFFFFF", '1');
        check(11, x"8000000000000000", x"8000000000000000", '0');
        check(12, x"FFFFFFFFFFFFFFFF", x"0000000000000000", '1');
        -- Alternating bits
        check(13, x"AAAAAAAAAAAAAAAA", x"5555555555555555", '0');
        check(14, x"AAAAAAAAAAAAAAAA", x"5555555555555555", '1');
        check(15, x"5555555555555555", x"5555555555555555", '0');
        -- Random
        check(16, x"123456789ABCDEF0", x"FEDCBA9876543210", '0');
        check(17, x"0F0F0F0F0F0F0F0F", x"F0F0F0F0F0F0F0F0", '1');
        check(18, x"00000000FFFFFFFF", x"0000000000000001", '0');
        check(19, x"EFEFEFEFEFEFEFEF", x"1111111111111111", '0');
        check(20, x"6464646464646464", x"6464646464646464", '0');

        report "All tests complete.";
        wait;
    end process;

end architecture testbench;