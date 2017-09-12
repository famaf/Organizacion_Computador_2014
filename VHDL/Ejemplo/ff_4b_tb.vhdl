library ieee;
use ieee.std_logic_1164.all;
 
entity ff_4b_tb is
end entity;
 
architecture TB of ff_4b_tb is
    component ff_4b
    port (
       q          :out std_logic_vector(3 downto 0);
       d          :in  std_logic_vector(3 downto 0);               -- up_down control for counter
       clk        :in  std_logic;                   -- Input clock
       rst        :in  std_logic                   -- Input reset
    );
    end component;
    signal rst_s, clk_s:    std_logic;
    signal d_s, q_s: std_logic_vector(3 downto 0);
 
begin
 
    dut: ff_4b port map (q=>q_s, d=>d_s, clk=>clk_s, rst=>rst_s);
 
    process
    begin
		clk_s <= '0';
		wait for 5 ns;
		clk_s <= '1';
		wait for 5 ns;
    end process;
 
	process
	begin
		rst_s <= '1';
		wait for 10 ns;
		rst_s <= '0';
		d_s <= "0001";
		wait for 10 ns;
                d_s <= "1010";
                wait for 10 ns;
                d_s <= "1001";
                rst_s <= '1';
                wait for 100 ns;
	end process;
end;
