library IEEE;
use IEEE.std_logic_1164.all;

entity w_reg is
port (
      write_en : in std_logic;
      write_data : in std_logic_vector(31 downto 0);
      reg_data : out std_logic_vector(31 downto 0);
      clk : in std_logic;
      reset : in std_logic
     );
end w_reg;

architecture behavioral of w_reg is
  
signal register_data : std_logic_vector(31 downto 0);

begin

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
