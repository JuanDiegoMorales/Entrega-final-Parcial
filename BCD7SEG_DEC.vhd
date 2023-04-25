--BCD 7 SEGMENTOS DECENAS
library ieee;
use ieee.std_logic_1164;
use ieee.numeric_std.all;
ENTITY BCD7SEG_DEC IS
PORT (
      dec : in integer range 0 to 9;
		a1 : OUT BIT;
		b1 : OUT BIT;
		c1 : OUT BIT;
		d1 : OUT BIT;
		e1 : OUT BIT;
		f1 : OUT BIT;
		g1 : OUT BIT
		);
END BCD7SEG_DEC;
ARCHITECTURE rtl OF BCD7SEG_DEC IS
BEGIN
PROCESS (dec)
VARIABLE segmentos : BIT_VECTOR (0 TO 6);
           BEGIN
			  CASE dec IS --visualiza patrón de Anodo común de 7 segmentos
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
			 
a1 <= segmentos (0); -- asgina bits del arreglo a las terminales de salida
b1 <= segmentos (1);
c1 <= segmentos (2);
d1 <= segmentos (3);
e1 <= segmentos (4);
f1 <= segmentos (5);
g1 <= segmentos (6);
END PROCESS;
END rtl;