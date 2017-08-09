Sudoku 2: Guessing! (Optional)
-------
Starting with your attempt from the previous iteration of the Sudoku solver, we now want to add the ability to make guessing.

What happens if a square/cell can contain multiple possible numbers and you don’t have enough information to conclude right then and there which number it is?

Most people who play Sudoku do “guessing”. Usually this is done by writing possibilities in the corners of the square.

Task: Implement a guessing-friendly version of Sudoku
Once we’ve filled in all cells which have only one possible value, we have to guess. Write out a pseudocode for how that might work before you dive in!

This solver should now be able to solve any Sudoku puzzle, although some will take a long time. Try it with the sample_unsolved.txt file.
