library ieee;
use ieee.std_logic_1164.all;

package componentes is

component ff_1b is
port (
     q		:out std_logic;
     d		:in  std_logic;               
     clk	:in  std_logic;                   -- Input clock
     rst	:in  std_logic                   -- Input reset
   );
end component;

component trans_estados is
port (
     i1, i0, inc              :in std_logic;
     i1_prima, i0_prima       :out  std_logic
);
end component;

component secuencial is
port (
 d0, d1, clk, rst: in std_logic;
 q0, q1 : out std_logic 
   );
end component;


end package;
