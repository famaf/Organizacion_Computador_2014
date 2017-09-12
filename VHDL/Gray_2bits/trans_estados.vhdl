library ieee;
use ieee.std_logic_1164.all;
 
entity trans_estados is
port (
     i1, i0, inc		  :in std_logic;
     i1_prima, i0_prima           :out  std_logic 
   );
end entity;
 
architecture behavior of trans_estados is
begin

  i1_prima <= (i0 and inc) or (i1 and not(inc)); 

  i0_prima <= (not(i1) and inc) or (i0 and not(inc));

end architecture;
