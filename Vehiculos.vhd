library ieee ;
use ieee.std_logic_1164.all ;
use ieee.numeric_std.all ;

entity Vehiculos is

  port ( parqueadero : in bit_vector(3 downto 0);
posicion : in bit_vector(2 downto 0);
clock : in std_logic;
alarm, reset: in bit;
fc1 : out bit;
decenas, unidades, numero_vehiculo : out bit_vector(6 downto 0)) ;

end entity;

architecture arch of Vehiculos is

signal u1,u2,u3,u4 : bit_vector(6 downto 0);
signal d1,d2,d3,d4 : bit_vector(6 downto 0);
signal fc11,fc12,fc13,fc14 : bit;

component COUNT_99
Port ( 	clock : IN std_logic;
			reset, enable : IN bit;
			fc1 : out bit;
			dbryan,ebryan : OUT bit_vector(6 downto 0));
end component;

begin

P1 : COUNT_99 port map (clock => clock, reset => reset, enable => parqueadero(0), fc1 => fc11, dbryan => u1, ebryan => d1);
P2 : COUNT_99 port map (clock => clock, reset => reset, enable => parqueadero(1), fc1 => fc12, dbryan => u2, ebryan => d2);
P3 : COUNT_99 port map (clock => clock, reset => reset, enable => parqueadero(2), fc1 => fc13, dbryan => u3, ebryan => d3);
P4 : COUNT_99 port map (clock => clock, reset => reset, enable => parqueadero(3), fc1 => fc14, dbryan => u4, ebryan => d4);
--P5 : ContadorAs port map (clk => clock, reset => reset, enable => parqueadero(4), alarm => alarm, dbryan => u5, ebryan => d5);
--P6 : ContadorAs port map (clk => clock, reset => reset, enable => parqueadero(5), alarm => alarm, dbryan => u6, ebryan => d6);
--P7 : ContadorAs port map (clk => clock, reset => reset, enable => parqueadero(6), alarm => alarm, dbryan => u7, ebryan => d7);
--P8 : ContadorAs port map (clk => clock, reset => reset, enable => parqueadero(7), alarm => alarm, dbryan => u8, ebryan => d8);


 with posicion select
 unidades <= u1 when "000",
u2 when "001",
u3 when "010",
u4 when "011",
--u5 when "100",
--u6 when "101",
--u7 when "110",
--u8 when "111",
"1111111" when others;

 with posicion select
 decenas <= d1 when "000",
d2 when "001",
d3 when "010",
d4 when "011",
--d5 when "100",
--d6 when "101",
--d7 when "110",
--d8 when "111",
"1111111" when others;

 deco_vehiculos : process(posicion) is
 begin
case posicion is
when "000" =>numero_vehiculo<= "1001111";
when "001" =>numero_vehiculo<= "0010010";
when "010" =>numero_vehiculo<= "0000110";
when "011" =>numero_vehiculo<= "1001100";
--when "100" =>numero_vehiculo<= "0100100";
--when "101" =>numero_vehiculo<= "0100000";
--when "110" =>numero_vehiculo<= "0001111";
--when "111" =>numero_vehiculo<= "0000000";
when others  =>numero_vehiculo<= "1111111";
end case;
end process;

end architecture ;