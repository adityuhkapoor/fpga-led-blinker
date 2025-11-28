# fpga-led-blinker
led light that blinks on and off with a period of 2 seconds total (1 second on, 1 second on).


I made this code as part of a 30 day VHDL challenge, where I make a progressively harder VHDL centered FPGA project everyday to get myself better acquainted with the language.

What I learned:

an unsigned vector type is a non-negative numeric vector type that supports arithmetic operations. It's useful if you need a counter type of function or you need to cast a straight integer into a vector. 

count <= (others => VALUE) can be used to assigned every bit within a vector (in this case count) to a specific value. In the code we use it to start count at 0. 

In the code, initially, led is wired to the output of led_reg utilizing led <= (others => led_reg). This means, as the program evolves and the value of led_reg evolves, led follows.  

use IEEE.NUMERIC_STD.ALL; enables arithmetic operations with unsigned values.

to_unsigned is used to convert integer (and some other types) to unsigned.
