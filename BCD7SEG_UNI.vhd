--BCD 7 SEGMENTOS 
library ieee;
use ieee.std_logic_1164;
use ieee.numeric_std.all;
ENTITY BCD7SEG_UNI IS
PORT (
      uni : in integer range 0 to 9;
		a : OUT BIT;
		b : OUT BIT;
		c : OUT BIT;
		d : OUT BIT;
		e : OUT BIT;
		f : OUT BIT;
		g : OUT BIT
		);
END BCD7SEG_UNI;
ARCHITECTURE rtl OF BCD7SEG_UNI IS
BEGIN
PROCESS (uni)
VARIABLE segmentos : BIT_VECTOR (0 TO 6);
           BEGIN
			  CASE uni IS --visualiza patrón de Anodo común de 7 segmentos
			    WHEN 0 => segmentos := "0000001";
				 WHEN 1 => segmentos := "1001111";
				 WHEN 2 => segmentos := "0010010";
				 WHEN 3 => segmentos := "0000110";
				 WHEN 4 => segmentos := "1001100";
				 WHEN 5 => segmentos := "0100100";
				 WHEN 6 => segmentos := "1100000";
				 WHEN 7 => segmentos := "0001111";
				 WHEN 8 => segmentos := "0000000";
				 WHEN 9 => segmentos := "0001100";
				 WHEN OTHERS => segmentos := "1111111";
			 END CASE;
			 
a <= segmentos (0); -- asgina bits del arreglo a las terminales de salida
b <= segmentos (1);
c <= segmentos (2);
d <= segmentos (3);
e <= segmentos (4);
f <= segmentos (5);
g <= segmentos (6);
END PROCESS;
END rtl;
