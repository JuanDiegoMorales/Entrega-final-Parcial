-- Entidad de alto nivel
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.COUNT_PACK.all; -- paquete creado

entity COUNT_99 is

port (
   clock : in std_logic;
	reset : in bit;
	enable : in bit;
	fc1 : out bit;
	dbryan,ebryan: out BIT_VECTOR(6 downto 0)
	);
	
end COUNT_99;
architecture ARQ_COUNT_99 of COUNT_99 is
   signal iclock1hz : bit;
	signal iuni : integer;
	signal ifc : bit;
	signal idec : integer;
	
	signal a,b,c,d,e,f,g : BIT;
	signal a1,b1,c1,d1,e1,f1,g1 : BIT;
	
begin
--Inicia la interconexion de los componentes
divfre : FREQ_DIV port map (clock=>clock, reset=>reset, clock1hz=>iclock1hz);
countuni : COUNT_UNI port map (reset=>reset, enable=>enable,clock1hz=>iclock1hz, fc=>ifc, uni=>iuni);
countdec : COUNT_DEC port map (reset=>reset, enable=>enable, clock1hz=>ifc, dec=>idec, fc1=>fc1);
bcduni : BCD7SEG_UNI port map (uni=>iuni, a=>a, b=>b, c=>c, d=>d, e=>e, f=>f, g=>g);
bcddec : BCD7SEG_DEC port map (dec=>idec, a1=>a1, b1=>b1, c1=>c1, d1=>d1, e1=>e1, f1=>f1, g1=>g1);

dbryan <= a&b&c&d&e&f&g;
ebryan <= a1&b1&c1&d1&e1&f1&g1;



end ARQ_COUNT_99;