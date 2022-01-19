
library IEEE;
use IEEE.std_logic_1164.all;

entity read_write_reg is
port (
      write_en : in std_logic;
      write_data : in std_logic_vector(31 downto 0);
      read_en : in std_logic;
      read_data : in std_logic_vector(31 downto 0);
      reg_data : out std_logic_vector(31 downto 0);
      clk : in std_logic;
      reset : in std_logic
     );
end read_write_reg;

architecture behavioral of read_write_reg is
  
signal register_data : std_logic_vector(31 downto 0);

begin

read_data <= register_data when read_en = '1' else (others => '0');
reg_data <= register_data;

process(clk)
begin
  
  if rising_edge(clk) then
    
    if reset = '1' then
      register_data <= (others => '0');
    
    else
      if write_en = '1' then
        register_data <= write_data;
      end if;
        
    end if;
      
  end if;
    
end process;
  
end behavioral;
