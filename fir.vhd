----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:23:20 05/08/2022 
-- Design Name: 
-- Module Name:    filter - Behavioral 
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

entity filter is
	generic (n : integer := 5);
	Port(clk, reset: in std_logic; 
	x_in: in signed (15 downto 0); y_out: out signed(31 downto 0));
end filter;

architecture Behavioral of filter is
type mem is array(0 to n) of signed(15 downto 0);
signal delay_line: mem := (others=>(others=>'0'));
signal coef: mem := (x"0001",x"0002",x"0003",x"0004",x"0005", x"0006");
signal sop: signed(31 downto 0):= (others => '0'); --sum of products
begin
	process(clk)
	begin
		if rising_edge(clk) then
			for i in n downto 1 loop
				delay_line(i) <= delay_line(i - 1);
			end loop;
			delay_line(0) <= x_in;
			for i in 0 to n loop
				sop <= sop + coef(i) * delay_line(i);
			end loop;
			y_out <= sop;
			sop <= (others => '0');
		end if;
	end process;
end Behavioral;

