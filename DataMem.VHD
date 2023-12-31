

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity DataMem is
    GENERIC(n : integer := 32);
    Port(
        CLK            : in std_logic;
        reset_neg      : in std_logic;
        memory_address : in std_logic_vector(n-1 downto 0);
        MemWrite       : in std_logic;
        MemRead        : in std_logic;
        data_in        : in std_logic_vector(n-1 downto 0);
        
        data_out       : out std_logic_vector(n-1 downto 0) );
end DataMem;

architecture Behavioral of DataMem is
    type mem_type is array  (127 downto 0) of std_logic_vector(n - 1 downto 0); -- should be 2^30 words
    signal mem: mem_type;
    
    begin
    
        Process(CLK, reset_neg)
        begin
            if reset_neg = '0' then
                mem <= (others => (others=>'0'));
            elsif rising_edge(CLK) and MemWrite = '1' then
                mem(to_integer(unsigned(memory_address))) <= data_in;
            end if;
        end Process;
            data_out <= (mem(to_integer(unsigned(memory_address)))) when MemRead = '1' else (others => '0');
    
end Behavioral;