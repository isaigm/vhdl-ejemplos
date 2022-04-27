--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:42:58 03/17/2022
-- Design Name:   
-- Module Name:   C:/Users/isaig/Desktop/vhdl/comparador/sim_comparador.vhd
-- Project Name:  comparador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: comparador
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
 
ENTITY sim_comparador IS
END sim_comparador;
 
ARCHITECTURE behavior OF sim_comparador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT comparador
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         IGUAL : OUT  std_logic;
         MAYOR : OUT  std_logic;
         MENOR : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal IGUAL : std_logic;
   signal MAYOR : std_logic;
   signal MENOR : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: comparador PORT MAP (
          A => A,
          B => B,
          IGUAL => IGUAL,
          MAYOR => MAYOR,
          MENOR => MENOR
        );

   -- Clock process definitions
   process

   begin
		A <= "00111111";
		B <= "00011111";
		wait for 100ns;
		A <= "00111111";
		B <= "00111111";
		wait for 100ns;
		wait;
   end process;
 

END;
