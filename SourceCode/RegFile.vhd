library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RegFile is 
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
end entity RegFile;


architecture structural of RegFile is

type reg_array_t is array(0 to Regs-1) of std_logic_vector(N-1 downto 0);

signal reg_q : reg_array_t;
signal enables : std_logic_vector(Regs-1 downto 0);

begin

reg_q(0) <= "0000000000000000000000000000000000000000000000000000000000000000";

/* generate the enable signals */

Enablesignals: entity work.decoder_5to32
			port map(Input => Rd, Enable => RegWr, Output => enables);

	
/* generate the register file*/

gen_regs: for i in 1 to Regs-1 generate
	Regs: entity work.Reg
		generic map (N=>N)
		port map(Clk=>Clk, Dataout=> reg_q(i), Datain => Rdin, Enable=> enables(i));
		
				
end generate;


/* select Rs1 and Rs2*/
-- fix below later. when implementing on hardware, it might have too much fan in. 

with Rs1 select
Rs1out <=  reg_q(0)        when "00000",
			  reg_q(1)			when "00001",
			  reg_q(2)			when "00010",
			  reg_q(3)		   when "00011",
			  reg_q(4)			when "00100",
			  reg_q(5)			when "00101",
			  reg_q(6)			when "00110",
			  reg_q(7)			when "00111",
			  reg_q(8)			when "01000",
			  reg_q(9)			when "01001",
			  reg_q(10) 		when "01010",
			  reg_q(11)			when "01011",
			  reg_q(12)			when "01100",
			  reg_q(13)			when "01101",
			  reg_q(14)			when "01110",
			  reg_q(15)			when "01111",
			  reg_q(16)			when "10000",
			  reg_q(17)			when "10001",
			  reg_q(18)			when "10010",
			  reg_q(19)			when "10011",
			  reg_q(20)			when "10100",
			  reg_q(21)			when "10101",
			  reg_q(22)			when "10110",
			  reg_q(23)			when "10111",
			  reg_q(24)			when "11000",
			  reg_q(25)			when "11001",
			  reg_q(26)			when "11010",
			  reg_q(27)			when "11011",
			  reg_q(28)			when "11100",
			  reg_q(29)			when "11101",
			  reg_q(30)			when "11110",
			  reg_q(31)			when "11111";
			  
with Rs2 select
Rs2out <=  reg_q(0)        when "00000",
			  reg_q(1)			when "00001",
			  reg_q(2)			when "00010",
			  reg_q(3)		   when "00011",
			  reg_q(4)			when "00100",
			  reg_q(5)			when "00101",
			  reg_q(6)			when "00110",
			  reg_q(7)			when "00111",
			  reg_q(8)			when "01000",
			  reg_q(9)			when "01001",
			  reg_q(10) 		when "01010",
			  reg_q(11)			when "01011",
			  reg_q(12)			when "01100",
			  reg_q(13)			when "01101",
			  reg_q(14)			when "01110",
			  reg_q(15)			when "01111",
			  reg_q(16)			when "10000",
			  reg_q(17)			when "10001",
			  reg_q(18)			when "10010",
			  reg_q(19)			when "10011",
			  reg_q(20)			when "10100",
			  reg_q(21)			when "10101",
			  reg_q(22)			when "10110",
			  reg_q(23)			when "10111",
			  reg_q(24)			when "11000",
			  reg_q(25)			when "11001",
			  reg_q(26)			when "11010",
			  reg_q(27)			when "11011",
			  reg_q(28)			when "11100",
			  reg_q(29)			when "11101",
			  reg_q(30)			when "11110",
			  reg_q(31)			when "11111";		  


end architecture;

		
		