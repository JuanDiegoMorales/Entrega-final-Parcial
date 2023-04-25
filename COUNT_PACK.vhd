--Creacion del archivo package
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
package COUNT_PACK IS
-- component diviosr de frecuencia
COMPONENT FREQ_DIV

PORT (
   clock : in std_logic;
	reset : in bit;
	clock1hz : out bit);
END COMPONENT;

-- componente contador de unidad
COMPONENT COUNT_UNI

PORT (
      clock1hz : in bit;
		reset : in bit;
		enable : in bit;
		uni : out integer range 0 to 9;
		fc : out bit);
		
END COMPONENT;

--componente contador de decena
COMPONENT COUNT_DEC

PORT (
      clock1hz : in bit;
		reset : in bit;
		enable : in bit;
		dec : out integer range 0 to 9;
		fc1 : out bit);
END COMPONENT;


--componente decodificador bcd a 7 seg unidad
COMPONENT BCD7SEG_UNI

PORT (
      uni : in integer range 0 to 9;
		a : OUT BIT;
		b : OUT BIT;
		c : OUT BIT;
		d : OUT BIT;
		e : OUT BIT;
		f : OUT BIT;
		g : OUT BIT);
END COMPONENT;

--componente decodificador bcd a 7 seg Decena
COMPONENT BCD7SEG_DEC

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
END COMPONENT; 

END COUNT_PACK;