----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:55:59 11/02/2014 
-- Design Name: 
-- Module Name:    TEST - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity TEST is
	Port (
		--follows the old EPP style bus signals
		EppAstb: in std_logic;	--address strobe
		EppDstb: in std_logic;	--data strobe
		EppWr  : in std_logic;  --port write signal
		EppWait: out std_logic; --port wait signal
		EppDB  : inout std_logic_vector(7 downto 0) --port data bus
	);	
end TEST;

architecture Behavioral of TEST is

component IOExpansion
	Port (
	-- Epp-like bus signals
		EppAstb: in std_logic;	--address strobe
		EppDstb: in std_logic;	--data strobe
		EppWr  : in std_logic;  --port write signal
		EppWait: out std_logic; --port wait signal
		EppDB  : inout std_logic_vector(7 downto 0); --port data bus
	-- user exteneded signals
		Led  : in std_logic_vector( 7 downto 0);	-- 0x01    LED_8
		LBar : in std_logic_vector(23 downto 0);  -- 0x02..4 segments_24
		sw   : out std_logic_vector(15 downto 0); -- 0x05..6 switches_16
		Btn  : out std_logic_vector(15 downto 0); -- 0x07..8 buttons_16
		dwOut: out std_logic_vector(31 downto 0); -- 0x09..b userOutput_32bits
		dwIn : in  std_logic_vector(31 downto 0)  -- 0x0d..10 userInput_32bits
		);
end component;

component SplitMerge
	Port (
		sw  : in  std_logic_vector(15 downto 0);
		Btn : in  std_logic_vector(15 downto 0);
		Led : out std_logic_vector(7 downto 0);
		Lbar: out std_logic_vector(23 downto 0)
	);
end component;

signal Led1  : std_logic_vector( 7 downto 0);	-- 0x01    LED_8
signal LBar1 : std_logic_vector(23 downto 0);  -- 0x02..4 segments_24
signal Sw1   : std_logic_vector(15 downto 0); -- 0x05..6 switches_16
signal Btn1  : std_logic_vector(15 downto 0); -- 0x07..8 buttons_16
signal dwBtwn: std_logic_vector(31 downto 0); -- 0x09..b userOutput_32bits 


begin

	IOex: IOExpansion port map(
		EppAstb=>EppAstb,
		EppDstb=>EppDstb,
		EppWr=>EppWr,
		EppDB=>EppDB,
		EppWait=>EppWait,
		Led=>Led1,
		LBar=>LBar1,
		Sw=>Sw1,
		Btn=>Btn1,
		dwOut=>dwBtwn,
		dwIn=>dwBtwn
	);

	SM: SplitMerge port map(
		Sw=>Sw1,
		Btn=>Btn1,
		Led=>Led1,
		LBar=>LBar1
	);
	
end Behavioral;

