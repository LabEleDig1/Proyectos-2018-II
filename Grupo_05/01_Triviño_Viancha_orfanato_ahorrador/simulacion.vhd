--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:58:08 02/13/2019
-- Design Name:   
-- Module Name:   C:/Users/Daryhen/Documents/digitales/proyecto final/intento2/simulacion.vhd
-- Project Name:  intento2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Top
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
 
ENTITY simulacion IS
END simulacion;
 
ARCHITECTURE behavior OF simulacion IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Top
    PORT(
         luz : OUT  std_logic;
         entresis : IN  std_logic;
         ECO : IN  std_logic;
         TRIGGER : INOUT  std_logic;
         start : IN  std_logic;
         clk : IN  std_logic;
         rst : INOUT  std_logic;
         lcd_e : OUT  std_logic;
         lcd_rs : OUT  std_logic;
         lcd_rw : OUT  std_logic;
         luz2 : OUT  std_logic;
         lcd_db : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal entresis : std_logic := '0';
   signal ECO : std_logic := '0';
   signal start : std_logic := '0';
   signal clk : std_logic := '0';

	--BiDirs
   signal TRIGGER : std_logic;
   signal rst : std_logic;

 	--Outputs
   signal luz : std_logic;
   signal lcd_e : std_logic;
   signal lcd_rs : std_logic;
   signal lcd_rw : std_logic;
   signal luz2 : std_logic;
   signal lcd_db : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Top PORT MAP (
          luz => luz,
          entresis => entresis,
          ECO => ECO,
          TRIGGER => TRIGGER,
          start => start,
          clk => clk,
          rst => rst,
          lcd_e => lcd_e,
          lcd_rs => lcd_rs,
          lcd_rw => lcd_rw,
          luz2 => luz2,
          lcd_db => lcd_db
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
		start<='1';
		wait for clk_period*100;
		start<='0';
      -- insert stimulus here 

      wait;
   end process;

END;
