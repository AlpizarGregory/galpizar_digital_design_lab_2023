library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sumador_4bits is
    Port ( a : in STD_LOGIC_VECTOR(3 downto 0);
           b : in STD_LOGIC_VECTOR(3 downto 0);
           sum : out STD_LOGIC_VECTOR(3 downto 0));
end sumador_4bits;

architecture Behavioral of sumador_4bits is
begin
    sum <= a + b;
end Behavioral;