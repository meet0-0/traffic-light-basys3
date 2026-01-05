library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_tb is end;

architecture Behavioral of top_tb is
    signal clk100MHz, reset, ped_btn : STD_LOGIC := '0';
    signal leds : STD_LOGIC_VECTOR(2 downto 0);
    signal ped_led : STD_LOGIC;
    signal seg : STD_LOGIC_VECTOR(6 downto 0);
    signal an  : STD_LOGIC_VECTOR(3 downto 0);
begin

    DUT : entity work.top
        port map (clk100MHz, reset, ped_btn, leds, ped_led, seg, an);

    clk100MHz <= not clk100MHz after 5 ns;

    process
    begin
        reset <= '1'; wait for 100 ns;
        reset <= '0';
        wait for 5 sec;

        ped_btn <= '1'; wait for 50 ms;
        ped_btn <= '0';

        wait for 15 sec;
        wait;
    end process;
end Behavioral;
