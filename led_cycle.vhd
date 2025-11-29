library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity led_blinker is
port (
    clk: in std_logic;
    reset: in std_logic;
    led: out std_logic_vector(15 downto 0) );
end led_blinker;

architecture Behavioral of led_blinker is
signal count: unsigned(26 downto 0) := (others => '0');
signal led_reg : std_logic_vector(15 downto 0) := (others => '0');

type thresh_arr_t is array(0 to 15) of unsigned(26 downto 0);
constant THRESHOLDS: thresh_arr_t := (
    0 => to_unsigned(0, 27),
    1 => to_unsigned(6250000, 27),
    2 => to_unsigned(12500000, 27),
    3 => to_unsigned(18750000, 27),
    4 => to_unsigned(25000000, 27),
    5 => to_unsigned(31250000, 27),
    6 => to_unsigned(37500000, 27),
    7 => to_unsigned(43750000, 27),
    8 => to_unsigned(50000000, 27),
    9 => to_unsigned(56250000, 27),
    10 => to_unsigned(62500000, 27),
    11 => to_unsigned(68750000, 27),
    12 => to_unsigned(75000000, 27),
    13 => to_unsigned(81250000, 27),
    14 => to_unsigned(87500000, 27),
    15 => to_unsigned(93750000, 27) );
    


constant TOGGLE_plz: unsigned(26 downto 0) := to_unsigned(100_000_000, 27);
-- to_unsigned converts an integer to an unsigned vector or other types

begin
    led <= led_reg;
    -- all values of the led vector take on the value of led_reg

process(clk, reset)
begin
if reset = '1' then
    count <= (others => '0');
elsif rising_edge(clk) then
    if count = TOGGLE_plz then
        count <= (others => '0');
    else
        count <= count + 1;
    end if;
end if;
end process;

gen_leds: for i in 0 to 15 generate
    process(clk, reset)
    begin
    if reset = '1' then
        led_reg(i) <= '0';
    elsif rising_edge(clk) then
        if count = THRESHOLDS(i) then
            led_reg(i) <= not led_reg(i);
        end if;
    end if;
    end process;
end generate;



end Behavioral;
