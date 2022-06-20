
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mov_avg_filter is
    generic(M: integer := 8);
    Port (clk: in std_logic; input: in std_logic_vector(15 downto 0); output: out std_logic_vector(15 downto 0) );
end mov_avg_filter;

architecture Behavioral of mov_avg_filter is
function log2 (x : integer) return integer is
    variable i : integer;
    begin
        i := 0;  
        while (2**i < x) and i < 31 loop
            i := i + 1;
            end loop;
        return i;
end function;

type   shift_array is array(0 to M - 1) of std_logic_vector(15 downto 0);
signal bits: integer := log2(M);
signal last_output: signed(15 downto 0) := (others => '0');
signal delay_line: shift_array := (others=>(others=>'0'));

begin
  
    process(clk)
    variable result: signed(15 downto 0) := (others=>'0');
    variable temp: signed(15 downto 0) := (others=>'0');

    begin 
        if rising_edge(clk) then
            result := signed(input) - signed(delay_line(M - 1));
            temp := last_output + shift_right(result, bits);
            output <= std_logic_vector(temp);
            last_output <= temp;
            for i in M - 1 downto 1 loop
                delay_line(i) <= delay_line(i - 1);
            end loop;
            delay_line(0) <= input;
           
        end if;
    end process;
end Behavioral;
