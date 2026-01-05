library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_divider is
    Port (
        clk100MHz : in  STD_LOGIC;
        reset     : in  STD_LOGIC;
        clk1Hz    : out STD_LOGIC
    );
end clock_divider;

architecture Behavioral of clock_divider is
    signal cnt : integer := 0;
    signal clk : STD_LOGIC := '0';
begin
    process(clk100MHz, reset)
    begin
        if reset = '1' then
            cnt <= 0; clk <= '0';
        elsif rising_edge(clk100MHz) then
            if cnt = 50_000_000 then
                clk <= not clk;
                cnt <= 0;
            else
                cnt <= cnt + 1;
            end if;
        end if;
    end process;

    clk1Hz <= clk;
end Behavioral;
