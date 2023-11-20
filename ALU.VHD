
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    GENERIC(n : integer := 32);
    Port( operand_1   : in std_logic_vector(n-1 downto 0);
        operand_2   : in std_logic_vector(n-1 downto 0);
        ALU_control : in std_logic_vector(3 downto 0);  -- 9 operations
    
        result      : out std_logic_vector(n - 1 downto 0);
        zero        : out std_logic );
end ALU;

architecture Behavioral of ALU is
    signal temp : std_logic_vector(n - 1 downto 0);
    
    begin
          temp <=
            --ADD D, R, R
            std_logic_vector(unsigned(operand_1) + unsigned(operand_2)) after 1 ns when ALU_control = "0000" else
            --SUB D, R, R
            std_logic_vector(unsigned(operand_1) - unsigned(operand_2)) after 1 ns when ALU_control = "0001" else
            --AND D, R, R
            operand_1 AND  operand_2 after 1 ns when ALU_control = "0010" else
            --OR D, R, R
            operand_1 OR   operand_2 after 1 ns when ALU_control = "0011" else
            --NOR D, R, R
            operand_1 NOR  operand_2 after 1 ns when ALU_control = "0100" else
            --NAND D, R, R X
            operand_1 NAND operand_2 after 1 ns when ALU_control = "0101" else
            --XOR D, R, R 
            operand_1 XOR  operand_2 after 1 ns when ALU_control = "0110" else
            --SLL D, R, SHFT
            std_logic_vector(shift_left(unsigned(operand_1), to_integer(unsigned(operand_2(10 downto 6))))) after 1 ns when ALU_control = "0111" else
            --SRL D, R, SHFT
            std_logic_vector(shift_right(unsigned(operand_1), to_integer(unsigned(operand_2(10 downto 6))))) after 1 ns when ALU_control = "1000" else
            --ELSE
            (others => '0');
        
                zero <= '1' when (temp <= "00000000000000000000000000000000") else '0';
                result <= temp;

end Behavioral;
