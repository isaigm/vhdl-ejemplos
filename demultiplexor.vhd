----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:53:32 05/06/2022 
-- Design Name: 
-- Module Name:    demultiplexor - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity demultiplexor is
	Port(data: in std_logic; sel: in std_logic_vector(1 downto 0); d0, d1, d2, d3: out std_logic);
end demultiplexor;

architecture Behavioral of demultiplexor is
begin
	process(data, sel)
	begin
		case sel is
			when "00" => d0 <= data;
			when "01" => d1 <= data;
			when "10" => d2 <= data;
			when "11" => d3 <= data;
			when others => null;
		end case;
	end process;

end Behavioral;

