----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:44:52 05/06/2022 
-- Design Name: 
-- Module Name:    lfsr - Behavioral 
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

entity lfsr is
	Port(clk: in std_logic; output: out std_logic_vector(15 downto 0));
end lfsr;

architecture Behavioral of lfsr is
signal currentState: std_logic_vector(15 downto 0) := "0001110001111101";
signal feedback: std_logic := '0';
begin
	
	process(clk)
	begin
		if rising_edge(clk) then
			output <= currentState;
			feedback <= currentState(0) xor currentState(1);
			currentState <= std_logic_vector(shift_right(unsigned(currentState), 1));
			currentState(15) <= feedback;
		end if;
	end process;

end Behavioral;

