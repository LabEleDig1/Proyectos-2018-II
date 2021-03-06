----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:54:28 02/18/2019 
-- Design Name: 
-- Module Name:    Div1K - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--declare the 1kHz divisor

entity Div1K is
port(clk100M:in std_logic;
     clk1k:out std_logic);
end Div1K;

--how the divisor works

architecture Behavioral of Div1K is
signal pulse:std_logic:='0';
signal count: integer range 0 to 49999:=0;
begin
process(clk100M)
begin
if(clk100M'event and clk100M='1')then
if (count=49999) then
pulse<= NOT (pulse);
count<=0;
else
count<= count+1;
end if;
end if;
end process;
clk1k<=pulse;
  
end Behavioral;

