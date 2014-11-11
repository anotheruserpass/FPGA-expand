----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:55:59 11/02/2014 
-- Design Name: 
-- Module Name:    SplitMerge - Behavioral 
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

entity SplitMerge is
	Port (
		sw   : in  STD_LOGIC_VECTOR (15 downto 0);
		btn  : in  STD_LOGIC_VECTOR (15 downto 0);
      led  : out STD_LOGIC_VECTOR ( 7 downto 0);
		LBar : out STD_LOGIC_VECTOR (23 downto 0)
	);

end SplitMerge;

architecture Behavioral of SplitMerge is

begin
	led  <= sw(7 downto 0);
	LBar( 7 downto 0) <=  sw(15 downto 8);
	LBar(23 downto 8) <= btn(15 downto 0);

end Behavioral;

