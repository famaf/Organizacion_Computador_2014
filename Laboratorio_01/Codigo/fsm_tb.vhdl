library ieee;
use ieee.std_logic_1164.all;
 
entity fsm_tb is
end entity;
 
architecture TB of fsm_tb is
    component fsm
    port (
     c, b, p, m, clk, rst	          :in std_logic; 
     release                          :out std_logic
         );
    end component;
    signal rst_s, clk_s               :std_logic;
    signal c_s, b_s, p_s, m_s         :std_logic;
    signal release_s                  :std_logic;
 
begin
 
    dut: fsm port map (c=>c_s,b => b_s, p => p_s, m => m_s, clk=>clk_s, rst=>rst_s, release=>release_s);
 
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
        c_s <= '0';
        b_s <= '0';
        p_s <= '0';
        m_s <= '0';
		wait for 5 ns;
		rst_s <= '0';
        wait for 9 ns;
        c_s <= '0';
        b_s <= '0';
        p_s <= '0';
        m_s <= '1';
       wait for 5 ns;
        c_s <= '0';
        b_s <= '0';
        p_s <= '1';
        m_s <= '0';
        wait for 10 ns;
        c_s <= '0';
        b_s <= '0';
        p_s <= '1';
        m_s <= '0';
       wait for 10 ns;
        c_s <= '0';
        b_s <= '1';
        p_s <= '0';
        m_s <= '0';
       wait for 8 ns;
        c_s <= '1';
        b_s <= '0';
        p_s <= '0';
        m_s <= '0';
       wait for 30 ns;
       rst_s <= '0';
                wait for 150 ns;
	end process;
end;
