library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
    Port (
        clk100MHz : in  STD_LOGIC;
        reset     : in  STD_LOGIC;
        ped_btn   : in  STD_LOGIC;

        leds      : out STD_LOGIC_VECTOR(2 downto 0); -- LD0,1,2
        ped_led   : out STD_LOGIC;                    -- LD3 (V19)

        seg       : out STD_LOGIC_VECTOR(6 downto 0);
        an        : out STD_LOGIC_VECTOR(3 downto 0)
    );
end top;

architecture Behavioral of top is
    signal clk_1hz          : STD_LOGIC;
    signal ped_btn_clean    : STD_LOGIC;
    signal ped_req_latched  : STD_LOGIC := '0';
    signal ped_active       : STD_LOGIC;
    signal ped_fast         : STD_LOGIC;
    signal timer_val        : integer range 0 to 9;
    signal ped_blink        : STD_LOGIC;
begin

    -- Clock divider
    clk_div : entity work.clock_divider
        port map (clk100MHz, reset, clk_1hz);

    -- Debounce button
    debounce_u : entity work.debounce
        port map (clk100MHz, reset, ped_btn, ped_btn_clean);

    -- Pedestrian request latch (FAST DOMAIN)
    process(clk100MHz, reset)
    begin
        if reset = '1' then
            ped_req_latched <= '0';
        elsif rising_edge(clk100MHz) then
            if ped_btn_clean = '1' then
                ped_req_latched <= '1';      -- remember request
            elsif ped_active = '1' then
                ped_req_latched <= '0';      -- clear once served
            end if;
        end if;
    end process;

    -- FSM
    fsm : entity work.fsm_controller
        port map (
            clk        => clk_1hz,
            reset      => reset,
            ped_req    => ped_req_latched,
            leds       => leds,
            ped_active => ped_active,
            ped_fast   => ped_fast,
            timer      => timer_val
        );

    -- Blink generator
    blink_u : entity work.blink
        port map (
            clk    => clk_1hz,
            enable => ped_active,
            fast   => ped_fast,
            blink  => ped_blink
        );

    -- LD3 behavior
    ped_led <= ped_req_latched or ped_blink;

    -- Seven-segment display
    ssd : entity work.seven_seg_driver
        port map (clk100MHz, timer_val, seg, an);

end Behavioral;
