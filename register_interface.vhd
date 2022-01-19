library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity register_interface is
port (
      clk : in std_logic;
      reset : in std_logic;
      
      reg0_write_en : in std_logic;
      reg0_write_data : in std_logic_vector(31 downto 0);
      
      reg1_read_en : in std_logic;
      reg1_read_data : in std_logic_vector(31 downto 0);
      
      reg2_write_en : in std_logic;
      reg2_write_data : in std_logic_vector(31 downto 0);
      reg2_read_en : in std_logic;
      reg2_read_data : in std_logic_vector(31 downto 0);
      
     );
end register_interface;

architecture behavioral of register_interface is
  
signal reg0_reg_data, reg1_reg_data, reg2_reg_data : std_logic_vector(31 downto 0);

begin

reg0: entity work.write_reg port map(
                                     write_en => reg0_write_en,
                                     write_data => reg0_write_data,
                                     reg_data => reg0_reg_data,
                                     reset => reset,
                                     clk => clk
                                    );

reg1: entity work.read_reg port map(
                                     read_en => reg1_read_en,
                                     read_data => reg1_read_data,
                                     reg_data => reg1_reg_data,
                                    );
      
reg2: entity work.read_write_reg port map(
                                     write_en => reg2_write_en,
                                     write_data => reg2_write_data,
                                     read_en => reg2_read_en,
                                     read_data => reg2_read_data,
                                     reg_data => reg2_reg_data,
                                     reset => reset,
                                     clk => clk
                                    );
      
end behavioral;
