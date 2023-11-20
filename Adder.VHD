
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder is
    GENERIC(n : integer := 32);
    Port(
        operand_1 : in  std_logic_vector(n - 1 downto 0);
        operand_2 : in  std_logic_vector(n - 1 downto 0);

        result    : out std_logic_vector(n - 1 downto 0) );
end Adder;

architecture Behavioral of Adder is

begin
    result <= std_logic_vector(unsigned(operand_1) + unsigned(operand_2));

end Behavioral;
