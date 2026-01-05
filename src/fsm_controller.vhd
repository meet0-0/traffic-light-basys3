library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm_controller is
    Port (
        clk        : in  STD_LOGIC;
        reset      : in  STD_LOGIC;
        ped_req    : in  STD_LOGIC;

        leds       : out STD_LOGIC_VECTOR(2 downto 0);
        ped_active : out STD_LOGIC;
        ped_fast   : out STD_LOGIC;
        timer      : out integer range 0 to 9
    );
end fsm_controller;

architecture Behavioral of fsm_controller is
    type state_t is (GREEN, YELLOW, RED, PED);
    signal state : state_t := GREEN;
    signal cnt   : integer range 0 to 9 := 0;
begin

    process(clk, reset)
    begin
        if reset = '1' then
            state <= GREEN;
            cnt <= 0;

        elsif rising_edge(clk) then
            cnt <= cnt + 1;

            case state is
                when GREEN =>
                    if cnt = 5 then state <= YELLOW; cnt <= 0; end if;

                when YELLOW =>
                    if cnt = 2 then state <= RED; cnt <= 0; end if;

                when RED =>
                    if cnt = 5 then
                        if ped_req = '1' then
                            state <= PED;
                        else
                            state <= GREEN;
                        end if;
                        cnt <= 0;
                    end if;

                when PED =>
                    if cnt = 4 then state <= GREEN; cnt <= 0; end if;
            end case;
        end if;
    end process;

    process(state, cnt)
    begin
        ped_active <= '0';
        ped_fast <= '0';

        case state is
            when GREEN =>
                leds <= "001";
                timer <= 5 - cnt;

            when YELLOW =>
                leds <= "010";
                timer <= 2 - cnt;

            when RED =>
                leds <= "100";
                timer <= 5 - cnt;

            when PED =>
                leds <= "100";
                ped_active <= '1';
                if cnt >= 3 then ped_fast <= '1'; end if;
                timer <= 4 - cnt;
        end case;
    end process;

end Behavioral;
