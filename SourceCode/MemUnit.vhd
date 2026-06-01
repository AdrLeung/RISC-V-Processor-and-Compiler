library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MemUnit is
    Port (
        clk      : in  std_logic;
        Address  : in  std_logic_vector(63 downto 0);
        DataIn   : in  std_logic_vector(63 downto 0);
        DataOut  : out std_logic_vector(63 downto 0);
        MemSize  : in  std_logic_vector(2 downto 0);
        MemWr    : in  std_logic;
        MemRd    : in  std_logic
    );
end entity MemUnit;
 --- need to improve this design, its just ai slob
architecture Behavioral of MemUnit is

    -- Simple RAM array (2^12 bytes = 4KB, adjust as needed)
    type mem_array is array (0 to 4095) of std_logic_vector(7 downto 0);
    signal memory : mem_array := (others => (others => '0'));

    signal addr_int : integer;

begin
    addr_int <= to_integer(unsigned(Address(11 downto 0)));

    process(clk)
    begin
        if rising_edge(clk) then

            -- WRITE
            if MemWr = '1' then
                case MemSize is
                    when "100" => -- byte
                        memory(addr_int) <= DataIn(7 downto 0);

                    when "101" => -- half
                        memory(addr_int)   <= DataIn(7 downto 0);
                        memory(addr_int+1) <= DataIn(15 downto 8);

                    when "110" => -- word
                        memory(addr_int)   <= DataIn(7 downto 0);
                        memory(addr_int+1) <= DataIn(15 downto 8);
                        memory(addr_int+2) <= DataIn(23 downto 16);
                        memory(addr_int+3) <= DataIn(31 downto 24);

                    when "111" => -- double
                        memory(addr_int)   <= DataIn(7 downto 0);
                        memory(addr_int+1) <= DataIn(15 downto 8);
                        memory(addr_int+2) <= DataIn(23 downto 16);
                        memory(addr_int+3) <= DataIn(31 downto 24);
                        memory(addr_int+4) <= DataIn(39 downto 32);
                        memory(addr_int+5) <= DataIn(47 downto 40);
                        memory(addr_int+6) <= DataIn(55 downto 48);
                        memory(addr_int+7) <= DataIn(63 downto 56);

                    when others => null; -- rsvd / error
                end case;

            -- READ
            elsif MemRd = '1' then
                case MemSize is
                    when "000" => -- INST (instruction fetch, unsigned word)
                        DataOut <= x"00000000" &
                                   memory(addr_int+3) & memory(addr_int+2) &
                                   memory(addr_int+1) & memory(addr_int);

                    when "001" => -- Ubyte (zero-extend)
                        DataOut <= (63 downto 8 => '0') & memory(addr_int);

                    when "010" => -- Uhalf (zero-extend)
                        DataOut <= (63 downto 16 => '0') &
                                   memory(addr_int+1) & memory(addr_int);

                    when "011" => -- Uword (zero-extend)
                        DataOut <= (63 downto 32 => '0') &
                                   memory(addr_int+3) & memory(addr_int+2) &
                                   memory(addr_int+1) & memory(addr_int);

                    when "100" => -- double (64-bit)
                        DataOut <= memory(addr_int+7) & memory(addr_int+6) &
                                   memory(addr_int+5) & memory(addr_int+4) &
                                   memory(addr_int+3) & memory(addr_int+2) &
                                   memory(addr_int+1) & memory(addr_int);

                    when "101" => -- Sbyte (sign-extend)
                        DataOut <= (63 downto 8 => memory(addr_int)(7)) &
                                   memory(addr_int);

                    when "110" => -- Shalf (sign-extend)
                        DataOut <= (63 downto 16 => memory(addr_int+1)(7)) &
                                   memory(addr_int+1) & memory(addr_int);

                    when "111" => -- Sword (sign-extend)
                        DataOut <= (63 downto 32 => memory(addr_int+3)(7)) &
                                   memory(addr_int+3) & memory(addr_int+2) &
                                   memory(addr_int+1) & memory(addr_int);

                    when others => null;
                end case;
            end if;
        end if;
    end process;

end MemUnit;