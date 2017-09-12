library ieee;
use ieee.std_logic_1164.all;

library work;
use work.componentes.all;
 
entity ff_4b is
port (
     q		:out std_logic_vector(3 downto 0);
     d		:in  std_logic_vector(3 downto 0);               -- up_down control for counter
     clk	:in  std_logic;                   -- Input clock
     rst	:in  std_logic                   -- Input reset
   );
end entity;
 
architecture behavior of ff_4b is

begin

ff4_1: ff_1b port map (q => q(0), d => d(0), clk=> clk, rst => rst);
ff4_2: ff_1b port map (q => q(1), d => d(1), clk=> clk, rst => rst);
ff4_3: ff_1b port map (q => q(2), d => d(2), clk=> clk, rst => rst);
ff4_4: ff_1b port map (q => q(3), d => d(3), clk=> clk, rst => rst);

end architecture;
