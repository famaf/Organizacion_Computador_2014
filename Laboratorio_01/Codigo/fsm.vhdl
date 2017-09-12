library ieee;
use ieee.std_logic_1164.all;

library work;
use work.componentes.all;
 
entity fsm is
port (
     c, b, p, m, clk, rst	      :in  std_logic; 
     release                      :out std_logic
     );
end entity;
 
architecture behavior of fsm is
signal d0_prima, d1_prima, d2_prima, q0_prima, q1_prima, q2_prima :std_logic;
begin
--entity secuencial is
--port (
-- d0, d1, clk, rst: in std_logic;
-- q0, q1 : out std_logic 
--   );
--end entity;

asd: secuencial port map (d0 => d0_prima, d1=> d1_prima, d2=> d2_prima, 
                          q0 => q0_prima, q1 => q1_prima, q2 => q2_prima, 
                          clk => clk, rst => rst);

trans_est: trans_estados port map (s0 => q0_prima, s1 => q1_prima , s2 => q2_prima, 
                                   c => c, b => b, p => p, m => m, release => release, 
                                   s0_prima => d0_prima, s1_prima => d1_prima, s2_prima => d2_prima);

end architecture;
