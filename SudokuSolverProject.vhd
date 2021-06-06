----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:20:10 05/24/2021 
-- Design Name: 
-- Module Name:    SudokuSolverProject - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

package pkg is
type arr is array (0 to 9) of integer range 0 to 9;
type intarray is array (0 to 8, 0 to 8) of integer range 0 to 9;
end package;

use work.pkg.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SudokuSolver is
	port(
		CLK: in std_logic;
		InputSudoku: in intarray;
		SolvedSudoku: out intarray
		);
end SudokuSolver;

architecture Behavioral of SudokuSolver is

begin
	
	process(CLK)
	variable interSudoku : intarray;
	variable inBox, inRow, inCol : std_logic := '0';
	variable cell, candidateCount : integer range 0 to 9 := 0;
	variable boxCol, boxRow : integer range 0 to 6 := 0;
	variable candidates : arr := (0,0,0,0,0,0,0,0,0,0);
	variable row, col : integer range 0 to 8 := 0;
	
	begin
		if rising_edge(CLK) then 
			candidates := (0,0,0,0,0,0,0,0,0,0);
			candidateCount := 0;
			--get cell number and check whether cell is empty or not
			cell := InputSudoku(row,col);
			if cell=0 then
				--try numbers from 1 to 9 to find candidates
				for K in 1 to 9 loop
					inRow := '0';
					inCol := '0';
					inBox := '0';
					--check if number exists in box
					for R in 0 to 2 loop 
						for C in 0 to 2 loop
							if interSudoku(boxRow+R,boxCol+C) = K then
								inBox := '1';
							end if;
						end loop;
					end loop;
					
					for M in 0 to 8 loop
						--check if number exists in row
						if interSudoku(row,M)=K then 
							inRow := '1';
						--check if number exists in column
						elsif interSudoku(M,col)=K then 
							inCol := '1';
						end if;
					end loop;
					--if number does not exist in the row,col and box, add to the candidates array
					if inRow='0' and inCol='0' and inBox='0' then
						candidateCount := candidateCount+1;
						candidates(0) := candidateCount;
						candidates(K) := K;
					end if;
				end loop;
			else
			 interSudoku(row,col) := cell;
			end if;
			-- if cell has 1 candidate, this candidate is the true value of the cell
			if candidates(0) = 1 then
				for K in 1 to 9 loop
					if candidates(K)/=0 then
						interSudoku(row,col) := K;
					end if;
				end loop;
			end if;
			
			--adjust row and col for next clock cycle
			if col = 8 and row = 8 then
				row := 0;
				col := 0;
			elsif col = 8 then
				col := 0;
				row := row+1;
			else
				col := col+1;
			end if;
			
			case col is
				when 0 => 
					boxCol := 0;
				when 3 => 
					boxCol := 3;
				when 6 => 
					boxCol := 6;
				when others => boxCol := boxCol;	
			end case;
			
			case row is
				when 0 => 
					boxRow := 0;
				when 3 => 
					boxRow := 3;
				when 6 => 
					boxRow := 6;
				when others => boxRow := boxRow;
			end case;
		end if;
		SolvedSudoku <= interSudoku;
	end process;
end Behavioral;

