-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "05/28/2026 14:19:12"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ControlUnit IS
    PORT (
	Clk : IN std_logic;
	Opcode : IN std_logic_vector(6 DOWNTO 0);
	funct7 : IN std_logic_vector(6 DOWNTO 0);
	funct3 : IN std_logic_vector(2 DOWNTO 0);
	Zero : IN std_logic;
	AltB : IN std_logic;
	AltBu : IN std_logic;
	AddnSub : OUT std_logic;
	ExtWord : OUT std_logic;
	PCwr : OUT std_logic;
	InstAddr : OUT std_logic;
	MemSize : OUT std_logic_vector(2 DOWNTO 0);
	MemWr : OUT std_logic;
	MemRd : OUT std_logic;
	IRWr : OUT std_logic;
	RegWr : OUT std_logic;
	RegInSrc : OUT std_logic;
	ExuSrcB : OUT std_logic_vector(2 DOWNTO 0);
	ExuSrcA : OUT std_logic;
	FuncClass : OUT std_logic_vector(1 DOWNTO 0);
	ShiftFn : OUT std_logic_vector(1 DOWNTO 0);
	LogicFn : OUT std_logic_vector(1 DOWNTO 0);
	PCSrc : OUT std_logic_vector(1 DOWNTO 0)
	);
END ControlUnit;

-- Design Ports Information
-- AddnSub	=>  Location: PIN_F17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ExtWord	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PCwr	=>  Location: PIN_E14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- InstAddr	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MemSize[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MemSize[1]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MemSize[2]	=>  Location: PIN_H21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MemWr	=>  Location: PIN_B19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- MemRd	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- IRWr	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RegWr	=>  Location: PIN_H14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RegInSrc	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ExuSrcB[0]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ExuSrcB[1]	=>  Location: PIN_J12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ExuSrcB[2]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ExuSrcA	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- FuncClass[0]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- FuncClass[1]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ShiftFn[0]	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ShiftFn[1]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LogicFn[0]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LogicFn[1]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PCSrc[0]	=>  Location: PIN_J14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- PCSrc[1]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- funct3[1]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Opcode[4]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Opcode[0]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Opcode[1]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Opcode[6]	=>  Location: PIN_G14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Opcode[2]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Opcode[3]	=>  Location: PIN_B17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Opcode[5]	=>  Location: PIN_A17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- funct7[0]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- funct7[1]	=>  Location: PIN_B18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- funct7[2]	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- funct7[3]	=>  Location: PIN_G22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- funct7[5]	=>  Location: PIN_G20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- funct7[4]	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- funct7[6]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- funct3[2]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- funct3[0]	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Zero	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- AltB	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- AltBu	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Clk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ControlUnit IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Clk : std_logic;
SIGNAL ww_Opcode : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_funct7 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_funct3 : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_Zero : std_logic;
SIGNAL ww_AltB : std_logic;
SIGNAL ww_AltBu : std_logic;
SIGNAL ww_AddnSub : std_logic;
SIGNAL ww_ExtWord : std_logic;
SIGNAL ww_PCwr : std_logic;
SIGNAL ww_InstAddr : std_logic;
SIGNAL ww_MemSize : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_MemWr : std_logic;
SIGNAL ww_MemRd : std_logic;
SIGNAL ww_IRWr : std_logic;
SIGNAL ww_RegWr : std_logic;
SIGNAL ww_RegInSrc : std_logic;
SIGNAL ww_ExuSrcB : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_ExuSrcA : std_logic;
SIGNAL ww_FuncClass : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_ShiftFn : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_LogicFn : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_PCSrc : std_logic_vector(1 DOWNTO 0);
SIGNAL \Clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \AddnSub~output_o\ : std_logic;
SIGNAL \ExtWord~output_o\ : std_logic;
SIGNAL \PCwr~output_o\ : std_logic;
SIGNAL \InstAddr~output_o\ : std_logic;
SIGNAL \MemSize[0]~output_o\ : std_logic;
SIGNAL \MemSize[1]~output_o\ : std_logic;
SIGNAL \MemSize[2]~output_o\ : std_logic;
SIGNAL \MemWr~output_o\ : std_logic;
SIGNAL \MemRd~output_o\ : std_logic;
SIGNAL \IRWr~output_o\ : std_logic;
SIGNAL \RegWr~output_o\ : std_logic;
SIGNAL \RegInSrc~output_o\ : std_logic;
SIGNAL \ExuSrcB[0]~output_o\ : std_logic;
SIGNAL \ExuSrcB[1]~output_o\ : std_logic;
SIGNAL \ExuSrcB[2]~output_o\ : std_logic;
SIGNAL \ExuSrcA~output_o\ : std_logic;
SIGNAL \FuncClass[0]~output_o\ : std_logic;
SIGNAL \FuncClass[1]~output_o\ : std_logic;
SIGNAL \ShiftFn[0]~output_o\ : std_logic;
SIGNAL \ShiftFn[1]~output_o\ : std_logic;
SIGNAL \LogicFn[0]~output_o\ : std_logic;
SIGNAL \LogicFn[1]~output_o\ : std_logic;
SIGNAL \PCSrc[0]~output_o\ : std_logic;
SIGNAL \PCSrc[1]~output_o\ : std_logic;
SIGNAL \Opcode[3]~input_o\ : std_logic;
SIGNAL \Opcode[5]~input_o\ : std_logic;
SIGNAL \Opcode[1]~input_o\ : std_logic;
SIGNAL \Opcode[0]~input_o\ : std_logic;
SIGNAL \Opcode[6]~input_o\ : std_logic;
SIGNAL \Equal5~0_combout\ : std_logic;
SIGNAL \Opcode[2]~input_o\ : std_logic;
SIGNAL \Opcode[4]~input_o\ : std_logic;
SIGNAL \Equal5~1_combout\ : std_logic;
SIGNAL \AddnSub~1_combout\ : std_logic;
SIGNAL \funct3[1]~input_o\ : std_logic;
SIGNAL \Clk~input_o\ : std_logic;
SIGNAL \Clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \NextState~20_combout\ : std_logic;
SIGNAL \NextState~9_combout\ : std_logic;
SIGNAL \NextState~15_combout\ : std_logic;
SIGNAL \NextState~12_combout\ : std_logic;
SIGNAL \NextState~13_combout\ : std_logic;
SIGNAL \NextState~8_combout\ : std_logic;
SIGNAL \NextState~18_combout\ : std_logic;
SIGNAL \NextState~19_combout\ : std_logic;
SIGNAL \PresentState.storeLoadExecute~q\ : std_logic;
SIGNAL \ExuSrcB~2_combout\ : std_logic;
SIGNAL \PresentState.memAccessLoad~q\ : std_logic;
SIGNAL \NextState.Fetch~1_combout\ : std_logic;
SIGNAL \NextState.Fetch~0_combout\ : std_logic;
SIGNAL \NextState.Fetch~2_combout\ : std_logic;
SIGNAL \PresentState.Fetch~q\ : std_logic;
SIGNAL \PresentState.Decode~0_combout\ : std_logic;
SIGNAL \PresentState.Decode~q\ : std_logic;
SIGNAL \NextState~11_combout\ : std_logic;
SIGNAL \PresentState.ArthemeticExecute~q\ : std_logic;
SIGNAL \AddnSub~0_combout\ : std_logic;
SIGNAL \funct3[2]~input_o\ : std_logic;
SIGNAL \funct7[6]~input_o\ : std_logic;
SIGNAL \funct7[5]~input_o\ : std_logic;
SIGNAL \funct7[2]~input_o\ : std_logic;
SIGNAL \funct7[3]~input_o\ : std_logic;
SIGNAL \funct7[0]~input_o\ : std_logic;
SIGNAL \funct7[1]~input_o\ : std_logic;
SIGNAL \Equal9~0_combout\ : std_logic;
SIGNAL \funct7[4]~input_o\ : std_logic;
SIGNAL \Equal9~1_combout\ : std_logic;
SIGNAL \FuncClass~0_combout\ : std_logic;
SIGNAL \AddnSub~2_combout\ : std_logic;
SIGNAL \NextState~14_combout\ : std_logic;
SIGNAL \PresentState.BranchExecute~q\ : std_logic;
SIGNAL \ShiftFn~10_combout\ : std_logic;
SIGNAL \PCwr~2_combout\ : std_logic;
SIGNAL \Equal10~0_combout\ : std_logic;
SIGNAL \funct3[0]~input_o\ : std_logic;
SIGNAL \AddnSub~3_combout\ : std_logic;
SIGNAL \AddnSub~4_combout\ : std_logic;
SIGNAL \AddnSub~5_combout\ : std_logic;
SIGNAL \ExtWord~5_combout\ : std_logic;
SIGNAL \AddnSub~6_combout\ : std_logic;
SIGNAL \Equal8~0_combout\ : std_logic;
SIGNAL \ExtWord~3_combout\ : std_logic;
SIGNAL \ExtWord~2_combout\ : std_logic;
SIGNAL \ExtWord~4_combout\ : std_logic;
SIGNAL \Zero~input_o\ : std_logic;
SIGNAL \AltBu~input_o\ : std_logic;
SIGNAL \AltB~input_o\ : std_logic;
SIGNAL \PCwr~3_combout\ : std_logic;
SIGNAL \PCwr~4_combout\ : std_logic;
SIGNAL \NextState~16_combout\ : std_logic;
SIGNAL \PresentState.JumpExecute~q\ : std_logic;
SIGNAL \PCwr~5_combout\ : std_logic;
SIGNAL \InstAddr~0_combout\ : std_logic;
SIGNAL \NextState~17_combout\ : std_logic;
SIGNAL \PresentState.memAccessStore~q\ : std_logic;
SIGNAL \MemSize~1_combout\ : std_logic;
SIGNAL \MemSize~2_combout\ : std_logic;
SIGNAL \MemSize~3_combout\ : std_logic;
SIGNAL \MemSize~4_combout\ : std_logic;
SIGNAL \MemSize~5_combout\ : std_logic;
SIGNAL \PresentState.ArthemeticWriteBack~q\ : std_logic;
SIGNAL \MemRd~0_combout\ : std_logic;
SIGNAL \RegWr~0_combout\ : std_logic;
SIGNAL \MemRd~1_combout\ : std_logic;
SIGNAL \PresentState.writeBackLoad~q\ : std_logic;
SIGNAL \RegWr~1_combout\ : std_logic;
SIGNAL \RegInSrc~0_combout\ : std_logic;
SIGNAL \Equal6~0_combout\ : std_logic;
SIGNAL \ExuSrcB~10_combout\ : std_logic;
SIGNAL \ShiftFn~2_combout\ : std_logic;
SIGNAL \ExuSrcB~3_combout\ : std_logic;
SIGNAL \ExuSrcB~4_combout\ : std_logic;
SIGNAL \Equal5~2_combout\ : std_logic;
SIGNAL \Equal5~3_combout\ : std_logic;
SIGNAL \ExuSrcB~5_combout\ : std_logic;
SIGNAL \ExuSrcB~6_combout\ : std_logic;
SIGNAL \ExuSrcB~7_combout\ : std_logic;
SIGNAL \NextState~10_combout\ : std_logic;
SIGNAL \ExuSrcB~8_combout\ : std_logic;
SIGNAL \ExuSrcB~9_combout\ : std_logic;
SIGNAL \ExuSrcA~0_combout\ : std_logic;
SIGNAL \ExuSrcA~1_combout\ : std_logic;
SIGNAL \FuncClass~1_combout\ : std_logic;
SIGNAL \FuncClass~2_combout\ : std_logic;
SIGNAL \FuncClass~3_combout\ : std_logic;
SIGNAL \FuncClass~4_combout\ : std_logic;
SIGNAL \FuncClass~5_combout\ : std_logic;
SIGNAL \ShiftFn~6_combout\ : std_logic;
SIGNAL \ShiftFn~7_combout\ : std_logic;
SIGNAL \ShiftFn~4_combout\ : std_logic;
SIGNAL \ShiftFn~3_combout\ : std_logic;
SIGNAL \ShiftFn~5_combout\ : std_logic;
SIGNAL \ShiftFn~8_combout\ : std_logic;
SIGNAL \Mux11~0_combout\ : std_logic;
SIGNAL \ShiftFn~9_combout\ : std_logic;
SIGNAL \LogicFn~0_combout\ : std_logic;
SIGNAL \LogicFn~1_combout\ : std_logic;
SIGNAL \LogicFn~2_combout\ : std_logic;
SIGNAL \PCSrc~3_combout\ : std_logic;
SIGNAL \PCSrc~4_combout\ : std_logic;
SIGNAL \PCSrc~2_combout\ : std_logic;
SIGNAL \ALT_INV_ExuSrcB~9_combout\ : std_logic;
SIGNAL \ALT_INV_RegInSrc~0_combout\ : std_logic;
SIGNAL \ALT_INV_MemSize~5_combout\ : std_logic;
SIGNAL \ALT_INV_PCSrc~2_combout\ : std_logic;
SIGNAL \ALT_INV_PresentState.Fetch~q\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_Clk <= Clk;
ww_Opcode <= Opcode;
ww_funct7 <= funct7;
ww_funct3 <= funct3;
ww_Zero <= Zero;
ww_AltB <= AltB;
ww_AltBu <= AltBu;
AddnSub <= ww_AddnSub;
ExtWord <= ww_ExtWord;
PCwr <= ww_PCwr;
InstAddr <= ww_InstAddr;
MemSize <= ww_MemSize;
MemWr <= ww_MemWr;
MemRd <= ww_MemRd;
IRWr <= ww_IRWr;
RegWr <= ww_RegWr;
RegInSrc <= ww_RegInSrc;
ExuSrcB <= ww_ExuSrcB;
ExuSrcA <= ww_ExuSrcA;
FuncClass <= ww_FuncClass;
ShiftFn <= ww_ShiftFn;
LogicFn <= ww_LogicFn;
PCSrc <= ww_PCSrc;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Clk~input_o\);
\ALT_INV_ExuSrcB~9_combout\ <= NOT \ExuSrcB~9_combout\;
\ALT_INV_RegInSrc~0_combout\ <= NOT \RegInSrc~0_combout\;
\ALT_INV_MemSize~5_combout\ <= NOT \MemSize~5_combout\;
\ALT_INV_PCSrc~2_combout\ <= NOT \PCSrc~2_combout\;
\ALT_INV_PresentState.Fetch~q\ <= NOT \PresentState.Fetch~q\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X67_Y73_N16
\AddnSub~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \AddnSub~5_combout\,
	devoe => ww_devoe,
	o => \AddnSub~output_o\);

-- Location: IOOBUF_X65_Y73_N23
\ExtWord~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ExtWord~4_combout\,
	devoe => ww_devoe,
	o => \ExtWord~output_o\);

-- Location: IOOBUF_X45_Y73_N9
\PCwr~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PCwr~5_combout\,
	devoe => ww_devoe,
	o => \PCwr~output_o\);

-- Location: IOOBUF_X54_Y73_N2
\InstAddr~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \InstAddr~0_combout\,
	devoe => ww_devoe,
	o => \InstAddr~output_o\);

-- Location: IOOBUF_X69_Y73_N16
\MemSize[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MemSize~1_combout\,
	devoe => ww_devoe,
	o => \MemSize[0]~output_o\);

-- Location: IOOBUF_X69_Y73_N23
\MemSize[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MemSize~3_combout\,
	devoe => ww_devoe,
	o => \MemSize[1]~output_o\);

-- Location: IOOBUF_X72_Y73_N16
\MemSize[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_MemSize~5_combout\,
	devoe => ww_devoe,
	o => \MemSize[2]~output_o\);

-- Location: IOOBUF_X81_Y73_N23
\MemWr~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PresentState.memAccessStore~q\,
	devoe => ww_devoe,
	o => \MemWr~output_o\);

-- Location: IOOBUF_X52_Y73_N9
\MemRd~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MemRd~1_combout\,
	devoe => ww_devoe,
	o => \MemRd~output_o\);

-- Location: IOOBUF_X42_Y73_N9
\IRWr~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_PresentState.Fetch~q\,
	devoe => ww_devoe,
	o => \IRWr~output_o\);

-- Location: IOOBUF_X49_Y73_N16
\RegWr~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegWr~1_combout\,
	devoe => ww_devoe,
	o => \RegWr~output_o\);

-- Location: IOOBUF_X45_Y73_N2
\RegInSrc~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_RegInSrc~0_combout\,
	devoe => ww_devoe,
	o => \RegInSrc~output_o\);

-- Location: IOOBUF_X47_Y73_N2
\ExuSrcB[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ExuSrcB~4_combout\,
	devoe => ww_devoe,
	o => \ExuSrcB[0]~output_o\);

-- Location: IOOBUF_X40_Y73_N9
\ExuSrcB[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ExuSrcB~7_combout\,
	devoe => ww_devoe,
	o => \ExuSrcB[1]~output_o\);

-- Location: IOOBUF_X52_Y73_N2
\ExuSrcB[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_ExuSrcB~9_combout\,
	devoe => ww_devoe,
	o => \ExuSrcB[2]~output_o\);

-- Location: IOOBUF_X52_Y73_N23
\ExuSrcA~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ExuSrcA~1_combout\,
	devoe => ww_devoe,
	o => \ExuSrcA~output_o\);

-- Location: IOOBUF_X62_Y73_N23
\FuncClass[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \FuncClass~4_combout\,
	devoe => ww_devoe,
	o => \FuncClass[0]~output_o\);

-- Location: IOOBUF_X58_Y73_N9
\FuncClass[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \FuncClass~5_combout\,
	devoe => ww_devoe,
	o => \FuncClass[1]~output_o\);

-- Location: IOOBUF_X60_Y73_N16
\ShiftFn[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ShiftFn~8_combout\,
	devoe => ww_devoe,
	o => \ShiftFn[0]~output_o\);

-- Location: IOOBUF_X62_Y73_N16
\ShiftFn[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ShiftFn~9_combout\,
	devoe => ww_devoe,
	o => \ShiftFn[1]~output_o\);

-- Location: IOOBUF_X60_Y73_N23
\LogicFn[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LogicFn~1_combout\,
	devoe => ww_devoe,
	o => \LogicFn[0]~output_o\);

-- Location: IOOBUF_X58_Y73_N2
\LogicFn[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LogicFn~2_combout\,
	devoe => ww_devoe,
	o => \LogicFn[1]~output_o\);

-- Location: IOOBUF_X49_Y73_N23
\PCSrc[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \PCSrc~4_combout\,
	devoe => ww_devoe,
	o => \PCSrc[0]~output_o\);

-- Location: IOOBUF_X54_Y73_N9
\PCSrc[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_PCSrc~2_combout\,
	devoe => ww_devoe,
	o => \PCSrc[1]~output_o\);

-- Location: IOIBUF_X60_Y73_N8
\Opcode[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Opcode(3),
	o => \Opcode[3]~input_o\);

-- Location: IOIBUF_X60_Y73_N1
\Opcode[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Opcode(5),
	o => \Opcode[5]~input_o\);

-- Location: IOIBUF_X42_Y73_N1
\Opcode[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Opcode(1),
	o => \Opcode[1]~input_o\);

-- Location: IOIBUF_X58_Y73_N15
\Opcode[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Opcode(0),
	o => \Opcode[0]~input_o\);

-- Location: IOIBUF_X47_Y73_N15
\Opcode[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Opcode(6),
	o => \Opcode[6]~input_o\);

-- Location: LCCOMB_X58_Y69_N0
\Equal5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal5~0_combout\ = (\Opcode[1]~input_o\ & (\Opcode[0]~input_o\ & !\Opcode[6]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[1]~input_o\,
	datab => \Opcode[0]~input_o\,
	datad => \Opcode[6]~input_o\,
	combout => \Equal5~0_combout\);

-- Location: IOIBUF_X52_Y73_N15
\Opcode[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Opcode(2),
	o => \Opcode[2]~input_o\);

-- Location: IOIBUF_X58_Y73_N22
\Opcode[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Opcode(4),
	o => \Opcode[4]~input_o\);

-- Location: LCCOMB_X58_Y69_N6
\Equal5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal5~1_combout\ = (\Equal5~0_combout\ & (!\Opcode[2]~input_o\ & \Opcode[4]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal5~0_combout\,
	datac => \Opcode[2]~input_o\,
	datad => \Opcode[4]~input_o\,
	combout => \Equal5~1_combout\);

-- Location: LCCOMB_X59_Y69_N10
\AddnSub~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \AddnSub~1_combout\ = (!\Opcode[3]~input_o\ & (!\Opcode[5]~input_o\ & \Equal5~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Opcode[3]~input_o\,
	datac => \Opcode[5]~input_o\,
	datad => \Equal5~1_combout\,
	combout => \AddnSub~1_combout\);

-- Location: IOIBUF_X67_Y73_N22
\funct3[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_funct3(1),
	o => \funct3[1]~input_o\);

-- Location: IOIBUF_X0_Y36_N8
\Clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Clk,
	o => \Clk~input_o\);

-- Location: CLKCTRL_G2
\Clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Clk~inputclkctrl_outclk\);

-- Location: LCCOMB_X58_Y69_N22
\NextState~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \NextState~20_combout\ = (\Opcode[4]~input_o\ & (\Equal5~0_combout\ & ((!\Opcode[3]~input_o\) # (!\Opcode[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[4]~input_o\,
	datab => \Equal5~0_combout\,
	datac => \Opcode[2]~input_o\,
	datad => \Opcode[3]~input_o\,
	combout => \NextState~20_combout\);

-- Location: LCCOMB_X58_Y69_N14
\NextState~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \NextState~9_combout\ = (!\Opcode[4]~input_o\ & (\Opcode[0]~input_o\ & (\Opcode[5]~input_o\ & \Opcode[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[4]~input_o\,
	datab => \Opcode[0]~input_o\,
	datac => \Opcode[5]~input_o\,
	datad => \Opcode[1]~input_o\,
	combout => \NextState~9_combout\);

-- Location: LCCOMB_X57_Y69_N10
\NextState~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \NextState~15_combout\ = (\Opcode[2]~input_o\ & (\NextState~9_combout\ & (\Opcode[6]~input_o\ & \PresentState.Decode~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[2]~input_o\,
	datab => \NextState~9_combout\,
	datac => \Opcode[6]~input_o\,
	datad => \PresentState.Decode~q\,
	combout => \NextState~15_combout\);

-- Location: LCCOMB_X56_Y69_N26
\NextState~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \NextState~12_combout\ = (!\Opcode[2]~input_o\ & !\Opcode[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Opcode[2]~input_o\,
	datad => \Opcode[3]~input_o\,
	combout => \NextState~12_combout\);

-- Location: LCCOMB_X57_Y69_N18
\NextState~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \NextState~13_combout\ = (\NextState~12_combout\ & (\NextState~9_combout\ & (\Opcode[6]~input_o\ & \PresentState.Decode~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NextState~12_combout\,
	datab => \NextState~9_combout\,
	datac => \Opcode[6]~input_o\,
	datad => \PresentState.Decode~q\,
	combout => \NextState~13_combout\);

-- Location: LCCOMB_X58_Y69_N10
\NextState~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \NextState~8_combout\ = (!\Opcode[4]~input_o\ & (\Equal5~0_combout\ & (!\Opcode[2]~input_o\ & !\Opcode[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[4]~input_o\,
	datab => \Equal5~0_combout\,
	datac => \Opcode[2]~input_o\,
	datad => \Opcode[3]~input_o\,
	combout => \NextState~8_combout\);

-- Location: LCCOMB_X58_Y69_N4
\NextState~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \NextState~18_combout\ = (\NextState~9_combout\ & (\Opcode[6]~input_o\ & ((\Opcode[2]~input_o\) # (!\Opcode[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[3]~input_o\,
	datab => \NextState~9_combout\,
	datac => \Opcode[2]~input_o\,
	datad => \Opcode[6]~input_o\,
	combout => \NextState~18_combout\);

-- Location: LCCOMB_X57_Y69_N16
\NextState~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \NextState~19_combout\ = (!\NextState~18_combout\ & (!\NextState~20_combout\ & (\NextState~8_combout\ & \PresentState.Decode~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NextState~18_combout\,
	datab => \NextState~20_combout\,
	datac => \NextState~8_combout\,
	datad => \PresentState.Decode~q\,
	combout => \NextState~19_combout\);

-- Location: FF_X57_Y69_N17
\PresentState.storeLoadExecute\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \NextState~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PresentState.storeLoadExecute~q\);

-- Location: LCCOMB_X57_Y69_N22
\ExuSrcB~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ExuSrcB~2_combout\ = (\NextState~8_combout\ & (!\Opcode[5]~input_o\ & \PresentState.storeLoadExecute~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NextState~8_combout\,
	datab => \Opcode[5]~input_o\,
	datad => \PresentState.storeLoadExecute~q\,
	combout => \ExuSrcB~2_combout\);

-- Location: FF_X57_Y69_N13
\PresentState.memAccessLoad\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	asdata => \ExuSrcB~2_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PresentState.memAccessLoad~q\);

-- Location: LCCOMB_X57_Y69_N8
\NextState.Fetch~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \NextState.Fetch~1_combout\ = (\PresentState.memAccessLoad~q\) # ((\PresentState.ArthemeticExecute~q\) # (!\PresentState.Fetch~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PresentState.memAccessLoad~q\,
	datab => \PresentState.Fetch~q\,
	datad => \PresentState.ArthemeticExecute~q\,
	combout => \NextState.Fetch~1_combout\);

-- Location: LCCOMB_X57_Y69_N6
\NextState.Fetch~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \NextState.Fetch~0_combout\ = (\NextState~8_combout\ & (((\PresentState.Decode~q\) # (\PresentState.storeLoadExecute~q\)))) # (!\NextState~8_combout\ & (\NextState~20_combout\ & (\PresentState.Decode~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NextState~8_combout\,
	datab => \NextState~20_combout\,
	datac => \PresentState.Decode~q\,
	datad => \PresentState.storeLoadExecute~q\,
	combout => \NextState.Fetch~0_combout\);

-- Location: LCCOMB_X57_Y69_N24
\NextState.Fetch~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \NextState.Fetch~2_combout\ = (\NextState~15_combout\) # ((\NextState~13_combout\) # ((\NextState.Fetch~1_combout\) # (\NextState.Fetch~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NextState~15_combout\,
	datab => \NextState~13_combout\,
	datac => \NextState.Fetch~1_combout\,
	datad => \NextState.Fetch~0_combout\,
	combout => \NextState.Fetch~2_combout\);

-- Location: FF_X57_Y69_N25
\PresentState.Fetch\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \NextState.Fetch~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PresentState.Fetch~q\);

-- Location: LCCOMB_X57_Y69_N14
\PresentState.Decode~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \PresentState.Decode~0_combout\ = !\PresentState.Fetch~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \PresentState.Fetch~q\,
	combout => \PresentState.Decode~0_combout\);

-- Location: FF_X57_Y69_N15
\PresentState.Decode\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \PresentState.Decode~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PresentState.Decode~q\);

-- Location: LCCOMB_X57_Y69_N20
\NextState~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \NextState~11_combout\ = (\NextState~20_combout\ & \PresentState.Decode~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \NextState~20_combout\,
	datac => \PresentState.Decode~q\,
	combout => \NextState~11_combout\);

-- Location: FF_X57_Y69_N21
\PresentState.ArthemeticExecute\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \NextState~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PresentState.ArthemeticExecute~q\);

-- Location: LCCOMB_X59_Y69_N0
\AddnSub~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \AddnSub~0_combout\ = (\funct3[1]~input_o\ & \PresentState.ArthemeticExecute~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \funct3[1]~input_o\,
	datad => \PresentState.ArthemeticExecute~q\,
	combout => \AddnSub~0_combout\);

-- Location: IOIBUF_X69_Y73_N1
\funct3[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_funct3(2),
	o => \funct3[2]~input_o\);

-- Location: IOIBUF_X72_Y73_N1
\funct7[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_funct7(6),
	o => \funct7[6]~input_o\);

-- Location: IOIBUF_X74_Y73_N15
\funct7[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_funct7(5),
	o => \funct7[5]~input_o\);

-- Location: IOIBUF_X79_Y73_N1
\funct7[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_funct7(2),
	o => \funct7[2]~input_o\);

-- Location: IOIBUF_X72_Y73_N22
\funct7[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_funct7(3),
	o => \funct7[3]~input_o\);

-- Location: IOIBUF_X72_Y73_N8
\funct7[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_funct7(0),
	o => \funct7[0]~input_o\);

-- Location: IOIBUF_X79_Y73_N8
\funct7[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_funct7(1),
	o => \funct7[1]~input_o\);

-- Location: LCCOMB_X72_Y72_N16
\Equal9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal9~0_combout\ = (!\funct7[2]~input_o\ & (!\funct7[3]~input_o\ & (!\funct7[0]~input_o\ & !\funct7[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \funct7[2]~input_o\,
	datab => \funct7[3]~input_o\,
	datac => \funct7[0]~input_o\,
	datad => \funct7[1]~input_o\,
	combout => \Equal9~0_combout\);

-- Location: IOIBUF_X74_Y73_N22
\funct7[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_funct7(4),
	o => \funct7[4]~input_o\);

-- Location: LCCOMB_X68_Y72_N4
\Equal9~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal9~1_combout\ = (!\funct7[6]~input_o\ & (!\funct7[5]~input_o\ & (\Equal9~0_combout\ & !\funct7[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \funct7[6]~input_o\,
	datab => \funct7[5]~input_o\,
	datac => \Equal9~0_combout\,
	datad => \funct7[4]~input_o\,
	combout => \Equal9~1_combout\);

-- Location: LCCOMB_X60_Y69_N24
\FuncClass~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \FuncClass~0_combout\ = (!\Opcode[3]~input_o\ & (\Opcode[5]~input_o\ & (\Equal5~1_combout\ & \Equal9~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[3]~input_o\,
	datab => \Opcode[5]~input_o\,
	datac => \Equal5~1_combout\,
	datad => \Equal9~1_combout\,
	combout => \FuncClass~0_combout\);

-- Location: LCCOMB_X59_Y69_N12
\AddnSub~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \AddnSub~2_combout\ = (\AddnSub~0_combout\ & ((\AddnSub~1_combout\) # ((!\funct3[2]~input_o\ & \FuncClass~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AddnSub~1_combout\,
	datab => \AddnSub~0_combout\,
	datac => \funct3[2]~input_o\,
	datad => \FuncClass~0_combout\,
	combout => \AddnSub~2_combout\);

-- Location: LCCOMB_X57_Y69_N30
\NextState~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \NextState~14_combout\ = (\NextState~13_combout\ & ((!\NextState~20_combout\) # (!\PresentState.Decode~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \PresentState.Decode~q\,
	datac => \NextState~20_combout\,
	datad => \NextState~13_combout\,
	combout => \NextState~14_combout\);

-- Location: FF_X57_Y69_N31
\PresentState.BranchExecute\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \NextState~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PresentState.BranchExecute~q\);

-- Location: LCCOMB_X58_Y69_N26
\ShiftFn~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \ShiftFn~10_combout\ = (!\Opcode[2]~input_o\ & (\Equal5~0_combout\ & (\Opcode[5]~input_o\ & \Opcode[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[2]~input_o\,
	datab => \Equal5~0_combout\,
	datac => \Opcode[5]~input_o\,
	datad => \Opcode[4]~input_o\,
	combout => \ShiftFn~10_combout\);

-- Location: LCCOMB_X60_Y69_N22
\PCwr~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \PCwr~2_combout\ = (!\funct3[2]~input_o\ & !\funct3[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \funct3[2]~input_o\,
	datac => \funct3[1]~input_o\,
	combout => \PCwr~2_combout\);

-- Location: LCCOMB_X68_Y72_N6
\Equal10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal10~0_combout\ = (!\funct7[6]~input_o\ & (\funct7[5]~input_o\ & (\Equal9~0_combout\ & !\funct7[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \funct7[6]~input_o\,
	datab => \funct7[5]~input_o\,
	datac => \Equal9~0_combout\,
	datad => \funct7[4]~input_o\,
	combout => \Equal10~0_combout\);

-- Location: IOIBUF_X67_Y73_N8
\funct3[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_funct3(0),
	o => \funct3[0]~input_o\);

-- Location: LCCOMB_X60_Y69_N12
\AddnSub~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \AddnSub~3_combout\ = (\Equal10~0_combout\ & !\funct3[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal10~0_combout\,
	datac => \funct3[0]~input_o\,
	combout => \AddnSub~3_combout\);

-- Location: LCCOMB_X60_Y69_N10
\AddnSub~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \AddnSub~4_combout\ = (\PresentState.ArthemeticExecute~q\ & (\ShiftFn~10_combout\ & (\PCwr~2_combout\ & \AddnSub~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PresentState.ArthemeticExecute~q\,
	datab => \ShiftFn~10_combout\,
	datac => \PCwr~2_combout\,
	datad => \AddnSub~3_combout\,
	combout => \AddnSub~4_combout\);

-- Location: LCCOMB_X59_Y69_N6
\AddnSub~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \AddnSub~5_combout\ = (\AddnSub~2_combout\) # ((\AddnSub~4_combout\) # ((\PresentState.BranchExecute~q\ & !\PresentState.ArthemeticExecute~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AddnSub~2_combout\,
	datab => \PresentState.BranchExecute~q\,
	datac => \AddnSub~4_combout\,
	datad => \PresentState.ArthemeticExecute~q\,
	combout => \AddnSub~5_combout\);

-- Location: LCCOMB_X60_Y69_N26
\ExtWord~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ExtWord~5_combout\ = (\Opcode[3]~input_o\ & (\Equal5~1_combout\ & (!\funct3[1]~input_o\ & \funct3[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[3]~input_o\,
	datab => \Equal5~1_combout\,
	datac => \funct3[1]~input_o\,
	datad => \funct3[0]~input_o\,
	combout => \ExtWord~5_combout\);

-- Location: LCCOMB_X60_Y69_N0
\AddnSub~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \AddnSub~6_combout\ = (\PresentState.ArthemeticExecute~q\ & (!\funct3[1]~input_o\ & !\funct3[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PresentState.ArthemeticExecute~q\,
	datab => \funct3[1]~input_o\,
	datac => \funct3[2]~input_o\,
	combout => \AddnSub~6_combout\);

-- Location: LCCOMB_X58_Y69_N8
\Equal8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal8~0_combout\ = (\Opcode[4]~input_o\ & (\Equal5~0_combout\ & (!\Opcode[2]~input_o\ & \Opcode[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[4]~input_o\,
	datab => \Equal5~0_combout\,
	datac => \Opcode[2]~input_o\,
	datad => \Opcode[3]~input_o\,
	combout => \Equal8~0_combout\);

-- Location: LCCOMB_X60_Y69_N8
\ExtWord~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ExtWord~3_combout\ = (\Equal8~0_combout\ & ((\AddnSub~3_combout\) # ((\Equal9~1_combout\) # (!\Opcode[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AddnSub~3_combout\,
	datab => \Opcode[5]~input_o\,
	datac => \Equal8~0_combout\,
	datad => \Equal9~1_combout\,
	combout => \ExtWord~3_combout\);

-- Location: LCCOMB_X60_Y69_N18
\ExtWord~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ExtWord~2_combout\ = (\funct3[2]~input_o\ & (\PresentState.ArthemeticExecute~q\ & ((\Equal10~0_combout\) # (\Equal9~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal10~0_combout\,
	datab => \funct3[2]~input_o\,
	datac => \PresentState.ArthemeticExecute~q\,
	datad => \Equal9~1_combout\,
	combout => \ExtWord~2_combout\);

-- Location: LCCOMB_X60_Y69_N30
\ExtWord~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ExtWord~4_combout\ = (\ExtWord~5_combout\ & ((\ExtWord~2_combout\) # ((\AddnSub~6_combout\ & \ExtWord~3_combout\)))) # (!\ExtWord~5_combout\ & (\AddnSub~6_combout\ & (\ExtWord~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ExtWord~5_combout\,
	datab => \AddnSub~6_combout\,
	datac => \ExtWord~3_combout\,
	datad => \ExtWord~2_combout\,
	combout => \ExtWord~4_combout\);

-- Location: IOIBUF_X65_Y73_N15
\Zero~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Zero,
	o => \Zero~input_o\);

-- Location: IOIBUF_X67_Y73_N1
\AltBu~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_AltBu,
	o => \AltBu~input_o\);

-- Location: IOIBUF_X65_Y73_N8
\AltB~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_AltB,
	o => \AltB~input_o\);

-- Location: LCCOMB_X60_Y69_N28
\PCwr~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \PCwr~3_combout\ = (\funct3[1]~input_o\ & ((\AltBu~input_o\) # ((!\funct3[2]~input_o\)))) # (!\funct3[1]~input_o\ & (((\funct3[2]~input_o\ & \AltB~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AltBu~input_o\,
	datab => \funct3[1]~input_o\,
	datac => \funct3[2]~input_o\,
	datad => \AltB~input_o\,
	combout => \PCwr~3_combout\);

-- Location: LCCOMB_X60_Y69_N2
\PCwr~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \PCwr~4_combout\ = (\PCwr~3_combout\ & (\funct3[2]~input_o\ & ((\Zero~input_o\) # (!\funct3[0]~input_o\)))) # (!\PCwr~3_combout\ & (\funct3[0]~input_o\ $ (((\Zero~input_o\ & !\funct3[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000011000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Zero~input_o\,
	datab => \funct3[0]~input_o\,
	datac => \funct3[2]~input_o\,
	datad => \PCwr~3_combout\,
	combout => \PCwr~4_combout\);

-- Location: LCCOMB_X57_Y69_N2
\NextState~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \NextState~16_combout\ = (\NextState~15_combout\ & ((!\NextState~20_combout\) # (!\PresentState.Decode~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PresentState.Decode~q\,
	datac => \NextState~20_combout\,
	datad => \NextState~15_combout\,
	combout => \NextState~16_combout\);

-- Location: FF_X57_Y69_N3
\PresentState.JumpExecute\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \NextState~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PresentState.JumpExecute~q\);

-- Location: LCCOMB_X56_Y69_N28
\PCwr~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \PCwr~5_combout\ = (\PresentState.JumpExecute~q\) # (((\PresentState.BranchExecute~q\ & \PCwr~4_combout\)) # (!\PresentState.Fetch~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PresentState.BranchExecute~q\,
	datab => \PCwr~4_combout\,
	datac => \PresentState.JumpExecute~q\,
	datad => \PresentState.Fetch~q\,
	combout => \PCwr~5_combout\);

-- Location: LCCOMB_X56_Y69_N2
\InstAddr~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \InstAddr~0_combout\ = (\PresentState.BranchExecute~q\) # ((\PresentState.JumpExecute~q\) # (!\PresentState.Fetch~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PresentState.BranchExecute~q\,
	datab => \PresentState.Fetch~q\,
	datad => \PresentState.JumpExecute~q\,
	combout => \InstAddr~0_combout\);

-- Location: LCCOMB_X57_Y69_N4
\NextState~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \NextState~17_combout\ = (\NextState~8_combout\ & (\Opcode[5]~input_o\ & \PresentState.storeLoadExecute~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \NextState~8_combout\,
	datab => \Opcode[5]~input_o\,
	datad => \PresentState.storeLoadExecute~q\,
	combout => \NextState~17_combout\);

-- Location: FF_X57_Y69_N5
\PresentState.memAccessStore\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	d => \NextState~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PresentState.memAccessStore~q\);

-- Location: LCCOMB_X68_Y72_N0
\MemSize~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \MemSize~1_combout\ = (\funct3[0]~input_o\ & (\PresentState.memAccessStore~q\ & (!\PresentState.memAccessLoad~q\ & !\funct3[2]~input_o\))) # (!\funct3[0]~input_o\ & (((\PresentState.memAccessLoad~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PresentState.memAccessStore~q\,
	datab => \funct3[0]~input_o\,
	datac => \PresentState.memAccessLoad~q\,
	datad => \funct3[2]~input_o\,
	combout => \MemSize~1_combout\);

-- Location: LCCOMB_X68_Y72_N22
\MemSize~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \MemSize~2_combout\ = (\PresentState.memAccessStore~q\ & (\funct3[1]~input_o\ & (!\PresentState.memAccessLoad~q\ & !\funct3[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PresentState.memAccessStore~q\,
	datab => \funct3[1]~input_o\,
	datac => \PresentState.memAccessLoad~q\,
	datad => \funct3[2]~input_o\,
	combout => \MemSize~2_combout\);

-- Location: LCCOMB_X68_Y72_N24
\MemSize~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \MemSize~3_combout\ = (\MemSize~2_combout\) # ((\PresentState.memAccessLoad~q\ & (\funct3[0]~input_o\ $ (\funct3[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PresentState.memAccessLoad~q\,
	datab => \funct3[0]~input_o\,
	datac => \MemSize~2_combout\,
	datad => \funct3[1]~input_o\,
	combout => \MemSize~3_combout\);

-- Location: LCCOMB_X68_Y72_N18
\MemSize~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \MemSize~4_combout\ = (\PresentState.memAccessLoad~q\ & (((\funct3[0]~input_o\ & \funct3[1]~input_o\)))) # (!\PresentState.memAccessLoad~q\ & (!\PresentState.memAccessStore~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PresentState.memAccessStore~q\,
	datab => \funct3[0]~input_o\,
	datac => \PresentState.memAccessLoad~q\,
	datad => \funct3[1]~input_o\,
	combout => \MemSize~4_combout\);

-- Location: LCCOMB_X68_Y72_N12
\MemSize~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \MemSize~5_combout\ = (\MemSize~4_combout\) # (\funct3[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MemSize~4_combout\,
	datad => \funct3[2]~input_o\,
	combout => \MemSize~5_combout\);

-- Location: FF_X57_Y69_N23
\PresentState.ArthemeticWriteBack\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	asdata => \PresentState.ArthemeticExecute~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PresentState.ArthemeticWriteBack~q\);

-- Location: LCCOMB_X57_Y69_N12
\MemRd~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \MemRd~0_combout\ = (!\PresentState.JumpExecute~q\ & !\PresentState.ArthemeticWriteBack~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \PresentState.JumpExecute~q\,
	datad => \PresentState.ArthemeticWriteBack~q\,
	combout => \MemRd~0_combout\);

-- Location: LCCOMB_X57_Y69_N28
\RegWr~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegWr~0_combout\ = (!\PresentState.BranchExecute~q\ & (!\PresentState.storeLoadExecute~q\ & (!\PresentState.ArthemeticExecute~q\ & !\PresentState.Decode~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PresentState.BranchExecute~q\,
	datab => \PresentState.storeLoadExecute~q\,
	datac => \PresentState.ArthemeticExecute~q\,
	datad => \PresentState.Decode~q\,
	combout => \RegWr~0_combout\);

-- Location: LCCOMB_X57_Y69_N0
\MemRd~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \MemRd~1_combout\ = ((\PresentState.memAccessLoad~q\ & (\MemRd~0_combout\ & \RegWr~0_combout\))) # (!\PresentState.Fetch~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PresentState.memAccessLoad~q\,
	datab => \MemRd~0_combout\,
	datac => \RegWr~0_combout\,
	datad => \PresentState.Fetch~q\,
	combout => \MemRd~1_combout\);

-- Location: FF_X57_Y69_N9
\PresentState.writeBackLoad\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputclkctrl_outclk\,
	asdata => \PresentState.memAccessLoad~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PresentState.writeBackLoad~q\);

-- Location: LCCOMB_X56_Y69_N16
\RegWr~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegWr~1_combout\ = (\PresentState.Fetch~q\ & (\RegWr~0_combout\ & ((\PresentState.writeBackLoad~q\) # (!\MemRd~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MemRd~0_combout\,
	datab => \PresentState.Fetch~q\,
	datac => \PresentState.writeBackLoad~q\,
	datad => \RegWr~0_combout\,
	combout => \RegWr~1_combout\);

-- Location: LCCOMB_X56_Y69_N14
\RegInSrc~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegInSrc~0_combout\ = (!\PresentState.writeBackLoad~q\ & !\PresentState.JumpExecute~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \PresentState.writeBackLoad~q\,
	datad => \PresentState.JumpExecute~q\,
	combout => \RegInSrc~0_combout\);

-- Location: LCCOMB_X58_Y69_N20
\Equal6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal6~0_combout\ = (\Opcode[4]~input_o\ & (\Equal5~0_combout\ & (\Opcode[2]~input_o\ & !\Opcode[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[4]~input_o\,
	datab => \Equal5~0_combout\,
	datac => \Opcode[2]~input_o\,
	datad => \Opcode[3]~input_o\,
	combout => \Equal6~0_combout\);

-- Location: LCCOMB_X58_Y69_N24
\ExuSrcB~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \ExuSrcB~10_combout\ = (\Equal6~0_combout\) # ((\Equal5~1_combout\ & (!\Opcode[5]~input_o\ & !\Opcode[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~1_combout\,
	datab => \Equal6~0_combout\,
	datac => \Opcode[5]~input_o\,
	datad => \Opcode[3]~input_o\,
	combout => \ExuSrcB~10_combout\);

-- Location: LCCOMB_X59_Y69_N18
\ShiftFn~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ShiftFn~2_combout\ = (\PresentState.ArthemeticExecute~q\ & (((\Opcode[3]~input_o\) # (!\Opcode[5]~input_o\)) # (!\Equal5~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~1_combout\,
	datab => \Opcode[5]~input_o\,
	datac => \Opcode[3]~input_o\,
	datad => \PresentState.ArthemeticExecute~q\,
	combout => \ShiftFn~2_combout\);

-- Location: LCCOMB_X58_Y69_N18
\ExuSrcB~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ExuSrcB~3_combout\ = (\ExuSrcB~10_combout\ & (!\ShiftFn~2_combout\ & ((\PresentState.ArthemeticExecute~q\) # (!\ExuSrcB~2_combout\)))) # (!\ExuSrcB~10_combout\ & (((\PresentState.ArthemeticExecute~q\) # (!\ExuSrcB~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ExuSrcB~10_combout\,
	datab => \ShiftFn~2_combout\,
	datac => \ExuSrcB~2_combout\,
	datad => \PresentState.ArthemeticExecute~q\,
	combout => \ExuSrcB~3_combout\);

-- Location: LCCOMB_X56_Y69_N20
\ExuSrcB~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ExuSrcB~4_combout\ = ((!\PresentState.Decode~q\ & ((\PresentState.JumpExecute~q\) # (!\ExuSrcB~3_combout\)))) # (!\PresentState.Fetch~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PresentState.JumpExecute~q\,
	datab => \PresentState.Fetch~q\,
	datac => \PresentState.Decode~q\,
	datad => \ExuSrcB~3_combout\,
	combout => \ExuSrcB~4_combout\);

-- Location: LCCOMB_X59_Y69_N24
\Equal5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal5~2_combout\ = (!\Opcode[3]~input_o\ & !\Opcode[5]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Opcode[3]~input_o\,
	datac => \Opcode[5]~input_o\,
	combout => \Equal5~2_combout\);

-- Location: LCCOMB_X58_Y69_N12
\Equal5~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal5~3_combout\ = (\Opcode[4]~input_o\ & (\Equal5~0_combout\ & (!\Opcode[2]~input_o\ & \Equal5~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[4]~input_o\,
	datab => \Equal5~0_combout\,
	datac => \Opcode[2]~input_o\,
	datad => \Equal5~2_combout\,
	combout => \Equal5~3_combout\);

-- Location: LCCOMB_X58_Y69_N30
\ExuSrcB~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ExuSrcB~5_combout\ = (\PresentState.storeLoadExecute~q\ & (!\PresentState.ArthemeticExecute~q\ & ((\Opcode[5]~input_o\) # (!\NextState~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[5]~input_o\,
	datab => \PresentState.storeLoadExecute~q\,
	datac => \NextState~8_combout\,
	datad => \PresentState.ArthemeticExecute~q\,
	combout => \ExuSrcB~5_combout\);

-- Location: LCCOMB_X58_Y69_N28
\ExuSrcB~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ExuSrcB~6_combout\ = (\ExuSrcB~5_combout\) # ((!\Equal5~3_combout\ & (\Equal6~0_combout\ & \ShiftFn~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~3_combout\,
	datab => \Equal6~0_combout\,
	datac => \ExuSrcB~5_combout\,
	datad => \ShiftFn~2_combout\,
	combout => \ExuSrcB~6_combout\);

-- Location: LCCOMB_X56_Y69_N10
\ExuSrcB~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ExuSrcB~7_combout\ = ((!\PresentState.Decode~q\ & (!\PresentState.JumpExecute~q\ & \ExuSrcB~6_combout\))) # (!\PresentState.Fetch~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PresentState.Decode~q\,
	datab => \PresentState.Fetch~q\,
	datac => \PresentState.JumpExecute~q\,
	datad => \ExuSrcB~6_combout\,
	combout => \ExuSrcB~7_combout\);

-- Location: LCCOMB_X58_Y69_N16
\NextState~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \NextState~10_combout\ = (\NextState~9_combout\ & \Opcode[6]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \NextState~9_combout\,
	datad => \Opcode[6]~input_o\,
	combout => \NextState~10_combout\);

-- Location: LCCOMB_X56_Y69_N24
\ExuSrcB~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ExuSrcB~8_combout\ = (\Opcode[2]~input_o\ & (\NextState~10_combout\ & (\PresentState.JumpExecute~q\ & \Opcode[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[2]~input_o\,
	datab => \NextState~10_combout\,
	datac => \PresentState.JumpExecute~q\,
	datad => \Opcode[3]~input_o\,
	combout => \ExuSrcB~8_combout\);

-- Location: LCCOMB_X56_Y69_N22
\ExuSrcB~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ExuSrcB~9_combout\ = (\PresentState.Fetch~q\ & (!\PresentState.Decode~q\ & !\ExuSrcB~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \PresentState.Fetch~q\,
	datac => \PresentState.Decode~q\,
	datad => \ExuSrcB~8_combout\,
	combout => \ExuSrcB~9_combout\);

-- Location: LCCOMB_X57_Y69_N26
\ExuSrcA~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ExuSrcA~0_combout\ = (\Equal6~0_combout\ & (!\PresentState.JumpExecute~q\ & (!\Opcode[5]~input_o\ & \PresentState.ArthemeticExecute~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal6~0_combout\,
	datab => \PresentState.JumpExecute~q\,
	datac => \Opcode[5]~input_o\,
	datad => \PresentState.ArthemeticExecute~q\,
	combout => \ExuSrcA~0_combout\);

-- Location: LCCOMB_X56_Y69_N8
\ExuSrcA~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ExuSrcA~1_combout\ = (\ExuSrcB~8_combout\) # (((\PresentState.Decode~q\) # (\ExuSrcA~0_combout\)) # (!\PresentState.Fetch~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ExuSrcB~8_combout\,
	datab => \PresentState.Fetch~q\,
	datac => \PresentState.Decode~q\,
	datad => \ExuSrcA~0_combout\,
	combout => \ExuSrcA~1_combout\);

-- Location: LCCOMB_X59_Y69_N2
\FuncClass~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \FuncClass~1_combout\ = (\funct3[2]~input_o\ & ((\funct3[1]~input_o\) # (!\funct3[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \funct3[1]~input_o\,
	datac => \funct3[2]~input_o\,
	datad => \funct3[0]~input_o\,
	combout => \FuncClass~1_combout\);

-- Location: LCCOMB_X58_Y69_N2
\FuncClass~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \FuncClass~2_combout\ = (\Equal5~3_combout\ & (((\FuncClass~1_combout\)))) # (!\Equal5~3_combout\ & (\Equal6~0_combout\ & (\Opcode[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~3_combout\,
	datab => \Equal6~0_combout\,
	datac => \Opcode[5]~input_o\,
	datad => \FuncClass~1_combout\,
	combout => \FuncClass~2_combout\);

-- Location: LCCOMB_X59_Y69_N4
\FuncClass~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \FuncClass~3_combout\ = (\PresentState.ArthemeticExecute~q\ & ((\funct3[0]~input_o\ & (\funct3[1]~input_o\)) # (!\funct3[0]~input_o\ & ((\funct3[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \funct3[0]~input_o\,
	datab => \funct3[1]~input_o\,
	datac => \funct3[2]~input_o\,
	datad => \PresentState.ArthemeticExecute~q\,
	combout => \FuncClass~3_combout\);

-- Location: LCCOMB_X59_Y69_N22
\FuncClass~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \FuncClass~4_combout\ = (\FuncClass~2_combout\ & ((\ShiftFn~2_combout\) # ((\FuncClass~3_combout\ & \FuncClass~0_combout\)))) # (!\FuncClass~2_combout\ & (((\FuncClass~3_combout\ & \FuncClass~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \FuncClass~2_combout\,
	datab => \ShiftFn~2_combout\,
	datac => \FuncClass~3_combout\,
	datad => \FuncClass~0_combout\,
	combout => \FuncClass~4_combout\);

-- Location: LCCOMB_X59_Y69_N20
\FuncClass~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \FuncClass~5_combout\ = (\AddnSub~0_combout\ & (!\funct3[2]~input_o\ & ((\AddnSub~1_combout\) # (\FuncClass~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AddnSub~1_combout\,
	datab => \AddnSub~0_combout\,
	datac => \funct3[2]~input_o\,
	datad => \FuncClass~0_combout\,
	combout => \FuncClass~5_combout\);

-- Location: LCCOMB_X60_Y69_N14
\ShiftFn~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ShiftFn~6_combout\ = (!\Opcode[5]~input_o\ & (\Equal5~1_combout\ & ((!\Opcode[3]~input_o\) # (!\funct3[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[5]~input_o\,
	datab => \funct3[1]~input_o\,
	datac => \Equal5~1_combout\,
	datad => \Opcode[3]~input_o\,
	combout => \ShiftFn~6_combout\);

-- Location: LCCOMB_X60_Y69_N4
\ShiftFn~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ShiftFn~7_combout\ = (\ShiftFn~6_combout\ & ((\Equal10~0_combout\) # (!\funct3[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal10~0_combout\,
	datab => \funct3[2]~input_o\,
	datac => \ShiftFn~6_combout\,
	combout => \ShiftFn~7_combout\);

-- Location: LCCOMB_X60_Y69_N6
\ShiftFn~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ShiftFn~4_combout\ = (\PresentState.ArthemeticExecute~q\ & (\funct3[2]~input_o\ & (!\funct3[1]~input_o\ & \funct3[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PresentState.ArthemeticExecute~q\,
	datab => \funct3[2]~input_o\,
	datac => \funct3[1]~input_o\,
	datad => \funct3[0]~input_o\,
	combout => \ShiftFn~4_combout\);

-- Location: LCCOMB_X60_Y69_N20
\ShiftFn~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ShiftFn~3_combout\ = (\PCwr~2_combout\ & (\funct3[0]~input_o\ & (\PresentState.ArthemeticExecute~q\ & \Equal9~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PCwr~2_combout\,
	datab => \funct3[0]~input_o\,
	datac => \PresentState.ArthemeticExecute~q\,
	datad => \Equal9~1_combout\,
	combout => \ShiftFn~3_combout\);

-- Location: LCCOMB_X60_Y69_N16
\ShiftFn~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ShiftFn~5_combout\ = (\ShiftFn~10_combout\ & ((\ShiftFn~3_combout\) # ((\ShiftFn~4_combout\ & \Equal10~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ShiftFn~4_combout\,
	datab => \ShiftFn~3_combout\,
	datac => \Equal10~0_combout\,
	datad => \ShiftFn~10_combout\,
	combout => \ShiftFn~5_combout\);

-- Location: LCCOMB_X59_Y69_N30
\ShiftFn~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ShiftFn~8_combout\ = (\ShiftFn~5_combout\) # ((\ShiftFn~7_combout\ & (\ShiftFn~2_combout\ & \funct3[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ShiftFn~7_combout\,
	datab => \ShiftFn~2_combout\,
	datac => \funct3[0]~input_o\,
	datad => \ShiftFn~5_combout\,
	combout => \ShiftFn~8_combout\);

-- Location: LCCOMB_X59_Y69_N8
\Mux11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux11~0_combout\ = (!\funct3[1]~input_o\ & \funct3[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \funct3[1]~input_o\,
	datac => \funct3[0]~input_o\,
	combout => \Mux11~0_combout\);

-- Location: LCCOMB_X59_Y69_N28
\ShiftFn~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ShiftFn~9_combout\ = (\Equal5~1_combout\ & (\ExtWord~2_combout\ & ((\Equal5~2_combout\) # (\Mux11~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal5~1_combout\,
	datab => \Equal5~2_combout\,
	datac => \Mux11~0_combout\,
	datad => \ExtWord~2_combout\,
	combout => \ShiftFn~9_combout\);

-- Location: LCCOMB_X59_Y69_N14
\LogicFn~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LogicFn~0_combout\ = (!\funct3[0]~input_o\ & \PresentState.ArthemeticExecute~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \funct3[0]~input_o\,
	datad => \PresentState.ArthemeticExecute~q\,
	combout => \LogicFn~0_combout\);

-- Location: LCCOMB_X59_Y69_N16
\LogicFn~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LogicFn~1_combout\ = (\LogicFn~0_combout\ & ((\AddnSub~1_combout\) # ((\funct3[2]~input_o\ & \FuncClass~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AddnSub~1_combout\,
	datab => \LogicFn~0_combout\,
	datac => \funct3[2]~input_o\,
	datad => \FuncClass~0_combout\,
	combout => \LogicFn~1_combout\);

-- Location: LCCOMB_X59_Y69_N26
\LogicFn~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LogicFn~2_combout\ = (\AddnSub~0_combout\ & ((\AddnSub~1_combout\) # ((\funct3[2]~input_o\ & \FuncClass~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \AddnSub~1_combout\,
	datab => \AddnSub~0_combout\,
	datac => \funct3[2]~input_o\,
	datad => \FuncClass~0_combout\,
	combout => \LogicFn~2_combout\);

-- Location: LCCOMB_X56_Y69_N18
\PCSrc~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \PCSrc~3_combout\ = (\PresentState.JumpExecute~q\ & (((!\Opcode[3]~input_o\) # (!\NextState~10_combout\)) # (!\Opcode[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Opcode[2]~input_o\,
	datab => \NextState~10_combout\,
	datac => \PresentState.JumpExecute~q\,
	datad => \Opcode[3]~input_o\,
	combout => \PCSrc~3_combout\);

-- Location: LCCOMB_X56_Y69_N0
\PCSrc~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \PCSrc~4_combout\ = (\PCSrc~3_combout\) # ((\PresentState.BranchExecute~q\ & !\PresentState.JumpExecute~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PresentState.BranchExecute~q\,
	datac => \PresentState.JumpExecute~q\,
	datad => \PCSrc~3_combout\,
	combout => \PCSrc~4_combout\);

-- Location: LCCOMB_X56_Y69_N12
\PCSrc~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \PCSrc~2_combout\ = (!\PresentState.JumpExecute~q\ & \PresentState.Fetch~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PresentState.JumpExecute~q\,
	datad => \PresentState.Fetch~q\,
	combout => \PCSrc~2_combout\);

ww_AddnSub <= \AddnSub~output_o\;

ww_ExtWord <= \ExtWord~output_o\;

ww_PCwr <= \PCwr~output_o\;

ww_InstAddr <= \InstAddr~output_o\;

ww_MemSize(0) <= \MemSize[0]~output_o\;

ww_MemSize(1) <= \MemSize[1]~output_o\;

ww_MemSize(2) <= \MemSize[2]~output_o\;

ww_MemWr <= \MemWr~output_o\;

ww_MemRd <= \MemRd~output_o\;

ww_IRWr <= \IRWr~output_o\;

ww_RegWr <= \RegWr~output_o\;

ww_RegInSrc <= \RegInSrc~output_o\;

ww_ExuSrcB(0) <= \ExuSrcB[0]~output_o\;

ww_ExuSrcB(1) <= \ExuSrcB[1]~output_o\;

ww_ExuSrcB(2) <= \ExuSrcB[2]~output_o\;

ww_ExuSrcA <= \ExuSrcA~output_o\;

ww_FuncClass(0) <= \FuncClass[0]~output_o\;

ww_FuncClass(1) <= \FuncClass[1]~output_o\;

ww_ShiftFn(0) <= \ShiftFn[0]~output_o\;

ww_ShiftFn(1) <= \ShiftFn[1]~output_o\;

ww_LogicFn(0) <= \LogicFn[0]~output_o\;

ww_LogicFn(1) <= \LogicFn[1]~output_o\;

ww_PCSrc(0) <= \PCSrc[0]~output_o\;

ww_PCSrc(1) <= \PCSrc[1]~output_o\;
END structure;


