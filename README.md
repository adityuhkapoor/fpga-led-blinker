# fpga-led-blinker
led light that blinks on and off with a period of 2 seconds total (1 second on, 1 second on).


I made this code as part of a 30 day VHDL challenge, where I make a progressively harder VHDL centered FPGA project everyday to get myself better acquainted with the language.

What I learned:

an unsigned vector type is a non-negative numeric vector type that supports arithmetic operations. It's useful if you need a counter type of function or you need to cast a straight integer into a vector. 

count <= (others => VALUE) can be used to assigned every bit within a vector (in this case count) to a specific value. In the code we use it to start count at 0. 

In the code, initially, led is wired to the output of led_reg utilizing led <= (others => led_reg). This means, as the program evolves and the value of led_reg evolves, led follows.  

use IEEE.NUMERIC_STD.ALL; enables arithmetic operations with unsigned values.

to_unsigned is used to convert integer (and some other types) to unsigned.

VHDL does not let you declare nested array with no extra definitions like Java/Python/other languages do. So I must create a new type of the nested array type which is done utilizing this statement:

type nested_unsigned_array is array(0 to 15) of unsigned(26 downto 0);

Essentially, this statement declares a new variable type nested_unsigned_array, which is an array of unsigned vectors (so each one is it's own individual array).

constant THRESHOLDS is an array (and is near equivalent to a Look up table in that you query it with THRESHOLDS(i) depending on how many values you add to the lookup table). 

The generate block replicates the logic 16 times, creating 16 independent hardware circuits—one for each value of i.
Each circuit runs in parallel and evaluates its own conditions (based on its own threshold value).
When its condition is met, that circuit updates its own flip-flop and therefore its corresponding LED output.

So each hardware block has its own inverter (led_reg(i) <= not led_reg(i)), comparator and flipflop [if rising_edge(clk)]
