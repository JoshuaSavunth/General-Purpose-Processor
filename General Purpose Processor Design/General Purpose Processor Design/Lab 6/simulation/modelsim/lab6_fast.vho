-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "11/27/2024 11:19:33"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ALU IS
    PORT (
	Neg : OUT std_logic;
	aluClk : IN std_logic;
	Reset_A : IN std_logic;
	clk : IN std_logic;
	A : IN std_logic_vector(7 DOWNTO 0);
	Reset_B : IN std_logic;
	B : IN std_logic_vector(7 DOWNTO 0);
	Enable_Decoder : IN std_logic;
	data_in : IN std_logic;
	FSM_reset : IN std_logic;
	OutA : OUT std_logic_vector(3 DOWNTO 0);
	OutB : OUT std_logic_vector(3 DOWNTO 0)
	);
END ALU;

-- Design Ports Information
-- Neg	=>  Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- OutA[3]	=>  Location: PIN_G10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- OutA[2]	=>  Location: PIN_E12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- OutA[1]	=>  Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- OutA[0]	=>  Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- OutB[3]	=>  Location: PIN_D12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- OutB[2]	=>  Location: PIN_E10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- OutB[1]	=>  Location: PIN_F12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- OutB[0]	=>  Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- Enable_Decoder	=>  Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- aluClk	=>  Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data_in	=>  Location: PIN_J10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clk	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- FSM_reset	=>  Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[7]	=>  Location: PIN_F11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Reset_B	=>  Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[7]	=>  Location: PIN_J13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- Reset_A	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[6]	=>  Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[6]	=>  Location: PIN_D9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[5]	=>  Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[5]	=>  Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[4]	=>  Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[4]	=>  Location: PIN_C9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[3]	=>  Location: PIN_J14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[3]	=>  Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[2]	=>  Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[2]	=>  Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[1]	=>  Location: PIN_D10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[1]	=>  Location: PIN_C8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[0]	=>  Location: PIN_J11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[0]	=>  Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF ALU IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Neg : std_logic;
SIGNAL ww_aluClk : std_logic;
SIGNAL ww_Reset_A : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_A : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_Reset_B : std_logic;
SIGNAL ww_B : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_Enable_Decoder : std_logic;
SIGNAL ww_data_in : std_logic;
SIGNAL ww_FSM_reset : std_logic;
SIGNAL ww_OutA : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_OutB : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \aluClk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \FSM_reset~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Reset_B~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Reset_A~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst3|Add0~4_combout\ : std_logic;
SIGNAL \inst3|Add1~2_combout\ : std_logic;
SIGNAL \inst3|Add1~6_combout\ : std_logic;
SIGNAL \inst3|Add2~0_combout\ : std_logic;
SIGNAL \inst3|Add2~8_combout\ : std_logic;
SIGNAL \inst3|Add2~10_combout\ : std_logic;
SIGNAL \inst3|Selector4~0_combout\ : std_logic;
SIGNAL \inst3|Selector4~2_combout\ : std_logic;
SIGNAL \inst3|Selector5~1_combout\ : std_logic;
SIGNAL \inst3|Selector6~0_combout\ : std_logic;
SIGNAL \inst3|Selector6~2_combout\ : std_logic;
SIGNAL \inst3|Selector7~9_combout\ : std_logic;
SIGNAL \inst3|Selector0~0_combout\ : std_logic;
SIGNAL \inst3|Result~4_combout\ : std_logic;
SIGNAL \inst3|Selector3~3_combout\ : std_logic;
SIGNAL \inst3|Selector3~4_combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \aluClk~combout\ : std_logic;
SIGNAL \aluClk~clkctrl_outclk\ : std_logic;
SIGNAL \data_in~combout\ : std_logic;
SIGNAL \inst10|Selector2~0_combout\ : std_logic;
SIGNAL \FSM_reset~combout\ : std_logic;
SIGNAL \FSM_reset~clkctrl_outclk\ : std_logic;
SIGNAL \inst10|yfsm.s2~regout\ : std_logic;
SIGNAL \inst10|Selector3~0_combout\ : std_logic;
SIGNAL \inst10|yfsm.s3~regout\ : std_logic;
SIGNAL \inst10|Selector4~0_combout\ : std_logic;
SIGNAL \inst10|yfsm.s4~regout\ : std_logic;
SIGNAL \inst10|Selector5~0_combout\ : std_logic;
SIGNAL \inst10|yfsm.s5~regout\ : std_logic;
SIGNAL \inst10|Selector6~0_combout\ : std_logic;
SIGNAL \inst10|yfsm.s6~regout\ : std_logic;
SIGNAL \inst10|Selector7~0_combout\ : std_logic;
SIGNAL \inst10|yfsm.s7~regout\ : std_logic;
SIGNAL \inst10|Selector0~0_combout\ : std_logic;
SIGNAL \inst10|yfsm.s0~regout\ : std_logic;
SIGNAL \inst10|Selector1~0_combout\ : std_logic;
SIGNAL \inst10|yfsm.s1~regout\ : std_logic;
SIGNAL \Reset_B~combout\ : std_logic;
SIGNAL \Reset_B~clkctrl_outclk\ : std_logic;
SIGNAL \Reset_A~combout\ : std_logic;
SIGNAL \Reset_A~clkctrl_outclk\ : std_logic;
SIGNAL \inst3|LessThan0~1_cout\ : std_logic;
SIGNAL \inst3|LessThan0~3_cout\ : std_logic;
SIGNAL \inst3|LessThan0~5_cout\ : std_logic;
SIGNAL \inst3|LessThan0~7_cout\ : std_logic;
SIGNAL \inst3|LessThan0~9_cout\ : std_logic;
SIGNAL \inst3|LessThan0~11_cout\ : std_logic;
SIGNAL \inst3|LessThan0~13_cout\ : std_logic;
SIGNAL \inst3|LessThan0~14_combout\ : std_logic;
SIGNAL \Enable_Decoder~combout\ : std_logic;
SIGNAL \inst3|Neg~0_combout\ : std_logic;
SIGNAL \inst3|Neg~regout\ : std_logic;
SIGNAL \inst3|Selector4~6_combout\ : std_logic;
SIGNAL \inst3|Add0~1\ : std_logic;
SIGNAL \inst3|Add0~3\ : std_logic;
SIGNAL \inst3|Add0~5\ : std_logic;
SIGNAL \inst3|Add0~6_combout\ : std_logic;
SIGNAL \inst3|Selector4~1_combout\ : std_logic;
SIGNAL \inst3|Result[3]~1_combout\ : std_logic;
SIGNAL \inst3|Selector7~0_combout\ : std_logic;
SIGNAL \inst3|Result[3]~2_combout\ : std_logic;
SIGNAL \inst3|Selector4~3_combout\ : std_logic;
SIGNAL \inst3|Add2~1\ : std_logic;
SIGNAL \inst3|Add2~3\ : std_logic;
SIGNAL \inst3|Add2~5\ : std_logic;
SIGNAL \inst3|Add2~6_combout\ : std_logic;
SIGNAL \inst3|Selector4~4_combout\ : std_logic;
SIGNAL \inst3|Result[3]~0_combout\ : std_logic;
SIGNAL \inst3|Selector4~5_combout\ : std_logic;
SIGNAL \inst3|Selector4~7_combout\ : std_logic;
SIGNAL \inst3|Selector5~0_combout\ : std_logic;
SIGNAL \inst3|Add1~1\ : std_logic;
SIGNAL \inst3|Add1~3\ : std_logic;
SIGNAL \inst3|Add1~4_combout\ : std_logic;
SIGNAL \inst3|Add2~4_combout\ : std_logic;
SIGNAL \inst3|Result~3_combout\ : std_logic;
SIGNAL \inst3|Selector5~2_combout\ : std_logic;
SIGNAL \inst3|Selector5~3_combout\ : std_logic;
SIGNAL \inst3|Selector5~4_combout\ : std_logic;
SIGNAL \inst3|Selector5~5_combout\ : std_logic;
SIGNAL \inst3|Add0~2_combout\ : std_logic;
SIGNAL \inst3|Selector6~1_combout\ : std_logic;
SIGNAL \inst3|Add2~2_combout\ : std_logic;
SIGNAL \inst3|Selector6~3_combout\ : std_logic;
SIGNAL \inst3|Selector6~4_combout\ : std_logic;
SIGNAL \inst3|Selector6~5_combout\ : std_logic;
SIGNAL \inst3|Selector6~6_combout\ : std_logic;
SIGNAL \inst3|Add0~0_combout\ : std_logic;
SIGNAL \inst3|Selector7~6_combout\ : std_logic;
SIGNAL \inst3|Selector7~7_combout\ : std_logic;
SIGNAL \inst3|Selector7~8_combout\ : std_logic;
SIGNAL \inst3|Selector7~3_combout\ : std_logic;
SIGNAL \inst3|Selector7~4_combout\ : std_logic;
SIGNAL \inst3|Selector7~1_combout\ : std_logic;
SIGNAL \inst3|Add1~0_combout\ : std_logic;
SIGNAL \inst3|Selector7~2_combout\ : std_logic;
SIGNAL \inst3|Selector7~5_combout\ : std_logic;
SIGNAL \inst3|Selector7~10_combout\ : std_logic;
SIGNAL \inst3|Add0~7\ : std_logic;
SIGNAL \inst3|Add0~9\ : std_logic;
SIGNAL \inst3|Add0~11\ : std_logic;
SIGNAL \inst3|Add0~13\ : std_logic;
SIGNAL \inst3|Add0~14_combout\ : std_logic;
SIGNAL \inst3|Selector0~1_combout\ : std_logic;
SIGNAL \inst3|Selector0~3_combout\ : std_logic;
SIGNAL \inst3|Add2~7\ : std_logic;
SIGNAL \inst3|Add2~9\ : std_logic;
SIGNAL \inst3|Add2~11\ : std_logic;
SIGNAL \inst3|Add2~13\ : std_logic;
SIGNAL \inst3|Add2~14_combout\ : std_logic;
SIGNAL \inst3|Selector0~4_combout\ : std_logic;
SIGNAL \inst3|Add1~5\ : std_logic;
SIGNAL \inst3|Add1~7\ : std_logic;
SIGNAL \inst3|Add1~9\ : std_logic;
SIGNAL \inst3|Add1~11\ : std_logic;
SIGNAL \inst3|Add1~13\ : std_logic;
SIGNAL \inst3|Add1~14_combout\ : std_logic;
SIGNAL \inst3|Selector0~2_combout\ : std_logic;
SIGNAL \inst3|Selector0~5_combout\ : std_logic;
SIGNAL \inst3|Selector0~6_combout\ : std_logic;
SIGNAL \inst3|Selector1~0_combout\ : std_logic;
SIGNAL \inst3|Add0~12_combout\ : std_logic;
SIGNAL \inst3|Selector1~1_combout\ : std_logic;
SIGNAL \inst3|Add2~12_combout\ : std_logic;
SIGNAL \inst3|Selector1~2_combout\ : std_logic;
SIGNAL \inst3|Selector1~3_combout\ : std_logic;
SIGNAL \inst3|Add1~12_combout\ : std_logic;
SIGNAL \inst3|Selector1~4_combout\ : std_logic;
SIGNAL \inst3|Selector1~5_combout\ : std_logic;
SIGNAL \inst3|Selector1~6_combout\ : std_logic;
SIGNAL \inst3|Selector2~0_combout\ : std_logic;
SIGNAL \inst3|Add0~10_combout\ : std_logic;
SIGNAL \inst3|Selector2~1_combout\ : std_logic;
SIGNAL \inst3|Add1~10_combout\ : std_logic;
SIGNAL \inst3|Selector2~2_combout\ : std_logic;
SIGNAL \inst3|Selector2~3_combout\ : std_logic;
SIGNAL \inst3|Selector2~4_combout\ : std_logic;
SIGNAL \inst3|Selector2~5_combout\ : std_logic;
SIGNAL \inst3|Selector3~0_combout\ : std_logic;
SIGNAL \inst3|Add0~8_combout\ : std_logic;
SIGNAL \inst3|Selector3~1_combout\ : std_logic;
SIGNAL \inst3|Add1~8_combout\ : std_logic;
SIGNAL \inst3|Selector3~2_combout\ : std_logic;
SIGNAL \inst3|Selector3~5_combout\ : std_logic;
SIGNAL \inst3|Selector3~6_combout\ : std_logic;
SIGNAL \inst3|Result\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst2|Q\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst|Q\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \B~combout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \A~combout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_FSM_reset~clkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_Enable_Decoder~combout\ : std_logic;

BEGIN

Neg <= ww_Neg;
ww_aluClk <= aluClk;
ww_Reset_A <= Reset_A;
ww_clk <= clk;
ww_A <= A;
ww_Reset_B <= Reset_B;
ww_B <= B;
ww_Enable_Decoder <= Enable_Decoder;
ww_data_in <= data_in;
ww_FSM_reset <= FSM_reset;
OutA <= ww_OutA;
OutB <= ww_OutB;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);

\aluClk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \aluClk~combout\);

\FSM_reset~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \FSM_reset~combout\);

\Reset_B~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \Reset_B~combout\);

\Reset_A~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \Reset_A~combout\);
\ALT_INV_FSM_reset~clkctrl_outclk\ <= NOT \FSM_reset~clkctrl_outclk\;
\ALT_INV_Enable_Decoder~combout\ <= NOT \Enable_Decoder~combout\;

-- Location: LCCOMB_X24_Y34_N8
\inst3|Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add0~4_combout\ = ((\inst2|Q\(2) $ (\inst|Q\(2) $ (!\inst3|Add0~3\)))) # (GND)
-- \inst3|Add0~5\ = CARRY((\inst2|Q\(2) & ((\inst|Q\(2)) # (!\inst3|Add0~3\))) # (!\inst2|Q\(2) & (\inst|Q\(2) & !\inst3|Add0~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Q\(2),
	datab => \inst|Q\(2),
	datad => VCC,
	cin => \inst3|Add0~3\,
	combout => \inst3|Add0~4_combout\,
	cout => \inst3|Add0~5\);

-- Location: LCCOMB_X20_Y34_N14
\inst3|Add1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add1~2_combout\ = (\inst2|Q\(1) & ((\inst|Q\(1) & (!\inst3|Add1~1\)) # (!\inst|Q\(1) & ((\inst3|Add1~1\) # (GND))))) # (!\inst2|Q\(1) & ((\inst|Q\(1) & (\inst3|Add1~1\ & VCC)) # (!\inst|Q\(1) & (!\inst3|Add1~1\))))
-- \inst3|Add1~3\ = CARRY((\inst2|Q\(1) & ((!\inst3|Add1~1\) # (!\inst|Q\(1)))) # (!\inst2|Q\(1) & (!\inst|Q\(1) & !\inst3|Add1~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Q\(1),
	datab => \inst|Q\(1),
	datad => VCC,
	cin => \inst3|Add1~1\,
	combout => \inst3|Add1~2_combout\,
	cout => \inst3|Add1~3\);

-- Location: LCCOMB_X20_Y34_N18
\inst3|Add1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add1~6_combout\ = (\inst|Q\(3) & ((\inst2|Q\(3) & (!\inst3|Add1~5\)) # (!\inst2|Q\(3) & (\inst3|Add1~5\ & VCC)))) # (!\inst|Q\(3) & ((\inst2|Q\(3) & ((\inst3|Add1~5\) # (GND))) # (!\inst2|Q\(3) & (!\inst3|Add1~5\))))
-- \inst3|Add1~7\ = CARRY((\inst|Q\(3) & (\inst2|Q\(3) & !\inst3|Add1~5\)) # (!\inst|Q\(3) & ((\inst2|Q\(3)) # (!\inst3|Add1~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Q\(3),
	datab => \inst2|Q\(3),
	datad => VCC,
	cin => \inst3|Add1~5\,
	combout => \inst3|Add1~6_combout\,
	cout => \inst3|Add1~7\);

-- Location: LCCOMB_X21_Y34_N0
\inst3|Add2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~0_combout\ = (\inst|Q\(0) & (\inst2|Q\(0) $ (VCC))) # (!\inst|Q\(0) & ((\inst2|Q\(0)) # (GND)))
-- \inst3|Add2~1\ = CARRY((\inst2|Q\(0)) # (!\inst|Q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Q\(0),
	datab => \inst2|Q\(0),
	datad => VCC,
	combout => \inst3|Add2~0_combout\,
	cout => \inst3|Add2~1\);

-- Location: LCCOMB_X21_Y34_N8
\inst3|Add2~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~8_combout\ = ((\inst|Q\(4) $ (\inst2|Q\(4) $ (\inst3|Add2~7\)))) # (GND)
-- \inst3|Add2~9\ = CARRY((\inst|Q\(4) & (\inst2|Q\(4) & !\inst3|Add2~7\)) # (!\inst|Q\(4) & ((\inst2|Q\(4)) # (!\inst3|Add2~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Q\(4),
	datab => \inst2|Q\(4),
	datad => VCC,
	cin => \inst3|Add2~7\,
	combout => \inst3|Add2~8_combout\,
	cout => \inst3|Add2~9\);

-- Location: LCCOMB_X21_Y34_N10
\inst3|Add2~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~10_combout\ = (\inst2|Q\(5) & ((\inst|Q\(5) & (!\inst3|Add2~9\)) # (!\inst|Q\(5) & (\inst3|Add2~9\ & VCC)))) # (!\inst2|Q\(5) & ((\inst|Q\(5) & ((\inst3|Add2~9\) # (GND))) # (!\inst|Q\(5) & (!\inst3|Add2~9\))))
-- \inst3|Add2~11\ = CARRY((\inst2|Q\(5) & (\inst|Q\(5) & !\inst3|Add2~9\)) # (!\inst2|Q\(5) & ((\inst|Q\(5)) # (!\inst3|Add2~9\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Q\(5),
	datab => \inst|Q\(5),
	datad => VCC,
	cin => \inst3|Add2~9\,
	combout => \inst3|Add2~10_combout\,
	cout => \inst3|Add2~11\);

-- Location: LCCOMB_X19_Y34_N10
\inst3|Selector4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector4~0_combout\ = (!\inst|Q\(3) & (!\inst2|Q\(3) & (\inst10|yfsm.s4~regout\ & \inst10|yfsm.s0~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Q\(3),
	datab => \inst2|Q\(3),
	datac => \inst10|yfsm.s4~regout\,
	datad => \inst10|yfsm.s0~regout\,
	combout => \inst3|Selector4~0_combout\);

-- Location: LCCOMB_X19_Y34_N20
\inst3|Selector4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector4~2_combout\ = (\inst3|Result[3]~1_combout\ & (\inst|Q\(3) & (\inst2|Q\(3)))) # (!\inst3|Result[3]~1_combout\ & (((\inst3|Add1~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Q\(3),
	datab => \inst2|Q\(3),
	datac => \inst3|Result[3]~1_combout\,
	datad => \inst3|Add1~6_combout\,
	combout => \inst3|Selector4~2_combout\);

-- Location: LCCOMB_X24_Y34_N2
\inst3|Selector5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector5~1_combout\ = (!\inst10|yfsm.s0~regout\ & \inst3|Add0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|yfsm.s0~regout\,
	datac => \inst3|Add0~4_combout\,
	combout => \inst3|Selector5~1_combout\);

-- Location: LCCOMB_X20_Y34_N6
\inst3|Selector6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector6~0_combout\ = (\inst10|yfsm.s4~regout\ & (!\inst|Q\(1) & (!\inst2|Q\(1) & \inst10|yfsm.s0~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|yfsm.s4~regout\,
	datab => \inst|Q\(1),
	datac => \inst2|Q\(1),
	datad => \inst10|yfsm.s0~regout\,
	combout => \inst3|Selector6~0_combout\);

-- Location: LCCOMB_X20_Y34_N4
\inst3|Selector6~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector6~2_combout\ = (\inst3|Result[3]~1_combout\ & (\inst2|Q\(1) & (\inst|Q\(1)))) # (!\inst3|Result[3]~1_combout\ & (((\inst3|Add1~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Q\(1),
	datab => \inst|Q\(1),
	datac => \inst3|Add1~2_combout\,
	datad => \inst3|Result[3]~1_combout\,
	combout => \inst3|Selector6~2_combout\);

-- Location: LCCOMB_X25_Y34_N6
\inst3|Selector7~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector7~9_combout\ = (\inst10|yfsm.s0~regout\ & !\inst10|yfsm.s6~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|yfsm.s0~regout\,
	datac => \inst10|yfsm.s6~regout\,
	combout => \inst3|Selector7~9_combout\);

-- Location: LCCOMB_X23_Y34_N20
\inst3|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector0~0_combout\ = (\inst10|yfsm.s0~regout\ & (!\inst2|Q\(7) & (!\inst|Q\(7) & \inst10|yfsm.s4~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|yfsm.s0~regout\,
	datab => \inst2|Q\(7),
	datac => \inst|Q\(7),
	datad => \inst10|yfsm.s4~regout\,
	combout => \inst3|Selector0~0_combout\);

-- Location: LCCOMB_X22_Y34_N6
\inst3|Result~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Result~4_combout\ = (\inst2|Q\(5) & \inst|Q\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|Q\(5),
	datad => \inst|Q\(5),
	combout => \inst3|Result~4_combout\);

-- Location: LCCOMB_X23_Y34_N14
\inst3|Selector3~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector3~3_combout\ = (\inst2|Q\(4) & ((\inst3|Selector7~0_combout\ & ((!\inst3|Result[3]~2_combout\) # (!\inst|Q\(4)))) # (!\inst3|Selector7~0_combout\ & (!\inst|Q\(4) & !\inst3|Result[3]~2_combout\)))) # (!\inst2|Q\(4) & (((\inst|Q\(4)) # 
-- (\inst3|Result[3]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110111011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Q\(4),
	datab => \inst3|Selector7~0_combout\,
	datac => \inst|Q\(4),
	datad => \inst3|Result[3]~2_combout\,
	combout => \inst3|Selector3~3_combout\);

-- Location: LCCOMB_X22_Y34_N24
\inst3|Selector3~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector3~4_combout\ = (\inst3|Result[3]~1_combout\ & (\inst3|Selector3~3_combout\)) # (!\inst3|Result[3]~1_combout\ & ((\inst3|Add2~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst3|Result[3]~1_combout\,
	datac => \inst3|Selector3~3_combout\,
	datad => \inst3|Add2~8_combout\,
	combout => \inst3|Selector3~4_combout\);

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: CLKCTRL_G3
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\aluClk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_aluClk,
	combout => \aluClk~combout\);

-- Location: CLKCTRL_G1
\aluClk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \aluClk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \aluClk~clkctrl_outclk\);

-- Location: PIN_J10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data_in~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data_in,
	combout => \data_in~combout\);

-- Location: LCCOMB_X25_Y34_N10
\inst10|Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst10|Selector2~0_combout\ = (\data_in~combout\ & ((\inst10|yfsm.s1~regout\))) # (!\data_in~combout\ & (\inst10|yfsm.s2~regout\ & !\inst10|yfsm.s1~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_in~combout\,
	datac => \inst10|yfsm.s2~regout\,
	datad => \inst10|yfsm.s1~regout\,
	combout => \inst10|Selector2~0_combout\);

-- Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\FSM_reset~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_FSM_reset,
	combout => \FSM_reset~combout\);

-- Location: CLKCTRL_G2
\FSM_reset~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \FSM_reset~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \FSM_reset~clkctrl_outclk\);

-- Location: LCFF_X25_Y34_N11
\inst10|yfsm.s2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \inst10|Selector2~0_combout\,
	aclr => \ALT_INV_FSM_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst10|yfsm.s2~regout\);

-- Location: LCCOMB_X25_Y34_N0
\inst10|Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst10|Selector3~0_combout\ = (\data_in~combout\ & ((\inst10|yfsm.s2~regout\))) # (!\data_in~combout\ & (\inst10|yfsm.s3~regout\ & !\inst10|yfsm.s2~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_in~combout\,
	datac => \inst10|yfsm.s3~regout\,
	datad => \inst10|yfsm.s2~regout\,
	combout => \inst10|Selector3~0_combout\);

-- Location: LCFF_X25_Y34_N1
\inst10|yfsm.s3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \inst10|Selector3~0_combout\,
	aclr => \ALT_INV_FSM_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst10|yfsm.s3~regout\);

-- Location: LCCOMB_X25_Y34_N12
\inst10|Selector4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst10|Selector4~0_combout\ = (\data_in~combout\ & ((\inst10|yfsm.s3~regout\))) # (!\data_in~combout\ & (\inst10|yfsm.s4~regout\ & !\inst10|yfsm.s3~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_in~combout\,
	datac => \inst10|yfsm.s4~regout\,
	datad => \inst10|yfsm.s3~regout\,
	combout => \inst10|Selector4~0_combout\);

-- Location: LCFF_X25_Y34_N13
\inst10|yfsm.s4\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \inst10|Selector4~0_combout\,
	aclr => \ALT_INV_FSM_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst10|yfsm.s4~regout\);

-- Location: LCCOMB_X25_Y34_N30
\inst10|Selector5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst10|Selector5~0_combout\ = (\data_in~combout\ & ((\inst10|yfsm.s4~regout\))) # (!\data_in~combout\ & (\inst10|yfsm.s5~regout\ & !\inst10|yfsm.s4~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_in~combout\,
	datac => \inst10|yfsm.s5~regout\,
	datad => \inst10|yfsm.s4~regout\,
	combout => \inst10|Selector5~0_combout\);

-- Location: LCFF_X25_Y34_N31
\inst10|yfsm.s5\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \inst10|Selector5~0_combout\,
	aclr => \ALT_INV_FSM_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst10|yfsm.s5~regout\);

-- Location: LCCOMB_X25_Y34_N4
\inst10|Selector6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst10|Selector6~0_combout\ = (\data_in~combout\ & ((\inst10|yfsm.s5~regout\))) # (!\data_in~combout\ & (\inst10|yfsm.s6~regout\ & !\inst10|yfsm.s5~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_in~combout\,
	datac => \inst10|yfsm.s6~regout\,
	datad => \inst10|yfsm.s5~regout\,
	combout => \inst10|Selector6~0_combout\);

-- Location: LCFF_X25_Y34_N5
\inst10|yfsm.s6\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \inst10|Selector6~0_combout\,
	aclr => \ALT_INV_FSM_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst10|yfsm.s6~regout\);

-- Location: LCCOMB_X25_Y34_N28
\inst10|Selector7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst10|Selector7~0_combout\ = (\data_in~combout\ & ((\inst10|yfsm.s6~regout\))) # (!\data_in~combout\ & (\inst10|yfsm.s7~regout\ & !\inst10|yfsm.s6~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_in~combout\,
	datac => \inst10|yfsm.s7~regout\,
	datad => \inst10|yfsm.s6~regout\,
	combout => \inst10|Selector7~0_combout\);

-- Location: LCFF_X25_Y34_N29
\inst10|yfsm.s7\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \inst10|Selector7~0_combout\,
	aclr => \ALT_INV_FSM_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst10|yfsm.s7~regout\);

-- Location: LCCOMB_X25_Y34_N26
\inst10|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst10|Selector0~0_combout\ = (\data_in~combout\ & ((!\inst10|yfsm.s7~regout\))) # (!\data_in~combout\ & ((\inst10|yfsm.s0~regout\) # (\inst10|yfsm.s7~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_in~combout\,
	datac => \inst10|yfsm.s0~regout\,
	datad => \inst10|yfsm.s7~regout\,
	combout => \inst10|Selector0~0_combout\);

-- Location: LCFF_X25_Y34_N27
\inst10|yfsm.s0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \inst10|Selector0~0_combout\,
	aclr => \ALT_INV_FSM_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst10|yfsm.s0~regout\);

-- Location: LCCOMB_X25_Y34_N24
\inst10|Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst10|Selector1~0_combout\ = (\data_in~combout\ & ((!\inst10|yfsm.s0~regout\))) # (!\data_in~combout\ & (\inst10|yfsm.s1~regout\ & \inst10|yfsm.s0~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \data_in~combout\,
	datac => \inst10|yfsm.s1~regout\,
	datad => \inst10|yfsm.s0~regout\,
	combout => \inst10|Selector1~0_combout\);

-- Location: LCFF_X25_Y34_N25
\inst10|yfsm.s1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \inst10|Selector1~0_combout\,
	aclr => \ALT_INV_FSM_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst10|yfsm.s1~regout\);

-- Location: PIN_F11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(7),
	combout => \B~combout\(7));

-- Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Reset_B~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Reset_B,
	combout => \Reset_B~combout\);

-- Location: CLKCTRL_G9
\Reset_B~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Reset_B~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Reset_B~clkctrl_outclk\);

-- Location: LCFF_X21_Y34_N15
\inst|Q[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \B~combout\(7),
	aclr => \Reset_B~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|Q\(7));

-- Location: PIN_J13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(7),
	combout => \A~combout\(7));

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Reset_A~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Reset_A,
	combout => \Reset_A~combout\);

-- Location: CLKCTRL_G11
\Reset_A~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Reset_A~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Reset_A~clkctrl_outclk\);

-- Location: LCFF_X21_Y34_N31
\inst2|Q[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \A~combout\(7),
	aclr => \Reset_A~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|Q\(7));

-- Location: PIN_D8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(6),
	combout => \B~combout\(6));

-- Location: LCFF_X21_Y34_N29
\inst|Q[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \B~combout\(6),
	aclr => \Reset_B~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|Q\(6));

-- Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(5),
	combout => \B~combout\(5));

-- Location: LCFF_X21_Y34_N27
\inst|Q[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \B~combout\(5),
	aclr => \Reset_B~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|Q\(5));

-- Location: PIN_C9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(4),
	combout => \A~combout\(4));

-- Location: LCFF_X21_Y34_N9
\inst2|Q[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \A~combout\(4),
	aclr => \Reset_A~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|Q\(4));

-- Location: PIN_J14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(3),
	combout => \B~combout\(3));

-- Location: LCFF_X21_Y34_N23
\inst|Q[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \B~combout\(3),
	aclr => \Reset_B~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|Q\(3));

-- Location: PIN_A9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(2),
	combout => \A~combout\(2));

-- Location: LCFF_X21_Y34_N5
\inst2|Q[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \A~combout\(2),
	aclr => \Reset_A~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|Q\(2));

-- Location: PIN_C8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(1),
	combout => \A~combout\(1));

-- Location: LCFF_X21_Y34_N3
\inst2|Q[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \A~combout\(1),
	aclr => \Reset_A~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|Q\(1));

-- Location: PIN_C10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(0),
	combout => \A~combout\(0));

-- Location: LCFF_X21_Y34_N1
\inst2|Q[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \A~combout\(0),
	aclr => \Reset_A~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|Q\(0));

-- Location: LCCOMB_X21_Y34_N16
\inst3|LessThan0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|LessThan0~1_cout\ = CARRY((!\inst|Q\(0) & \inst2|Q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Q\(0),
	datab => \inst2|Q\(0),
	datad => VCC,
	cout => \inst3|LessThan0~1_cout\);

-- Location: LCCOMB_X21_Y34_N18
\inst3|LessThan0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|LessThan0~3_cout\ = CARRY((\inst|Q\(1) & ((!\inst3|LessThan0~1_cout\) # (!\inst2|Q\(1)))) # (!\inst|Q\(1) & (!\inst2|Q\(1) & !\inst3|LessThan0~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Q\(1),
	datab => \inst2|Q\(1),
	datad => VCC,
	cin => \inst3|LessThan0~1_cout\,
	cout => \inst3|LessThan0~3_cout\);

-- Location: LCCOMB_X21_Y34_N20
\inst3|LessThan0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|LessThan0~5_cout\ = CARRY((\inst|Q\(2) & (\inst2|Q\(2) & !\inst3|LessThan0~3_cout\)) # (!\inst|Q\(2) & ((\inst2|Q\(2)) # (!\inst3|LessThan0~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Q\(2),
	datab => \inst2|Q\(2),
	datad => VCC,
	cin => \inst3|LessThan0~3_cout\,
	cout => \inst3|LessThan0~5_cout\);

-- Location: LCCOMB_X21_Y34_N22
\inst3|LessThan0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|LessThan0~7_cout\ = CARRY((\inst2|Q\(3) & (\inst|Q\(3) & !\inst3|LessThan0~5_cout\)) # (!\inst2|Q\(3) & ((\inst|Q\(3)) # (!\inst3|LessThan0~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Q\(3),
	datab => \inst|Q\(3),
	datad => VCC,
	cin => \inst3|LessThan0~5_cout\,
	cout => \inst3|LessThan0~7_cout\);

-- Location: LCCOMB_X21_Y34_N24
\inst3|LessThan0~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|LessThan0~9_cout\ = CARRY((\inst|Q\(4) & (\inst2|Q\(4) & !\inst3|LessThan0~7_cout\)) # (!\inst|Q\(4) & ((\inst2|Q\(4)) # (!\inst3|LessThan0~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Q\(4),
	datab => \inst2|Q\(4),
	datad => VCC,
	cin => \inst3|LessThan0~7_cout\,
	cout => \inst3|LessThan0~9_cout\);

-- Location: LCCOMB_X21_Y34_N26
\inst3|LessThan0~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|LessThan0~11_cout\ = CARRY((\inst2|Q\(5) & (\inst|Q\(5) & !\inst3|LessThan0~9_cout\)) # (!\inst2|Q\(5) & ((\inst|Q\(5)) # (!\inst3|LessThan0~9_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Q\(5),
	datab => \inst|Q\(5),
	datad => VCC,
	cin => \inst3|LessThan0~9_cout\,
	cout => \inst3|LessThan0~11_cout\);

-- Location: LCCOMB_X21_Y34_N28
\inst3|LessThan0~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|LessThan0~13_cout\ = CARRY((\inst2|Q\(6) & ((!\inst3|LessThan0~11_cout\) # (!\inst|Q\(6)))) # (!\inst2|Q\(6) & (!\inst|Q\(6) & !\inst3|LessThan0~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Q\(6),
	datab => \inst|Q\(6),
	datad => VCC,
	cin => \inst3|LessThan0~11_cout\,
	cout => \inst3|LessThan0~13_cout\);

-- Location: LCCOMB_X21_Y34_N30
\inst3|LessThan0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|LessThan0~14_combout\ = (\inst|Q\(7) & (\inst3|LessThan0~13_cout\ & \inst2|Q\(7))) # (!\inst|Q\(7) & ((\inst3|LessThan0~13_cout\) # (\inst2|Q\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|Q\(7),
	datad => \inst2|Q\(7),
	cin => \inst3|LessThan0~13_cout\,
	combout => \inst3|LessThan0~14_combout\);

-- Location: PIN_B8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\Enable_Decoder~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_Enable_Decoder,
	combout => \Enable_Decoder~combout\);

-- Location: LCCOMB_X22_Y34_N18
\inst3|Neg~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Neg~0_combout\ = (\inst10|yfsm.s1~regout\ & (\inst3|LessThan0~14_combout\ & \Enable_Decoder~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst10|yfsm.s1~regout\,
	datac => \inst3|LessThan0~14_combout\,
	datad => \Enable_Decoder~combout\,
	combout => \inst3|Neg~0_combout\);

-- Location: LCFF_X22_Y34_N19
\inst3|Neg\ : cycloneii_lcell_ff
PORT MAP (
	clk => \aluClk~clkctrl_outclk\,
	datain => \inst3|Neg~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|Neg~regout\);

-- Location: LCCOMB_X19_Y34_N4
\inst3|Selector4~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector4~6_combout\ = (!\inst10|yfsm.s4~regout\ & \inst10|yfsm.s0~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst10|yfsm.s4~regout\,
	datad => \inst10|yfsm.s0~regout\,
	combout => \inst3|Selector4~6_combout\);

-- Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(3),
	combout => \A~combout\(3));

-- Location: LCFF_X21_Y34_N7
\inst2|Q[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \A~combout\(3),
	aclr => \Reset_A~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|Q\(3));

-- Location: PIN_B9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(2),
	combout => \B~combout\(2));

-- Location: LCFF_X21_Y34_N21
\inst|Q[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \B~combout\(2),
	aclr => \Reset_B~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|Q\(2));

-- Location: PIN_D10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(1),
	combout => \B~combout\(1));

-- Location: LCFF_X21_Y34_N19
\inst|Q[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \B~combout\(1),
	aclr => \Reset_B~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|Q\(1));

-- Location: LCCOMB_X24_Y34_N4
\inst3|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add0~0_combout\ = (\inst|Q\(0) & (\inst2|Q\(0) $ (VCC))) # (!\inst|Q\(0) & (\inst2|Q\(0) & VCC))
-- \inst3|Add0~1\ = CARRY((\inst|Q\(0) & \inst2|Q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Q\(0),
	datab => \inst2|Q\(0),
	datad => VCC,
	combout => \inst3|Add0~0_combout\,
	cout => \inst3|Add0~1\);

-- Location: LCCOMB_X24_Y34_N6
\inst3|Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add0~2_combout\ = (\inst2|Q\(1) & ((\inst|Q\(1) & (\inst3|Add0~1\ & VCC)) # (!\inst|Q\(1) & (!\inst3|Add0~1\)))) # (!\inst2|Q\(1) & ((\inst|Q\(1) & (!\inst3|Add0~1\)) # (!\inst|Q\(1) & ((\inst3|Add0~1\) # (GND)))))
-- \inst3|Add0~3\ = CARRY((\inst2|Q\(1) & (!\inst|Q\(1) & !\inst3|Add0~1\)) # (!\inst2|Q\(1) & ((!\inst3|Add0~1\) # (!\inst|Q\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Q\(1),
	datab => \inst|Q\(1),
	datad => VCC,
	cin => \inst3|Add0~1\,
	combout => \inst3|Add0~2_combout\,
	cout => \inst3|Add0~3\);

-- Location: LCCOMB_X24_Y34_N10
\inst3|Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add0~6_combout\ = (\inst|Q\(3) & ((\inst2|Q\(3) & (\inst3|Add0~5\ & VCC)) # (!\inst2|Q\(3) & (!\inst3|Add0~5\)))) # (!\inst|Q\(3) & ((\inst2|Q\(3) & (!\inst3|Add0~5\)) # (!\inst2|Q\(3) & ((\inst3|Add0~5\) # (GND)))))
-- \inst3|Add0~7\ = CARRY((\inst|Q\(3) & (!\inst2|Q\(3) & !\inst3|Add0~5\)) # (!\inst|Q\(3) & ((!\inst3|Add0~5\) # (!\inst2|Q\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Q\(3),
	datab => \inst2|Q\(3),
	datad => VCC,
	cin => \inst3|Add0~5\,
	combout => \inst3|Add0~6_combout\,
	cout => \inst3|Add0~7\);

-- Location: LCCOMB_X23_Y34_N0
\inst3|Selector4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector4~1_combout\ = (!\inst10|yfsm.s0~regout\ & \inst3|Add0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|yfsm.s0~regout\,
	datac => \inst3|Add0~6_combout\,
	combout => \inst3|Selector4~1_combout\);

-- Location: LCCOMB_X22_Y34_N30
\inst3|Result[3]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Result[3]~1_combout\ = (!\inst10|yfsm.s1~regout\ & ((!\inst10|yfsm.s5~regout\) # (!\inst10|yfsm.s3~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst10|yfsm.s1~regout\,
	datac => \inst10|yfsm.s3~regout\,
	datad => \inst10|yfsm.s5~regout\,
	combout => \inst3|Result[3]~1_combout\);

-- Location: LCCOMB_X24_Y34_N22
\inst3|Selector7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector7~0_combout\ = (!\inst10|yfsm.s2~regout\ & !\inst10|yfsm.s6~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst10|yfsm.s2~regout\,
	datad => \inst10|yfsm.s6~regout\,
	combout => \inst3|Selector7~0_combout\);

-- Location: LCCOMB_X24_Y34_N28
\inst3|Result[3]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Result[3]~2_combout\ = (\inst10|yfsm.s1~regout\) # ((\inst10|yfsm.s2~regout\) # (\inst10|yfsm.s3~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst10|yfsm.s1~regout\,
	datac => \inst10|yfsm.s2~regout\,
	datad => \inst10|yfsm.s3~regout\,
	combout => \inst3|Result[3]~2_combout\);

-- Location: LCCOMB_X24_Y34_N20
\inst3|Selector4~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector4~3_combout\ = (\inst|Q\(3) & (((\inst3|Selector7~0_combout\ & !\inst3|Result[3]~2_combout\)) # (!\inst2|Q\(3)))) # (!\inst|Q\(3) & ((\inst2|Q\(3) & ((\inst3|Selector7~0_combout\) # (!\inst3|Result[3]~2_combout\))) # (!\inst2|Q\(3) & 
-- ((\inst3|Result[3]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111111011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Q\(3),
	datab => \inst3|Selector7~0_combout\,
	datac => \inst2|Q\(3),
	datad => \inst3|Result[3]~2_combout\,
	combout => \inst3|Selector4~3_combout\);

-- Location: LCCOMB_X21_Y34_N2
\inst3|Add2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~2_combout\ = (\inst|Q\(1) & ((\inst2|Q\(1) & (!\inst3|Add2~1\)) # (!\inst2|Q\(1) & ((\inst3|Add2~1\) # (GND))))) # (!\inst|Q\(1) & ((\inst2|Q\(1) & (\inst3|Add2~1\ & VCC)) # (!\inst2|Q\(1) & (!\inst3|Add2~1\))))
-- \inst3|Add2~3\ = CARRY((\inst|Q\(1) & ((!\inst3|Add2~1\) # (!\inst2|Q\(1)))) # (!\inst|Q\(1) & (!\inst2|Q\(1) & !\inst3|Add2~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Q\(1),
	datab => \inst2|Q\(1),
	datad => VCC,
	cin => \inst3|Add2~1\,
	combout => \inst3|Add2~2_combout\,
	cout => \inst3|Add2~3\);

-- Location: LCCOMB_X21_Y34_N4
\inst3|Add2~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~4_combout\ = ((\inst|Q\(2) $ (\inst2|Q\(2) $ (\inst3|Add2~3\)))) # (GND)
-- \inst3|Add2~5\ = CARRY((\inst|Q\(2) & (\inst2|Q\(2) & !\inst3|Add2~3\)) # (!\inst|Q\(2) & ((\inst2|Q\(2)) # (!\inst3|Add2~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Q\(2),
	datab => \inst2|Q\(2),
	datad => VCC,
	cin => \inst3|Add2~3\,
	combout => \inst3|Add2~4_combout\,
	cout => \inst3|Add2~5\);

-- Location: LCCOMB_X21_Y34_N6
\inst3|Add2~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~6_combout\ = (\inst2|Q\(3) & ((\inst|Q\(3) & (!\inst3|Add2~5\)) # (!\inst|Q\(3) & (\inst3|Add2~5\ & VCC)))) # (!\inst2|Q\(3) & ((\inst|Q\(3) & ((\inst3|Add2~5\) # (GND))) # (!\inst|Q\(3) & (!\inst3|Add2~5\))))
-- \inst3|Add2~7\ = CARRY((\inst2|Q\(3) & (\inst|Q\(3) & !\inst3|Add2~5\)) # (!\inst2|Q\(3) & ((\inst|Q\(3)) # (!\inst3|Add2~5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Q\(3),
	datab => \inst|Q\(3),
	datad => VCC,
	cin => \inst3|Add2~5\,
	combout => \inst3|Add2~6_combout\,
	cout => \inst3|Add2~7\);

-- Location: LCCOMB_X20_Y34_N28
\inst3|Selector4~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector4~4_combout\ = (\inst3|Result[3]~1_combout\ & (\inst3|Selector4~3_combout\)) # (!\inst3|Result[3]~1_combout\ & ((\inst3|Add2~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst3|Result[3]~1_combout\,
	datac => \inst3|Selector4~3_combout\,
	datad => \inst3|Add2~6_combout\,
	combout => \inst3|Selector4~4_combout\);

-- Location: LCCOMB_X22_Y34_N28
\inst3|Result[3]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Result[3]~0_combout\ = (\inst10|yfsm.s1~regout\ & (((\inst3|LessThan0~14_combout\)))) # (!\inst10|yfsm.s1~regout\ & (\inst10|yfsm.s5~regout\ & ((\inst3|LessThan0~14_combout\) # (!\inst10|yfsm.s3~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|yfsm.s5~regout\,
	datab => \inst10|yfsm.s1~regout\,
	datac => \inst3|LessThan0~14_combout\,
	datad => \inst10|yfsm.s3~regout\,
	combout => \inst3|Result[3]~0_combout\);

-- Location: LCCOMB_X19_Y34_N22
\inst3|Selector4~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector4~5_combout\ = (\inst3|Result[3]~0_combout\ & (\inst3|Selector4~2_combout\)) # (!\inst3|Result[3]~0_combout\ & ((\inst3|Selector4~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Selector4~2_combout\,
	datab => \inst3|Selector4~4_combout\,
	datad => \inst3|Result[3]~0_combout\,
	combout => \inst3|Selector4~5_combout\);

-- Location: LCCOMB_X19_Y34_N16
\inst3|Selector4~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector4~7_combout\ = (\inst3|Selector4~0_combout\) # ((\inst3|Selector4~1_combout\) # ((\inst3|Selector4~6_combout\ & \inst3|Selector4~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Selector4~0_combout\,
	datab => \inst3|Selector4~6_combout\,
	datac => \inst3|Selector4~1_combout\,
	datad => \inst3|Selector4~5_combout\,
	combout => \inst3|Selector4~7_combout\);

-- Location: LCFF_X19_Y34_N17
\inst3|Result[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \aluClk~clkctrl_outclk\,
	datain => \inst3|Selector4~7_combout\,
	sclr => \ALT_INV_Enable_Decoder~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|Result\(3));

-- Location: LCCOMB_X23_Y34_N22
\inst3|Selector5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector5~0_combout\ = (\inst10|yfsm.s0~regout\ & (!\inst2|Q\(2) & (!\inst|Q\(2) & \inst10|yfsm.s4~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|yfsm.s0~regout\,
	datab => \inst2|Q\(2),
	datac => \inst|Q\(2),
	datad => \inst10|yfsm.s4~regout\,
	combout => \inst3|Selector5~0_combout\);

-- Location: LCCOMB_X20_Y34_N12
\inst3|Add1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add1~0_combout\ = (\inst|Q\(0) & ((GND) # (!\inst2|Q\(0)))) # (!\inst|Q\(0) & (\inst2|Q\(0) $ (GND)))
-- \inst3|Add1~1\ = CARRY((\inst|Q\(0)) # (!\inst2|Q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Q\(0),
	datab => \inst2|Q\(0),
	datad => VCC,
	combout => \inst3|Add1~0_combout\,
	cout => \inst3|Add1~1\);

-- Location: LCCOMB_X20_Y34_N16
\inst3|Add1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add1~4_combout\ = ((\inst2|Q\(2) $ (\inst|Q\(2) $ (\inst3|Add1~3\)))) # (GND)
-- \inst3|Add1~5\ = CARRY((\inst2|Q\(2) & (\inst|Q\(2) & !\inst3|Add1~3\)) # (!\inst2|Q\(2) & ((\inst|Q\(2)) # (!\inst3|Add1~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Q\(2),
	datab => \inst|Q\(2),
	datad => VCC,
	cin => \inst3|Add1~3\,
	combout => \inst3|Add1~4_combout\,
	cout => \inst3|Add1~5\);

-- Location: LCCOMB_X23_Y34_N4
\inst3|Result~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Result~3_combout\ = (\inst2|Q\(2) & \inst|Q\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|Q\(2),
	datad => \inst|Q\(2),
	combout => \inst3|Result~3_combout\);

-- Location: LCCOMB_X24_Y34_N0
\inst3|Selector5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector5~2_combout\ = (\inst2|Q\(2) & ((\inst|Q\(2) & (\inst3|Selector7~0_combout\ & !\inst3|Result[3]~2_combout\)) # (!\inst|Q\(2) & ((\inst3|Selector7~0_combout\) # (!\inst3|Result[3]~2_combout\))))) # (!\inst2|Q\(2) & ((\inst|Q\(2)) # 
-- ((\inst3|Result[3]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010111100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Q\(2),
	datab => \inst|Q\(2),
	datac => \inst3|Selector7~0_combout\,
	datad => \inst3|Result[3]~2_combout\,
	combout => \inst3|Selector5~2_combout\);

-- Location: LCCOMB_X23_Y34_N6
\inst3|Selector5~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector5~3_combout\ = (\inst3|Result[3]~1_combout\ & ((\inst3|Result[3]~0_combout\ & (\inst3|Result~3_combout\)) # (!\inst3|Result[3]~0_combout\ & ((\inst3|Selector5~2_combout\))))) # (!\inst3|Result[3]~1_combout\ & 
-- (((\inst3|Result[3]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Result[3]~1_combout\,
	datab => \inst3|Result~3_combout\,
	datac => \inst3|Selector5~2_combout\,
	datad => \inst3|Result[3]~0_combout\,
	combout => \inst3|Selector5~3_combout\);

-- Location: LCCOMB_X23_Y34_N12
\inst3|Selector5~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector5~4_combout\ = (\inst3|Result[3]~1_combout\ & (((\inst3|Selector5~3_combout\)))) # (!\inst3|Result[3]~1_combout\ & ((\inst3|Selector5~3_combout\ & (\inst3|Add1~4_combout\)) # (!\inst3|Selector5~3_combout\ & ((\inst3|Add2~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Result[3]~1_combout\,
	datab => \inst3|Add1~4_combout\,
	datac => \inst3|Add2~4_combout\,
	datad => \inst3|Selector5~3_combout\,
	combout => \inst3|Selector5~4_combout\);

-- Location: LCCOMB_X23_Y34_N24
\inst3|Selector5~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector5~5_combout\ = (\inst3|Selector5~1_combout\) # ((\inst3|Selector5~0_combout\) # ((\inst3|Selector4~6_combout\ & \inst3|Selector5~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Selector5~1_combout\,
	datab => \inst3|Selector5~0_combout\,
	datac => \inst3|Selector4~6_combout\,
	datad => \inst3|Selector5~4_combout\,
	combout => \inst3|Selector5~5_combout\);

-- Location: LCFF_X23_Y34_N25
\inst3|Result[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \aluClk~clkctrl_outclk\,
	datain => \inst3|Selector5~5_combout\,
	sclr => \ALT_INV_Enable_Decoder~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|Result\(2));

-- Location: LCCOMB_X23_Y34_N26
\inst3|Selector6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector6~1_combout\ = (!\inst10|yfsm.s0~regout\ & \inst3|Add0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst10|yfsm.s0~regout\,
	datad => \inst3|Add0~2_combout\,
	combout => \inst3|Selector6~1_combout\);

-- Location: LCCOMB_X24_Y34_N26
\inst3|Selector6~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector6~3_combout\ = (\inst2|Q\(1) & ((\inst|Q\(1) & (\inst3|Selector7~0_combout\ & !\inst3|Result[3]~2_combout\)) # (!\inst|Q\(1) & ((\inst3|Selector7~0_combout\) # (!\inst3|Result[3]~2_combout\))))) # (!\inst2|Q\(1) & ((\inst|Q\(1)) # 
-- ((\inst3|Result[3]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010111100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Q\(1),
	datab => \inst|Q\(1),
	datac => \inst3|Selector7~0_combout\,
	datad => \inst3|Result[3]~2_combout\,
	combout => \inst3|Selector6~3_combout\);

-- Location: LCCOMB_X20_Y34_N10
\inst3|Selector6~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector6~4_combout\ = (\inst3|Result[3]~1_combout\ & ((\inst3|Selector6~3_combout\))) # (!\inst3|Result[3]~1_combout\ & (\inst3|Add2~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst3|Result[3]~1_combout\,
	datac => \inst3|Add2~2_combout\,
	datad => \inst3|Selector6~3_combout\,
	combout => \inst3|Selector6~4_combout\);

-- Location: LCCOMB_X19_Y34_N18
\inst3|Selector6~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector6~5_combout\ = (\inst3|Result[3]~0_combout\ & (\inst3|Selector6~2_combout\)) # (!\inst3|Result[3]~0_combout\ & ((\inst3|Selector6~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Selector6~2_combout\,
	datac => \inst3|Selector6~4_combout\,
	datad => \inst3|Result[3]~0_combout\,
	combout => \inst3|Selector6~5_combout\);

-- Location: LCCOMB_X19_Y34_N2
\inst3|Selector6~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector6~6_combout\ = (\inst3|Selector6~0_combout\) # ((\inst3|Selector6~1_combout\) # ((\inst3|Selector4~6_combout\ & \inst3|Selector6~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Selector6~0_combout\,
	datab => \inst3|Selector4~6_combout\,
	datac => \inst3|Selector6~1_combout\,
	datad => \inst3|Selector6~5_combout\,
	combout => \inst3|Selector6~6_combout\);

-- Location: LCFF_X19_Y34_N3
\inst3|Result[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \aluClk~clkctrl_outclk\,
	datain => \inst3|Selector6~6_combout\,
	sclr => \ALT_INV_Enable_Decoder~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|Result\(1));

-- Location: LCCOMB_X25_Y34_N8
\inst3|Selector7~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector7~6_combout\ = (\inst10|yfsm.s6~regout\) # ((\inst10|yfsm.s3~regout\) # (\inst2|Q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst10|yfsm.s6~regout\,
	datac => \inst10|yfsm.s3~regout\,
	datad => \inst2|Q\(0),
	combout => \inst3|Selector7~6_combout\);

-- Location: LCCOMB_X25_Y34_N2
\inst3|Selector7~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector7~7_combout\ = (\inst10|yfsm.s0~regout\ & (!\inst3|Selector7~6_combout\ & (!\inst10|yfsm.s1~regout\ & !\inst10|yfsm.s5~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|yfsm.s0~regout\,
	datab => \inst3|Selector7~6_combout\,
	datac => \inst10|yfsm.s1~regout\,
	datad => \inst10|yfsm.s5~regout\,
	combout => \inst3|Selector7~7_combout\);

-- Location: LCCOMB_X25_Y34_N16
\inst3|Selector7~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector7~8_combout\ = (\inst3|Selector7~7_combout\ & ((\inst10|yfsm.s2~regout\ & ((!\inst10|yfsm.s4~regout\))) # (!\inst10|yfsm.s2~regout\ & (!\inst|Q\(0) & \inst10|yfsm.s4~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Q\(0),
	datab => \inst10|yfsm.s2~regout\,
	datac => \inst10|yfsm.s4~regout\,
	datad => \inst3|Selector7~7_combout\,
	combout => \inst3|Selector7~8_combout\);

-- Location: PIN_J11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(0),
	combout => \B~combout\(0));

-- Location: LCFF_X21_Y34_N17
\inst|Q[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \B~combout\(0),
	aclr => \Reset_B~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|Q\(0));

-- Location: LCCOMB_X25_Y34_N20
\inst3|Selector7~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector7~3_combout\ = (\inst|Q\(0) & ((\inst2|Q\(0) & ((!\inst10|yfsm.s3~regout\))) # (!\inst2|Q\(0) & (!\inst10|yfsm.s5~regout\)))) # (!\inst|Q\(0) & (!\inst10|yfsm.s5~regout\ & ((\inst10|yfsm.s3~regout\) # (\inst2|Q\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011010101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|yfsm.s5~regout\,
	datab => \inst10|yfsm.s3~regout\,
	datac => \inst|Q\(0),
	datad => \inst2|Q\(0),
	combout => \inst3|Selector7~3_combout\);

-- Location: LCCOMB_X25_Y34_N18
\inst3|Selector7~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector7~4_combout\ = (!\inst10|yfsm.s1~regout\ & \inst3|Selector7~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|yfsm.s1~regout\,
	datac => \inst3|Selector7~3_combout\,
	combout => \inst3|Selector7~4_combout\);

-- Location: LCCOMB_X25_Y34_N22
\inst3|Selector7~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector7~1_combout\ = (\inst10|yfsm.s1~regout\) # ((\inst10|yfsm.s3~regout\ & \inst10|yfsm.s5~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|yfsm.s1~regout\,
	datac => \inst10|yfsm.s3~regout\,
	datad => \inst10|yfsm.s5~regout\,
	combout => \inst3|Selector7~1_combout\);

-- Location: LCCOMB_X22_Y34_N0
\inst3|Selector7~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector7~2_combout\ = (\inst3|Selector7~1_combout\ & ((\inst3|LessThan0~14_combout\ & ((\inst3|Add1~0_combout\))) # (!\inst3|LessThan0~14_combout\ & (\inst3|Add2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Add2~0_combout\,
	datab => \inst3|Selector7~1_combout\,
	datac => \inst3|LessThan0~14_combout\,
	datad => \inst3|Add1~0_combout\,
	combout => \inst3|Selector7~2_combout\);

-- Location: LCCOMB_X22_Y34_N2
\inst3|Selector7~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector7~5_combout\ = (\inst3|Selector4~6_combout\ & (\inst3|Selector7~0_combout\ & ((\inst3|Selector7~4_combout\) # (\inst3|Selector7~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Selector4~6_combout\,
	datab => \inst3|Selector7~4_combout\,
	datac => \inst3|Selector7~0_combout\,
	datad => \inst3|Selector7~2_combout\,
	combout => \inst3|Selector7~5_combout\);

-- Location: LCCOMB_X22_Y34_N8
\inst3|Selector7~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector7~10_combout\ = (\inst3|Selector7~8_combout\) # ((\inst3|Selector7~5_combout\) # ((!\inst3|Selector7~9_combout\ & \inst3|Add0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Selector7~9_combout\,
	datab => \inst3|Add0~0_combout\,
	datac => \inst3|Selector7~8_combout\,
	datad => \inst3|Selector7~5_combout\,
	combout => \inst3|Selector7~10_combout\);

-- Location: LCFF_X22_Y34_N9
\inst3|Result[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \aluClk~clkctrl_outclk\,
	datain => \inst3|Selector7~10_combout\,
	sclr => \ALT_INV_Enable_Decoder~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|Result\(0));

-- Location: LCCOMB_X24_Y34_N12
\inst3|Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add0~8_combout\ = ((\inst|Q\(4) $ (\inst2|Q\(4) $ (!\inst3|Add0~7\)))) # (GND)
-- \inst3|Add0~9\ = CARRY((\inst|Q\(4) & ((\inst2|Q\(4)) # (!\inst3|Add0~7\))) # (!\inst|Q\(4) & (\inst2|Q\(4) & !\inst3|Add0~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Q\(4),
	datab => \inst2|Q\(4),
	datad => VCC,
	cin => \inst3|Add0~7\,
	combout => \inst3|Add0~8_combout\,
	cout => \inst3|Add0~9\);

-- Location: LCCOMB_X24_Y34_N14
\inst3|Add0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add0~10_combout\ = (\inst2|Q\(5) & ((\inst|Q\(5) & (\inst3|Add0~9\ & VCC)) # (!\inst|Q\(5) & (!\inst3|Add0~9\)))) # (!\inst2|Q\(5) & ((\inst|Q\(5) & (!\inst3|Add0~9\)) # (!\inst|Q\(5) & ((\inst3|Add0~9\) # (GND)))))
-- \inst3|Add0~11\ = CARRY((\inst2|Q\(5) & (!\inst|Q\(5) & !\inst3|Add0~9\)) # (!\inst2|Q\(5) & ((!\inst3|Add0~9\) # (!\inst|Q\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Q\(5),
	datab => \inst|Q\(5),
	datad => VCC,
	cin => \inst3|Add0~9\,
	combout => \inst3|Add0~10_combout\,
	cout => \inst3|Add0~11\);

-- Location: LCCOMB_X24_Y34_N16
\inst3|Add0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add0~12_combout\ = ((\inst2|Q\(6) $ (\inst|Q\(6) $ (!\inst3|Add0~11\)))) # (GND)
-- \inst3|Add0~13\ = CARRY((\inst2|Q\(6) & ((\inst|Q\(6)) # (!\inst3|Add0~11\))) # (!\inst2|Q\(6) & (\inst|Q\(6) & !\inst3|Add0~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Q\(6),
	datab => \inst|Q\(6),
	datad => VCC,
	cin => \inst3|Add0~11\,
	combout => \inst3|Add0~12_combout\,
	cout => \inst3|Add0~13\);

-- Location: LCCOMB_X24_Y34_N18
\inst3|Add0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add0~14_combout\ = \inst2|Q\(7) $ (\inst3|Add0~13\ $ (\inst|Q\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Q\(7),
	datad => \inst|Q\(7),
	cin => \inst3|Add0~13\,
	combout => \inst3|Add0~14_combout\);

-- Location: LCCOMB_X24_Y34_N24
\inst3|Selector0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector0~1_combout\ = (!\inst10|yfsm.s0~regout\ & \inst3|Add0~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst10|yfsm.s0~regout\,
	datad => \inst3|Add0~14_combout\,
	combout => \inst3|Selector0~1_combout\);

-- Location: LCCOMB_X23_Y34_N8
\inst3|Selector0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector0~3_combout\ = (\inst2|Q\(7) & ((\inst3|Selector7~0_combout\ & ((!\inst3|Result[3]~2_combout\) # (!\inst|Q\(7)))) # (!\inst3|Selector7~0_combout\ & (!\inst|Q\(7) & !\inst3|Result[3]~2_combout\)))) # (!\inst2|Q\(7) & (((\inst|Q\(7)) # 
-- (\inst3|Result[3]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110111011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Q\(7),
	datab => \inst3|Selector7~0_combout\,
	datac => \inst|Q\(7),
	datad => \inst3|Result[3]~2_combout\,
	combout => \inst3|Selector0~3_combout\);

-- Location: LCCOMB_X21_Y34_N12
\inst3|Add2~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~12_combout\ = ((\inst2|Q\(6) $ (\inst|Q\(6) $ (\inst3|Add2~11\)))) # (GND)
-- \inst3|Add2~13\ = CARRY((\inst2|Q\(6) & ((!\inst3|Add2~11\) # (!\inst|Q\(6)))) # (!\inst2|Q\(6) & (!\inst|Q\(6) & !\inst3|Add2~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Q\(6),
	datab => \inst|Q\(6),
	datad => VCC,
	cin => \inst3|Add2~11\,
	combout => \inst3|Add2~12_combout\,
	cout => \inst3|Add2~13\);

-- Location: LCCOMB_X21_Y34_N14
\inst3|Add2~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add2~14_combout\ = \inst|Q\(7) $ (\inst3|Add2~13\ $ (!\inst2|Q\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|Q\(7),
	datad => \inst2|Q\(7),
	cin => \inst3|Add2~13\,
	combout => \inst3|Add2~14_combout\);

-- Location: LCCOMB_X22_Y34_N20
\inst3|Selector0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector0~4_combout\ = (\inst3|Result[3]~1_combout\ & (\inst3|Selector0~3_combout\)) # (!\inst3|Result[3]~1_combout\ & ((\inst3|Add2~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst3|Result[3]~1_combout\,
	datac => \inst3|Selector0~3_combout\,
	datad => \inst3|Add2~14_combout\,
	combout => \inst3|Selector0~4_combout\);

-- Location: PIN_A8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(5),
	combout => \A~combout\(5));

-- Location: LCFF_X21_Y34_N11
\inst2|Q[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \A~combout\(5),
	aclr => \Reset_A~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|Q\(5));

-- Location: LCCOMB_X20_Y34_N20
\inst3|Add1~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add1~8_combout\ = ((\inst|Q\(4) $ (\inst2|Q\(4) $ (\inst3|Add1~7\)))) # (GND)
-- \inst3|Add1~9\ = CARRY((\inst|Q\(4) & ((!\inst3|Add1~7\) # (!\inst2|Q\(4)))) # (!\inst|Q\(4) & (!\inst2|Q\(4) & !\inst3|Add1~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Q\(4),
	datab => \inst2|Q\(4),
	datad => VCC,
	cin => \inst3|Add1~7\,
	combout => \inst3|Add1~8_combout\,
	cout => \inst3|Add1~9\);

-- Location: LCCOMB_X20_Y34_N22
\inst3|Add1~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add1~10_combout\ = (\inst|Q\(5) & ((\inst2|Q\(5) & (!\inst3|Add1~9\)) # (!\inst2|Q\(5) & (\inst3|Add1~9\ & VCC)))) # (!\inst|Q\(5) & ((\inst2|Q\(5) & ((\inst3|Add1~9\) # (GND))) # (!\inst2|Q\(5) & (!\inst3|Add1~9\))))
-- \inst3|Add1~11\ = CARRY((\inst|Q\(5) & (\inst2|Q\(5) & !\inst3|Add1~9\)) # (!\inst|Q\(5) & ((\inst2|Q\(5)) # (!\inst3|Add1~9\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Q\(5),
	datab => \inst2|Q\(5),
	datad => VCC,
	cin => \inst3|Add1~9\,
	combout => \inst3|Add1~10_combout\,
	cout => \inst3|Add1~11\);

-- Location: LCCOMB_X20_Y34_N24
\inst3|Add1~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add1~12_combout\ = ((\inst2|Q\(6) $ (\inst|Q\(6) $ (\inst3|Add1~11\)))) # (GND)
-- \inst3|Add1~13\ = CARRY((\inst2|Q\(6) & (\inst|Q\(6) & !\inst3|Add1~11\)) # (!\inst2|Q\(6) & ((\inst|Q\(6)) # (!\inst3|Add1~11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Q\(6),
	datab => \inst|Q\(6),
	datad => VCC,
	cin => \inst3|Add1~11\,
	combout => \inst3|Add1~12_combout\,
	cout => \inst3|Add1~13\);

-- Location: LCCOMB_X20_Y34_N26
\inst3|Add1~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Add1~14_combout\ = \inst|Q\(7) $ (\inst3|Add1~13\ $ (!\inst2|Q\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst|Q\(7),
	datad => \inst2|Q\(7),
	cin => \inst3|Add1~13\,
	combout => \inst3|Add1~14_combout\);

-- Location: LCCOMB_X23_Y34_N30
\inst3|Selector0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector0~2_combout\ = (\inst3|Result[3]~1_combout\ & (\inst|Q\(7) & (\inst2|Q\(7)))) # (!\inst3|Result[3]~1_combout\ & (((\inst3|Add1~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Q\(7),
	datab => \inst2|Q\(7),
	datac => \inst3|Result[3]~1_combout\,
	datad => \inst3|Add1~14_combout\,
	combout => \inst3|Selector0~2_combout\);

-- Location: LCCOMB_X23_Y34_N18
\inst3|Selector0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector0~5_combout\ = (\inst3|Result[3]~0_combout\ & ((\inst3|Selector0~2_combout\))) # (!\inst3|Result[3]~0_combout\ & (\inst3|Selector0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst3|Result[3]~0_combout\,
	datac => \inst3|Selector0~4_combout\,
	datad => \inst3|Selector0~2_combout\,
	combout => \inst3|Selector0~5_combout\);

-- Location: LCCOMB_X23_Y34_N2
\inst3|Selector0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector0~6_combout\ = (\inst3|Selector0~0_combout\) # ((\inst3|Selector0~1_combout\) # ((\inst3|Selector4~6_combout\ & \inst3|Selector0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Selector0~0_combout\,
	datab => \inst3|Selector0~1_combout\,
	datac => \inst3|Selector4~6_combout\,
	datad => \inst3|Selector0~5_combout\,
	combout => \inst3|Selector0~6_combout\);

-- Location: LCFF_X23_Y34_N3
\inst3|Result[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \aluClk~clkctrl_outclk\,
	datain => \inst3|Selector0~6_combout\,
	sclr => \ALT_INV_Enable_Decoder~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|Result\(7));

-- Location: PIN_D9,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(6),
	combout => \A~combout\(6));

-- Location: LCFF_X21_Y34_N13
\inst2|Q[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \A~combout\(6),
	aclr => \Reset_A~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst2|Q\(6));

-- Location: LCCOMB_X20_Y34_N8
\inst3|Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector1~0_combout\ = (\inst10|yfsm.s4~regout\ & (!\inst|Q\(6) & (!\inst2|Q\(6) & \inst10|yfsm.s0~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|yfsm.s4~regout\,
	datab => \inst|Q\(6),
	datac => \inst2|Q\(6),
	datad => \inst10|yfsm.s0~regout\,
	combout => \inst3|Selector1~0_combout\);

-- Location: LCCOMB_X19_Y34_N8
\inst3|Selector1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector1~1_combout\ = (!\inst10|yfsm.s0~regout\ & \inst3|Add0~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|yfsm.s0~regout\,
	datad => \inst3|Add0~12_combout\,
	combout => \inst3|Selector1~1_combout\);

-- Location: LCCOMB_X24_Y34_N30
\inst3|Selector1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector1~2_combout\ = (\inst2|Q\(6) & ((\inst3|Selector7~0_combout\ & ((!\inst3|Result[3]~2_combout\) # (!\inst|Q\(6)))) # (!\inst3|Selector7~0_combout\ & (!\inst|Q\(6) & !\inst3|Result[3]~2_combout\)))) # (!\inst2|Q\(6) & (((\inst|Q\(6)) # 
-- (\inst3|Result[3]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110111011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Q\(6),
	datab => \inst3|Selector7~0_combout\,
	datac => \inst|Q\(6),
	datad => \inst3|Result[3]~2_combout\,
	combout => \inst3|Selector1~2_combout\);

-- Location: LCCOMB_X20_Y34_N30
\inst3|Selector1~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector1~3_combout\ = (\inst3|Result[3]~1_combout\ & ((\inst3|Selector1~2_combout\))) # (!\inst3|Result[3]~1_combout\ & (\inst3|Add2~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst3|Result[3]~1_combout\,
	datac => \inst3|Add2~12_combout\,
	datad => \inst3|Selector1~2_combout\,
	combout => \inst3|Selector1~3_combout\);

-- Location: LCCOMB_X20_Y34_N0
\inst3|Selector1~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector1~4_combout\ = (\inst3|Result[3]~1_combout\ & (\inst2|Q\(6) & (\inst|Q\(6)))) # (!\inst3|Result[3]~1_combout\ & (((\inst3|Add1~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Q\(6),
	datab => \inst|Q\(6),
	datac => \inst3|Add1~12_combout\,
	datad => \inst3|Result[3]~1_combout\,
	combout => \inst3|Selector1~4_combout\);

-- Location: LCCOMB_X19_Y34_N6
\inst3|Selector1~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector1~5_combout\ = (\inst3|Result[3]~0_combout\ & ((\inst3|Selector1~4_combout\))) # (!\inst3|Result[3]~0_combout\ & (\inst3|Selector1~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst3|Selector1~3_combout\,
	datac => \inst3|Selector1~4_combout\,
	datad => \inst3|Result[3]~0_combout\,
	combout => \inst3|Selector1~5_combout\);

-- Location: LCCOMB_X19_Y34_N24
\inst3|Selector1~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector1~6_combout\ = (\inst3|Selector1~0_combout\) # ((\inst3|Selector1~1_combout\) # ((\inst3|Selector4~6_combout\ & \inst3|Selector1~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Selector4~6_combout\,
	datab => \inst3|Selector1~0_combout\,
	datac => \inst3|Selector1~1_combout\,
	datad => \inst3|Selector1~5_combout\,
	combout => \inst3|Selector1~6_combout\);

-- Location: LCFF_X19_Y34_N25
\inst3|Result[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \aluClk~clkctrl_outclk\,
	datain => \inst3|Selector1~6_combout\,
	sclr => \ALT_INV_Enable_Decoder~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|Result\(6));

-- Location: LCCOMB_X20_Y34_N2
\inst3|Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector2~0_combout\ = (\inst10|yfsm.s4~regout\ & (!\inst2|Q\(5) & (!\inst|Q\(5) & \inst10|yfsm.s0~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|yfsm.s4~regout\,
	datab => \inst2|Q\(5),
	datac => \inst|Q\(5),
	datad => \inst10|yfsm.s0~regout\,
	combout => \inst3|Selector2~0_combout\);

-- Location: LCCOMB_X23_Y34_N16
\inst3|Selector2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector2~1_combout\ = (!\inst10|yfsm.s0~regout\ & \inst3|Add0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|yfsm.s0~regout\,
	datac => \inst3|Add0~10_combout\,
	combout => \inst3|Selector2~1_combout\);

-- Location: LCCOMB_X22_Y34_N16
\inst3|Selector2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector2~2_combout\ = (\inst|Q\(5) & (((\inst3|Selector7~0_combout\ & !\inst3|Result[3]~2_combout\)) # (!\inst2|Q\(5)))) # (!\inst|Q\(5) & ((\inst2|Q\(5) & ((\inst3|Selector7~0_combout\) # (!\inst3|Result[3]~2_combout\))) # (!\inst2|Q\(5) & 
-- ((\inst3|Result[3]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111110111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Selector7~0_combout\,
	datab => \inst|Q\(5),
	datac => \inst2|Q\(5),
	datad => \inst3|Result[3]~2_combout\,
	combout => \inst3|Selector2~2_combout\);

-- Location: LCCOMB_X22_Y34_N26
\inst3|Selector2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector2~3_combout\ = (\inst3|Result[3]~1_combout\ & ((\inst3|Result[3]~0_combout\ & (\inst3|Result~4_combout\)) # (!\inst3|Result[3]~0_combout\ & ((\inst3|Selector2~2_combout\))))) # (!\inst3|Result[3]~1_combout\ & 
-- (((\inst3|Result[3]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Result~4_combout\,
	datab => \inst3|Result[3]~1_combout\,
	datac => \inst3|Selector2~2_combout\,
	datad => \inst3|Result[3]~0_combout\,
	combout => \inst3|Selector2~3_combout\);

-- Location: LCCOMB_X22_Y34_N12
\inst3|Selector2~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector2~4_combout\ = (\inst3|Result[3]~1_combout\ & (((\inst3|Selector2~3_combout\)))) # (!\inst3|Result[3]~1_combout\ & ((\inst3|Selector2~3_combout\ & ((\inst3|Add1~10_combout\))) # (!\inst3|Selector2~3_combout\ & (\inst3|Add2~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Add2~10_combout\,
	datab => \inst3|Result[3]~1_combout\,
	datac => \inst3|Add1~10_combout\,
	datad => \inst3|Selector2~3_combout\,
	combout => \inst3|Selector2~4_combout\);

-- Location: LCCOMB_X22_Y34_N22
\inst3|Selector2~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector2~5_combout\ = (\inst3|Selector2~0_combout\) # ((\inst3|Selector2~1_combout\) # ((\inst3|Selector4~6_combout\ & \inst3|Selector2~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Selector4~6_combout\,
	datab => \inst3|Selector2~0_combout\,
	datac => \inst3|Selector2~1_combout\,
	datad => \inst3|Selector2~4_combout\,
	combout => \inst3|Selector2~5_combout\);

-- Location: LCFF_X22_Y34_N23
\inst3|Result[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \aluClk~clkctrl_outclk\,
	datain => \inst3|Selector2~5_combout\,
	sclr => \ALT_INV_Enable_Decoder~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|Result\(5));

-- Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(4),
	combout => \B~combout\(4));

-- Location: LCFF_X21_Y34_N25
\inst|Q[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \B~combout\(4),
	aclr => \Reset_B~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst|Q\(4));

-- Location: LCCOMB_X23_Y34_N10
\inst3|Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector3~0_combout\ = (\inst10|yfsm.s4~regout\ & (!\inst|Q\(4) & (\inst10|yfsm.s0~regout\ & !\inst2|Q\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|yfsm.s4~regout\,
	datab => \inst|Q\(4),
	datac => \inst10|yfsm.s0~regout\,
	datad => \inst2|Q\(4),
	combout => \inst3|Selector3~0_combout\);

-- Location: LCCOMB_X22_Y34_N14
\inst3|Selector3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector3~1_combout\ = (!\inst10|yfsm.s0~regout\ & \inst3|Add0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst10|yfsm.s0~regout\,
	datad => \inst3|Add0~8_combout\,
	combout => \inst3|Selector3~1_combout\);

-- Location: LCCOMB_X23_Y34_N28
\inst3|Selector3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector3~2_combout\ = (\inst3|Result[3]~1_combout\ & (\inst2|Q\(4) & (\inst|Q\(4)))) # (!\inst3|Result[3]~1_combout\ & (((\inst3|Add1~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|Q\(4),
	datab => \inst|Q\(4),
	datac => \inst3|Result[3]~1_combout\,
	datad => \inst3|Add1~8_combout\,
	combout => \inst3|Selector3~2_combout\);

-- Location: LCCOMB_X22_Y34_N10
\inst3|Selector3~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector3~5_combout\ = (\inst3|Result[3]~0_combout\ & ((\inst3|Selector3~2_combout\))) # (!\inst3|Result[3]~0_combout\ & (\inst3|Selector3~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Selector3~4_combout\,
	datab => \inst3|Result[3]~0_combout\,
	datad => \inst3|Selector3~2_combout\,
	combout => \inst3|Selector3~5_combout\);

-- Location: LCCOMB_X22_Y34_N4
\inst3|Selector3~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \inst3|Selector3~6_combout\ = (\inst3|Selector3~0_combout\) # ((\inst3|Selector3~1_combout\) # ((\inst3|Selector4~6_combout\ & \inst3|Selector3~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|Selector4~6_combout\,
	datab => \inst3|Selector3~0_combout\,
	datac => \inst3|Selector3~1_combout\,
	datad => \inst3|Selector3~5_combout\,
	combout => \inst3|Selector3~6_combout\);

-- Location: LCFF_X22_Y34_N5
\inst3|Result[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \aluClk~clkctrl_outclk\,
	datain => \inst3|Selector3~6_combout\,
	sclr => \ALT_INV_Enable_Decoder~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \inst3|Result\(4));

-- Location: PIN_G12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\Neg~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst3|Neg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_Neg);

-- Location: PIN_G10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OutA[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst3|Result\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_OutA(3));

-- Location: PIN_E12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OutA[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst3|Result\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_OutA(2));

-- Location: PIN_H12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OutA[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst3|Result\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_OutA(1));

-- Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OutA[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst3|Result\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_OutA(0));

-- Location: PIN_D12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OutB[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst3|Result\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_OutB(3));

-- Location: PIN_E10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OutB[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst3|Result\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_OutB(2));

-- Location: PIN_F12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OutB[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst3|Result\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_OutB(1));

-- Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\OutB[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \inst3|Result\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_OutB(0));
END structure;


