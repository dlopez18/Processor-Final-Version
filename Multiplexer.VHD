
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Multiplexer is
    GENERIC(n : integer := 32);
    Port(
        input_1    : in std_logic_vector(n-1 downto 0);
        input_2    : in std_logic_vector(n-1 downto 0);
        mux_select : in std_logic;

        output     : out std_logic_vector(n-1 downto 0) );
end Multiplexer;

architecture Behavioral of Multiplexer is

begin
    with mux_select select
      output <= input_1 when '0', input_2 when others;

end Behavioral;
