library ieee;
use ieee.std_logic_1164.all;
 
entity gray2bits_tb is
end entity;
 
architecture TB of gray2bits_tb is
    component gray2bits
    port (
     inc, clk, rst	:in  std_logic; 
     s: out std_logic_vector(1 downto 0)
    );
    end component;
    signal rst_s, clk_s:    std_logic;
    signal inc_s: std_logic;
    signal s_s: std_logic_vector(1 downto 0);
 
begin
 
    dut: gray2bits port map (inc=>inc_s, clk=>clk_s, rst=>rst_s, s=>s_s);
 
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
        inc_s <= '0';
		wait for 5 ns;
		rst_s <= '0';
        wait for 10 ns;
        inc_s <= '1';
       wait for 50 ns;
       inc_s <= '0';
       wait for 20 ns;
       inc_s <= '1';
       rst_s <= '1';
       wait for 20 ns;
       rst_s <= '0';
                wait for 150 ns;
	end process;
end;
