library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BLAN is
    generic(N: natural := 64);
    port (
        P, G     : in  std_logic_vector(N-1 downto 0);
        P_out, G_out : out std_logic_vector(N-1 downto 0)
    );
end entity BLAN;

architecture structural of BLAN is
    signal P_in_half : std_logic_vector((N/2)-1 downto 0);
    signal G_in_half : std_logic_vector((N/2)-1 downto 0);
	 signal P_out_half: std_logic_Vector((N/2)-1 downto 0);
	 signal G_out_half: std_logic_vector((N/2)-1 downto 0);
begin



	 
recurse: if N>2 generate
inputstoblanhalf: for i in 0 to (N/2)-1 generate
        P_in_half(i) <= P(2*i) and P(2*i+1);
        G_in_half(i) <= (P(2*i+1) and G(2*i)) or G(2*i+1);
end generate inputstoblanhalf;
		inner: entity work.BLAN
			generic map(N => N/2)
			port map(
				P => P_in_half,
				G => G_in_half,
				P_out => P_out_half,
				G_out => G_out_half
				);
/*first one always just passes through*/				
P_out(0) <= P(0);
G_out(0) <= G(0);
	 
/*even case*/
even_indices: for i in 1 to (N/2)-1 generate -- first even case is already covered by the first one passing through case
    P_out(2*i) <= P_out_half(i-1) and P(2*i);
    G_out(2*i) <= (G_out_half(i-1) and P(2*i)) or G(2*i);
end generate;

/*odd case*/

odd_indicies: for i in 0 to (N/2)-1 generate
	P_out((2*i)+1) <= P_out_half(i);
	G_out((2*i)+1) <= G_out_half(i);

end generate;


end generate recurse;

basecase: if N = 2 generate
P_out(0) <= P(0);
G_out(0) <= G(0);
P_out(1) <= P(0) and P(1);
G_out(1) <= (P(1) and G(0)) or G(1);
end generate;

	 
end architecture;