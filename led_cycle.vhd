library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity led_cycle is
port (
    clk: in std_logic;
    reset: in std_logic;
    led: out std_logic_vector(15 downto 0) );
end led_cycle;

architecture Behavioral of led_cycle is
signal count: unsigned(26 downto 0) := (others => '0');
signal led_reg : std_logic_vector(15 downto 0) := (others => '0');

constant TOGGLE_plz: unsigned(26 downto 0) := to_unsigned(100_000_000, 27);
-- to_unsigned converts an integer to an unsigned vector or other types

begin
    led <= led_reg;
    -- all values of the led vector take on the value of led_reg
process(clk, reset) 
    begin
    if reset = '1' then
        count <= (others => '0');
        led_reg <= (others => '0');
    elsif rising_edge(clk) then
        if count = TOGGLE_plz then
            count <= (others => '0');
        else
            count <= count + 1;
        end if;    
        
        if count = to_unsigned(0, 27) then --led0 on
            led_reg(0) <= not led_reg(0);
        elsif count = to_unsigned(6250000, 27) then --led1 on
            led_reg(1) <= not led_reg(1);
        elsif count = to_unsigned(12500000, 27) then
            led_reg(2) <= not led_reg(2); 
        elsif count = to_unsigned(18750000, 27) then
            led_reg(3) <= not led_reg(3);
        elsif count = to_unsigned(25000000, 27) then
            led_reg(4) <= not led_reg(4);
        elsif count = to_unsigned(31250000, 27) then
            led_reg(5) <= not led_reg(5);
        elsif count = to_unsigned(37500000, 27) then
            led_reg(6) <= not led_reg(6);
        elsif count = to_unsigned(43750000, 27) then
            led_reg(7) <= not led_reg(7);
        elsif count = to_unsigned(50000000, 27) then
            led_reg(8) <= not led_reg(8);  
        elsif count = to_unsigned(56250000, 27) then
            led_reg(9) <= not led_reg(9);
        elsif count = to_unsigned(62500000, 27) then
            led_reg(10) <= not led_reg(10);
        elsif count = to_unsigned(68750000, 27) then
            led_reg(11) <= not led_reg(11);
        elsif count = to_unsigned(75000000, 27) then
            led_reg(12) <= not led_reg(12);
        elsif count = to_unsigned(81250000, 27) then
            led_reg(13) <= not led_reg(13);
        elsif count = to_unsigned(87500000, 27) then
            led_reg(14) <= not led_reg(14);
        elsif count = to_unsigned(93750000, 27) then
            led_reg(15) <= not led_reg(15);
        end if;
    end if;
end process;



end Behavioral;
