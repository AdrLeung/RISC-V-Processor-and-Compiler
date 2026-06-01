library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity BrentKungAdder is
    generic (N : natural := 64);
    port (
        A, B : in  std_logic_vector(N-1 downto 0);
		  Cin  : in  std_logic;
        S    : out std_logic_vector(N-1 downto 0);
		  Cout : out std_logic
		 -- Ovfl : out std_logic
        
    );
end entity BrentKungAdder;	

architecture structural of BrentKungAdder is

component BLAN is
    generic(N: natural := 64);
    port (
        P, G     : in  std_logic_vector(N-1 downto 0);
        P_out, G_out : out std_logic_vector(N-1 downto 0)
    );
end component BLAN;


signal G : std_logic_vector(N-1 downto 0);
signal P : std_logic_vector(N-1 downto 0);
signal G_out_blan: std_logic_vector(N-1 downto 0);
signal P_out_blan: std_logic_vector(N-1 downto 0);
signal Carries: std_logic_vector(N downto 0);


begin

/* first we need to make the generate and propagate block*/

PnGblock: for i in 0 to N-1 generate
	G(i) <= A(i) and B(i);
	P(i) <= A(i) xor B(i);
end generate;


/* get the blan outputs of generate and propagate signals*/
BLAN1: BLAN port map(G=>G, P =>P, P_out => P_out_blan, G_out => G_out_blan);

Carries(0) <= Cin;

gen_carries: for i in 1 to N generate
	Carries(i) <= (P_out_blan(i-1) and Carries(0)) or G_out_blan(i-1);
end generate;

gen_sum: for i in 0 to N-1 generate
	S(i) <= Carries(i) xor P(i);
end generate;

Cout <= Carries(N);
--Ovfl <= Carries(N) xor Carries(N-1);
end architecture;
