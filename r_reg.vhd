library IEEE;
use IEEE.std_logic_1164.all;

entity r_reg is
port (
      read_en : in std_logic;
      read_data : out std_logic_vector(31 downto 0);
      reg_data : in std_logic_vector(31 downto 0)
     );
end r_reg;

architecture behavioral of r_reg is

begin

read_data <= reg_data when read_en = '1' else (others => '0');

end behavioral;
