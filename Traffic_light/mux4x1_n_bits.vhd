library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux4x1_n_bits is
	generic(
		n: positive := 3
	);
	port(
		inpt0, inpt1, inpt2, inpt3: in std_logic_vector(n-1 downto 0);
		sel: in std_logic_vector(1 downto 0);
		outpt: out std_logic_vector(n-1 downto 0)
	);
end mux4x1_n_bits;

architecture archMux of mux4x1_n_bits is
	begin
		outpt <= inpt0 when sel= "00" else
					inpt1 when sel= "01" else
					inpt2 when sel= "10" else inpt3;

end architecture;
