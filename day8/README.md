Sudoku 1: Modelling And Logic
------
By the end of the next two challenges, you’ll have a fully-functioning Sudoku solver that you can run from the command line.

Context
From Wikipedia’s definition, Sudoku is a logic-based, combinatorial number-placement puzzle. The objective is to fill a 9x9 grid with digits so that each column, each row, and each of the nine 3x3 sub-grids that compose the grid (also called “boxes”) contains all of the digits from 1 to 9.

In a sudoku game, some of the squares will already have numbers. Usually there will be enough initial numbers to guarantee a unique solution.

An example is given below:

image image

For this challenge, we will be building a solver that fills in logically necessary squares and requires no guessing (a square/cell that has one and only one solution). This will be the first iteration of the code.

Breathe: We know this is the hardest challenge you’ve hit yet. When in doubt, take a step back and reflect on how you or someone else plays Sudoku and don’t get stuck in code! You can start by breaking down your problem into smaller, more manageable parts/tasks as follows.

Tasks
1. Understanding: Write down the nouns and verbs of the game

Think carefully about all the nouns and verbs in a Sudoku game. There’s the person who created the puzzle (the setter). There’s the person who is solving the puzzle (the player). What are the important parts of the board called? How do the player and setting interact with them?

A computer program that solves Sudoku is simulating the player, which means the better you can empathize with the player the more likely you’ll understand how to write a Sudoku solver. You’ll be tempted to focus on the board first - is it some kind of array, a hash, something else? - but don’t! Understanding the person playing the game is key; the code to “power” the board is a detail.

2. Modeling: Strategies for Humans

Get out an actual Sudoku puzzle, printed on a piece of paper. Play it with your pair. Pay attention to yourself and to each other.

What strategies are you adopting and why?
How do you choose where to start?
How do you know when to really put a number in a cell?
Did you adopt the same notation/board markings while playing Sudoku? Why? If not, why did you choose differently?
Are you avoiding any strategies because they’re too tedious or require you to remember too much?
It’s important to see that sometimes the strategies that work for us (humans) would be really hard to implement on a computer, and vice versa: strategies we avoid because we’d have to write too much, use too many sheets of paper, or remember too much are a cakewalk for a computer.

3. Planning: Pseudocode for First Iteration

Remember, for the first iteration, we’re just going build a solver that fills in logically necessary squares and requires no guessing. This might not solve every Sudoku board, although it often solves the easiest. How can you tell when you’ve filled in all the logically necessary squares?

Write out pseudocode for this version, separately, and compare it to each other. How does it differ? Which approach seems more sound? Are there some core operations or methods you need to support?

For example, given a cell/square, you’ll probably need at least three methods:

Give me the other cells in that cell’s row.
Give me the other cells in that cell’s column.
Give me the other cells in that cell’s box.
4. Code it Out!

Your Sudoku solver should take a string like this as its input: 619030040270061008000047621486302079000014580031009060005720806320106057160400030

Each consecutive 9 digits represents a row of the Sudoku board, and a 0 represents an empty cell. It’d work like this:

game = Sudoku.new('619030040270061008000047621486302079000014580031009060005720806320106057160400030')
game.solve!
puts game.board
This would print something like this:

                      ----------------------
                      6 1 9 | 0 3 0 | 0 4 0
                      2 7 0 | 0 6 1 | 0 0 8
                      0 0 0 | 0 4 7 | 6 2 1
                      ----------------------
                      4 8 6 | 3 0 2 | 0 7 9
                      0 0 0 | 0 1 4 | 5 8 0
                      0 3 1 | 0 0 9 | 0 6 0
                      ----------------------
                      0 0 5 | 7 2 0 | 8 0 6
                      3 2 0 | 1 0 6 | 0 5 7
                      1 6 0 | 4 0 0 | 0 3 0
                      ----------------------
Note: Don’t worry about the particular format of the board when printed. The key thing is getting the logic around solving/guessing correctly.

Question: What about performance? Do not worry about performance yet! Optimizations can come later. Clean, logical code is more important and will be easier to refactor.

5. Testing!

Remember, always start with the simplest test case possible. For a Sudoku solver, what’s the simplest case? It’s working with a board that is only missing one number. 609238745274561398853947621486352179792614583531879264945723816328196457167485932

Sudoku 2: Guessing! (Optional)
------------
Starting with your attempt from the previous iteration of the Sudoku solver, we now want to add the ability to make guessing.

What happens if a square/cell can contain multiple possible numbers and you don’t have enough information to conclude right then and there which number it is?

Most people who play Sudoku do “guessing”. Usually this is done by writing possibilities in the corners of the square.

Task: Implement a guessing-friendly version of Sudoku
Once we’ve filled in all cells which have only one possible value, we have to guess. Write out a pseudocode for how that might work before you dive in!

This solver should now be able to solve any Sudoku puzzle, although some will take a long time. Try it with the sample_unsolved.txt file.
