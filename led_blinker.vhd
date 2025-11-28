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
signal led_reg: std_logic := '0';

constant TOGGLE_plz: unsigned(26 downto 0) := to_unsigned(100_000_000, 27);
-- to_unsigned converts an integer to an unsigned vector or other types

begin
    led <= (others => led_reg);
    -- all values of the led vector take on the value of led_reg
process(clk, reset) 
    begin
    if reset = '1' then
        count <= (others => '0');
        led_reg <= '0';
    elsif rising_edge(clk) then
        if count = TOGGLE_plz then
            count <= (others => '0');
            led_reg <= not led_reg;
        else
            count <= count + 1;
        end if;
    end if;
end process;



end Behavioral;
