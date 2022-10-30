--------------------------------------------------------------
 --  Copyright (c) 2011-2022 Anlogic, Inc.
 --  All Right Reserved.
--------------------------------------------------------------
 -- Log	:	This file is generated by Anlogic IP Generator.
 -- File	:	D:/a_FPGA_Project/SF1_PWM/td_project/al_ip/pll.vhd
 -- Date	:	2022 10 08
 -- TD version	:	5.6.59063
--------------------------------------------------------------

-------------------------------------------------------------------------------
--	Input frequency:             25.000MHz
--	Clock multiplication factor: 4
--	Clock division factor:       1
--	Clock information:
--		Clock name	| Frequency 	| Phase shift
--		C0        	| 100.000000MHZ	| 0  DEG     
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;
LIBRARY sf1_macro;
USE sf1_macro.SF1_COMPONENTS.ALL;

ENTITY pll IS
  PORT (
    refclk : IN STD_LOGIC;
    reset : IN STD_LOGIC;
    clk0_out : OUT STD_LOGIC 
  );
END pll;

ARCHITECTURE rtl OF pll IS
  SIGNAL clk0_buf :  STD_LOGIC;
  SIGNAL fbk_wire :  STD_LOGIC;
  SIGNAL clkc_wire :  STD_LOGIC_VECTOR (6 DOWNTO 0);
BEGIN
  bufg_feedback : SF1_LOGIC_BUFG
  PORT MAP (
    i => clk0_buf,
    o => fbk_wire 
  );

  pll_inst : SF1_PHY_PLL
  GENERIC MAP (
    DPHASE_SOURCE => "DISABLE",
    DYNCFG => "DISABLE",
    FIN => "25.000",
    FEEDBK_MODE => "NORMAL",
    FEEDBK_PATH => "CLKC0_EXT",
    STDBY_ENABLE => "DISABLE",
    PLLRST_ENA => "ENABLE",
    SYNC_ENABLE => "DISABLE",
    DERIVE_PLL_CLOCKS => "DISABLE",
    GEN_BASIC_CLOCK => "DISABLE",
    GMC_GAIN => 2,
    ICP_CURRENT => 9,
    KVCO => 2,
    LPF_CAPACITOR => 1,
    LPF_RESISTOR => 8,
    REFCLK_DIV => 1,
    FBCLK_DIV => 4,
    CLKC0_ENABLE => "ENABLE",
    CLKC0_DIV => 10,
    CLKC0_CPHASE => 9,
    CLKC0_FPHASE => 0,
    PU_INTP => "DISABLE",
    INTPI => 0,
    HIGH_SPEED_EN => "DISABLE",
    SSC_ENABLE => "DISABLE",
    SSC_MODE => "Down",
    SSC_AMP => 0.0000,
    SSC_FREQ_DIV => 0,
    SSC_RNGE => 0,
    FREQ_OFFSET => 0.0000,
    OFFSET_MODE => "EXT",
    FREQ_OFFSET_INT => 0,
    CLKC0_DUTY => 0.5000,
    CLKC0_DUTY_INT => 5,
    CLKC0_DUTY50 => "ENABLE",
    GMC_TEST => 9 
  )
  PORT MAP (
    refclk => refclk,
    reset => reset,
    stdby => '0',
    load_reg => '0',
    psclk => '0',
    psdown => '0',
    psstep => '0',
    psclksel => b"000",
    dclk => '0',
    dcs => '0',
    dwe => '0',
    di => b"00000000",
    daddr => b"000000",
    fbclk => fbk_wire,
    clkc => clkc_wire,
    ssc_en => '0',
    frac_offset_valid => '0',
    dsm_refclk => '0',
    dsm_rst => '0' 
  );

  clk0_out <= fbk_wire;
  clk0_buf <= clkc_wire(0);

END rtl;
