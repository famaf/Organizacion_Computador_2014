library ieee;
use ieee.std_logic_1164.all;

package componentes is

component ff_1b is
port (
     q		:out std_logic;
     d		:in  std_logic;               -- up_down control for counter
     clk	:in  std_logic;                   -- Input clock
     rst	:in  std_logic                   -- Input reset
   );
end component;

end package;
