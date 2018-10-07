library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.math_real.all;

entity clock_x is
	generic(maxValue: integer := 140);
	port(
		clock, reset, enable: in std_logic;
		outpt: out std_logic_vector(integer(ceil(log2(real(maxValue))))-1 downto 0)
	);
end entity;

architecture archClock of clock_x is
	subtype InternalState is unsigned(integer(ceil(log2(real(maxValue))))-1 downto 0);
	signal currentState, nextState: InternalState;
begin
    -- next state logic (combinatorial)

    nextState <=    currentState when enable = '0' else
                    (others=>'0') when to_integer(currentState) = maxValue else
                    currentState + 1;

    -- memory element (sequential)

    p1: process(clock, reset) is
    begin
        if reset='1' then
            currentState <= (others=>'0');
        elsif rising_edge(clock) then
            currentState <= nextState;
        end if;
    end process;

	-- output logic (combinatorial)

	outpt <= std_logic_vector(currentState);

end architecture;