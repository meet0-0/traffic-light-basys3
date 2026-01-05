library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity blink is
    Port (
        clk    : in  STD_LOGIC;
        enable : in  STD_LOGIC;
        fast   : in  STD_LOGIC;
        blink  : out STD_LOGIC
    );
end blink;

architecture Behavioral of blink is
    signal t : STD_LOGIC := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if enable = '1' then
                if fast = '1' then
                    t <= not t;
                else
                    t <= not t;
                end if;
            else
                t <= '0';
            end if;
        end if;
    end process;

    blink <= t;
end Behavioral;
