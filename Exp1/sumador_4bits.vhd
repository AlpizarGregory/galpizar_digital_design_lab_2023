library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sumador_4bits is
    Port ( a : in STD_LOGIC_VECTOR(3 downto 0);
           b : in STD_LOGIC_VECTOR(3 downto 0);
           sum : out STD_LOGIC_VECTOR(3 downto 0);
			  disp : out STD_LOGIC_VECTOR(6 downto 0));
end sumador_4bits;

architecture Behavioral of sumador_4bits is
	signal sum_final : STD_LOGIC; -- señal de salida temporal
	signal sum1 : STD_LOGIC; -- señal temporal 1 para las xor
	signal sum21 : STD_LOGIC; -- señal temporal 2 para las xor
	signal sum22 : STD_LOGIC; -- señal temporal 2 para las xor
	signal sum31 : STD_LOGIC; -- señal temporal 3 para las xor
	signal sum32 : STD_LOGIC; -- señal temporal 3 para las xor
	signal sum4 : STD_LOGIC; -- señal temporal 4 para las xor
	
	signal carry1 : STD_LOGIC; -- señal temporal 1 para las and
	signal carry21 : STD_LOGIC; -- señal temporal 2 para las and
	signal carry22 : STD_LOGIC; -- señal temporal 2 para las and
	signal carry23 : STD_LOGIC; -- señal temporal 2 para las and
	signal carry31 : STD_LOGIC; -- señal temporal 3 para las and
	signal carry32 : STD_LOGIC; -- señal temporal 3 para las and
	signal carry33 : STD_LOGIC; -- señal temporal 3 para las and
begin
    sum1 <= a(3) xor b(3);
	 carry1 <= a(3) and b(3);

	 sum21 <= a(2) xor b(2);
	 carry21 <= a(2) and b(2);
	 carry22 <= carry1 and sum21;
	 carry23 <= carry21 xor carry22;
	 sum22 <= sum21 xor carry1;
	 
	 sum31 <= a(1) xor b(1);
	 carry31 <= a(1) and b(1);
	 carry32 <= carry21 and sum31;
	 carry33 <= carry31 xor carry32;
	 sum32 <= sum31 xor carry23;
	 
	 sum4 <= a(0) xor b(0) xor carry33;
	 
	 sum <= not (a+b);
	        --abcdefg
	 with a+b select disp <=
	  --
		"0000001" when "0000", --0
		"1001111" when "0001", --1
		"0010010" when "0010", --2
		"0000110" when "0011", --3
		"1001100" when "0100", --4
		"0100100" when "0101", --5
		"0100000" when "0110", --6
		"0001111" when "0111", --7
		"0000000" when "1000", --8
		"0000100" when "1001", --9
		"0001000" when "1010", --A
		"1100000" when "1011", --b
		"1110010" when "1100", --c
		"1000010" when "1101", --d
		"0110000" when "1110", --E
		"0111000" when "1111", --F
		"1111111" when others;
end Behavioral;