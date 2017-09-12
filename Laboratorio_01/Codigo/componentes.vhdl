library ieee;
use ieee.std_logic_1164.all;

package componentes is

component ff_1b is
port (
     q		:out std_logic;
     d		:in  std_logic;               
     clk	:in  std_logic;                  -- Input clock
     rst	:in  std_logic                   -- Input reset
   );
end component;

component trans_estados is
port (
     s2, s1, s0, c, b, p, m                             :in std_logic;
     s2_prima, s1_prima, s0_prima, release              :out  std_logic
);
end component;

component secuencial is
port (
 d0, d1, d2, clk, rst       :in std_logic;
 q0, q1, q2                 :out std_logic 
   );
end component;


end package;
