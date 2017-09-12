library ieee;
use ieee.std_logic_1164.all;

library work;
use work.componentes.all;
 
entity gray2bits is
port (
     inc, clk, rst	:in  std_logic; 
     s: out std_logic_vector(1 downto 0)
   );
end entity;
 
architecture behavior of gray2bits is
signal i0_prima_s, i1_prima_s, i1_s, i0_s :std_logic;
begin
--entity secuencial is
--port (
-- d0, d1, clk, rst: in std_logic;
-- q0, q1 : out std_logic 
--   );
--end entity;

asd: secuencial port map (d0 => i0_prima_s, d1=> i1_prima_s, q0 => i0_s, q1 => i1_s, clk => clk, rst => rst);

trans_est: trans_estados port map (i1 => i1_s, i0 => i0_s , inc => inc, i1_prima => i1_prima_s, i0_prima => i0_prima_s );

s(1) <= i1_s;
s(0) <= i0_s;

end architecture;
