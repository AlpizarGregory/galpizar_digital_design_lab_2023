library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sumador_4bits_tb is
end sumador_4bits_tb;

architecture Behavioral of sumador_4bits_tb is
    component sumador_4bits
        Port ( a : in STD_LOGIC_VECTOR(3 downto 0);
               b : in STD_LOGIC_VECTOR(3 downto 0);
               sum : out STD_LOGIC_VECTOR(3 downto 0));
    end component;

    signal a_tb, b_tb, sum_tb : STD_LOGIC_VECTOR(3 downto 0);

begin
    uut: sumador_4bits port map(a => a_tb, b => b_tb, sum => sum_tb);

    stimulus: process
    begin
        -- Prueba 1
        a_tb <= "0001";
        b_tb <= "0010";
        wait for 10 ns;

        -- Prueba 2
        a_tb <= "1100";
        b_tb <= "1010";
        wait for 10 ns;

        -- Prueba 3
        a_tb <= "0101";
        b_tb <= "1001";
        wait for 10 ns;

        -- Prueba 4
        a_tb <= "1111";
        b_tb <= "0001";
        wait for 10 ns;

        wait;
    end process stimulus;

end Behavioral;