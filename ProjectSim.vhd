--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:20:50 05/24/2021
-- Design Name:   
-- Module Name:   C:/ELEC LAB/SudokuSolverProject/ProjectSim.vhd
-- Project Name:  SudokuSolverProject
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SudokuSolverProject
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
USE ieee.numeric_std.ALL;
use work.pkg.all;
 
ENTITY SudokuSolverSim IS
END SudokuSolverSim;
 
ARCHITECTURE behavior OF SudokuSolverSim IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SudokuSolver
    PORT(
		CLK: in std_logic;
		InputSudoku: in intarray;
		SolvedSudoku: out intarray
        );
    END COMPONENT;
   
	signal CLK : std_logic := '0';
   signal InputSudoku : intarray :=((8,5,0,3,0,7,0,1,0),
												(0,7,6,9,0,0,0,8,3),
												(0,3,0,6,0,1,2,5,0),
												(0,0,1,0,9,8,3,0,5),
												(3,0,7,0,1,4,0,0,9),
												(9,0,5,0,6,0,0,4,1),
												(0,6,0,8,5,0,1,9,0),
												(0,9,4,0,0,6,5,0,8),                                                                                                           
												(5,0,8,4,3,0,7,0,0));
												
	signal SolvedSudoku : intarray :=((0,0,0,0,0,0,0,0,0),
												(0,0,0,0,0,0,0,0,0),
												(0,0,0,0,0,0,0,0,0),
												(0,0,0,0,0,0,0,0,0),
												(0,0,0,0,0,0,0,0,0),
												(0,0,0,0,0,0,0,0,0),
												(0,0,0,0,0,0,0,0,0),
												(0,0,0,0,0,0,0,0,0),                                                                                                           
												(0,0,0,0,0,0,0,0,0));
 
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SudokuSolver PORT MAP (
		CLK => CLK,
		InputSudoku => InputSudoku,
		SolvedSudoku => SolvedSudoku
        );
  
	 -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clock_period/2;
		Clk <= '1';
		wait for Clock_period/2;
   end process;
  	    							
END;
