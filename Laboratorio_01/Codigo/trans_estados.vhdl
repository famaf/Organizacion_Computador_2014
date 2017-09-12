library ieee;
use ieee.std_logic_1164.all;
 
entity trans_estados is
port (
     s2, s1, s0, c, b, p, m		                          :in std_logic;
     s2_prima, s1_prima, s0_prima, release                :out  std_logic 
   );
end entity;
 
architecture behavior of trans_estados is
begin

    s2_prima <= (not(s2) and s1 and s0 and not(c) and not(b) and not(p) and m) or (s2 and not(s1) and not(s0) and not(c) and not(b) and not(m)) or (not(s2) and s1 and not(c) and not(b) and p and not(m)) or (s2 and not(s1) and not(s0) and not(c) and not(b) and not(p) );
    
    s1_prima <= (not(s2) and s1 and not(c) and not(p) and not(m)) or (not(s2) and not(s1) and not(c) and not(b) and p and not(m)) or (not(s2) and s1 and not(s0) and not(c) and not(b) and not(p)) or (not(s2) and not(s1) and s0 and not(c) and not(b) and not(p) and m);

    s0_prima <= (not(s2) and s0 and not(c) and not(p) and not(m)) or (not(s2) and not(s0) and not(c) and not(b) and not(p) and m) or (not(s2) and not(s1) and s0 and not(c) and not(b) and not(m));

    release <= (s2 and not(s1) and not(s0) and not(c) and b and not(p) and not(m));

end architecture;

