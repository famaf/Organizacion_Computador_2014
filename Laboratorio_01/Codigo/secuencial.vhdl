library ieee;
use ieee.std_logic_1164.all;

library work;
use work.componentes.all;
 
entity secuencial is
port (
 d2, d1, d0, clk, rst : in std_logic;
 q2, q1, q0           : out std_logic 
   );
end entity;
 
architecture behavior of secuencial is
begin
--component ff_1b is
--port (
--     q      :out std_logic;
--     d      :in  std_logic;               
--     clk    :in  std_logic;                  -- Input clock
--     rst    :in  std_logic                   -- Input reset
--   );
lab2: ff_1b port map (q=>q2, d=>d2, clk=>clk, rst=>rst);
lab1: ff_1b port map (q=>q1, d=>d1, clk=>clk, rst=>rst);
lab0: ff_1b port map (q=>q0, d=>d0, clk=>clk, rst=>rst);

end architecture;
