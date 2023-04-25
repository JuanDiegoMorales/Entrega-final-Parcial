--Contador de DECENAS (0 a 9)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity COUNT_DEC is
port (
      clock1hz : in bit;
      reset : in bit;
      enable : in bit;
      dec : out integer range 0 to 9;
      fc1 : out bit
		);
end COUNT_DEC;
architecture RTL of COUNT_DEC is
begin
   process (clock1hz)
   variable conteo : integer  range 0 to 9;

   begin
      if (clock1hz = '1' and clock1hz'event) then
         if enable = '1' then
                if conteo < 9 then
                   conteo := conteo + 1;

                else
                   conteo := 0;
                end if;
             end if;
         end if;
         if (conteo = 0) and (enable = '1') then
         fc1 <= '1';
         else
         fc1 <= '0';
         end if;
         dec <= conteo;
     end process;
end RTL;
