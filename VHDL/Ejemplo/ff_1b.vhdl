library ieee;
use ieee.std_logic_1164.all;
 
entity ff_1b is
port (
     q		:out std_logic;
     d		:in  std_logic;               -- up_down control for counter
     clk	:in  std_logic;                   -- Input clock
     rst	:in  std_logic                   -- Input reset
   );
end entity;
 
architecture behavior of ff_1b is
begin
process (clk, rst) begin
	if (rst = '1') then
		q <= '0';
	elsif (clk'event and clk='1') then
	        q <= d;
	end if;
end process;
end architecture;
