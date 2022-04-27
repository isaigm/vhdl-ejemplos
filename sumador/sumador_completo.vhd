----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:21:06 03/11/2022 
-- Design Name: 
-- Module Name:    sumador_completo - Behavioral 
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

entity sumador_completo is
	 PORT(A, B, CIN: in std_logic; COUT, SUM: out std_logic); 
end sumador_completo;

architecture Behavioral of sumador_completo is
begin
	SUM <= A xor B xor CIN;
	COUT <= (A and B) or ((A xor B) and CIN);
end Behavioral;

