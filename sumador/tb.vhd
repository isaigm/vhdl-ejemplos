--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:49:40 03/11/2022
-- Design Name:   
-- Module Name:   C:/Users/isaig/Desktop/vhdl/sumador/tb.vhd
-- Project Name:  sumador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sumador_n_bits
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
entity tb is
generic (n : integer := 16);
--  Port ( );
end tb;

architecture Behavioral of tb is

component sumador_n_bits is
	generic (n : integer := 16);
   Port (X, Y: in std_logic_vector(n-1 downto 0); S: out std_logic_vector (n-1 downto 0));
end component;
signal  XS: std_logic_vector(n-1 downto 0) := "0000000000000000";
signal  YS: std_logic_vector(n-1 downto 0) := "0000000000000000";
signal  SS: std_logic_vector(n-1 downto 0) := "0000000000000000";
begin
DUT: sumador_n_bits port map(X => XS, Y => YS, S => SS);
process
    begin
    XS <= "0000000011110010";
    YS <= "0000000001111110";
    wait for 10ns;
    wait;
    end process;
end Behavioral;
