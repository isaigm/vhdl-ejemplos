----------------------------------------------------------------------------------
-- Company: Universidad Veracruzana
-- Engineer: Isai Garcia Mendoza
-- 
-- Create Date:    21:31:01 03/11/2022 
-- Design Name: 
-- Module Name:    sumador_n_bits - Behavioral 
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

entity sumador_n_bits is
	generic (n : integer := 16);

    Port (X, Y: in std_logic_vector(n - 1 downto 0); S: out std_logic_vector (n - 1 downto 0));
end sumador_n_bits;

architecture Behavioral of sumador_n_bits is
component sumador_completo is
 --CIN bit de acarreo de entrada
 --COUT bit de acarreo de salida, es decir, el que se produce al sumar A, B y CIN
 PORT(A, B, CIN: in std_logic; COUT, SUM: out std_logic); 
end component;
signal outputs: std_logic_vector(n - 1 downto 0);
begin
	primer_sumador: sumador_completo port map(A => X(0), B => Y(0), CIN => '0', COUT => outputs(0), SUM => S(0)); --el primer sumador en CIN no ingresa nada, es decir, un 0
	arreglo_sumadores: for i in 1 to n - 1 generate --este for es para crear y conectar en serie los sumadores restantes, al CIN actual va la salida ...
		sumador: sumador_completo port map(A => X(i), B => Y(i), CIN => outputs(i - 1), COUT => outputs(i), SUM => S(i));--del sumador anterior y el COUT actual se mapea a ouputs(i), de este forma se podra usar en la siguiente iteracion
	end generate arreglo_sumadores;

  
end Behavioral;
