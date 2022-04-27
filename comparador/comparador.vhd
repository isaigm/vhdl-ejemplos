----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:32:51 03/17/2022 
-- Design Name: 
-- Module Name:    comparador - Behavioral 
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity comparador is
	Port(A, B: in std_logic_vector(7 downto 0); IGUAL, MAYOR, MENOR: out std_logic);
end comparador;

architecture Behavioral of comparador is

begin
process (A, B)
variable VA: unsigned(7 downto 0);
variable VB: unsigned(7 downto 0);
begin
	VA := unsigned(A);
	VB := unsigned(B);
	IGUAL <= '0';
	MAYOR <= '0';
	MENOR <= '0';
	if VA = VB then
	IGUAL <= '1';
	elsif VA > VB then
	MAYOR <= '1';
	else
	MENOR <= '1';
	end if;
	
end process;
end Behavioral;

