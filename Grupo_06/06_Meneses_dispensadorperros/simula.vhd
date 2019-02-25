--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:20:25 02/13/2019
-- Design Name:   
-- Module Name:   C:/Users/User/Downloads/Teclado/simula.vhd
-- Project Name:  teclado
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: teclado
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY simula IS
END simula;
 
ARCHITECTURE behavior OF simula IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT teclado
    PORT(
         filas : IN  std_logic_vector(3 downto 0);
         fleds : OUT  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         start : IN  std_logic;
         rst : IN  std_logic;
         leds : OUT  std_logic_vector(3 downto 0);
         columnas : OUT  std_logic_vector(3 downto 0);
         disp : OUT  std_logic_vector(6 downto 0);
         comun : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal filas : std_logic_vector(3 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal start : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal fleds : std_logic_vector(3 downto 0);
   signal leds : std_logic_vector(3 downto 0);
   signal columnas : std_logic_vector(3 downto 0);
   signal disp : std_logic_vector(6 downto 0);
   signal comun : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: teclado PORT MAP (
          filas => filas,
          fleds => fleds,
          clk => clk,
          start => start,
          rst => rst,
          leds => leds,
          columnas => columnas,
          disp => disp,
          comun => comun
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		
		rst <= '1';
		wait for 10 ns;
		rst <= '0';
		wait for 10 ns;
		start <= '1';
		wait for 10 ns;
		filas <= "0001";
	   wait for 10 ns;
		filas <= "0010";
		wait for 10 ns;
		filas <= "0100";
	   wait for 10 ns;
		filas <= "0101";
		wait for 10 ns;
		filas <= "0110";
	   wait for 10 ns;
		filas <= "0111";
		wait for 10 ns;
		filas <= "1000";
	   wait for 10 ns;
		filas <= "1001";

      wait;
   end process;

END;
