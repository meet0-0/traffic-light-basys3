library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity debounce is
    Port (
        clk   : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        btn   : in  STD_LOGIC;
        clean : out STD_LOGIC
    );
end debounce;

architecture Behavioral of debounce is
    signal q1, q2 : STD_LOGIC;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            q1 <= '0'; q2 <= '0';
        elsif rising_edge(clk) then
            q1 <= btn;
            q2 <= q1;
        end if;
    end process;

    clean <= q1 and not q2;
end Behavioral;
