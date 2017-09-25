Boggle 1: Basic Board Generation
------
We’re going to create a basic Boggle board generator. Read about Boggle on Wikipedia or try out the game if you’re not familiar with it.

Boggle is a simple game, but when you get down into it there are some subtleties.

First, we’re only going to model the first part of Boggle, where you place the Boggle dice and shake them around to create the initial board. To imagine what that might look like, visualize a blank 4x4 grid with a button next to it. When you push the button a letter appears in each of the 16 cells and you can begin playing Boggle.

We’re going to do it in two steps. First, we’ll to build a dumb version which doesn’t care at all about whether it’s likely that the Boggle board will have English words. Second, we’ll build a version that models the dice.

Tasks
Please note: Start with sample code from the gist given in the challenge. It gives a hint on class structure and internal methods.

1. Stupid Boggle Board

Our BoggleBoard class has one core instance method: shake!

For the first step, focus on how you represent the board. shake! should modify the board, filling each cell with a random upper-case letter A-Z.

There are no other restrictions on the letters. They can appear multiple times, for example. Just pick a flippin’ random letter and don’t sweat it, ok?

I also know you’re worrying about how “Q” is always “Qu” in Boggle. Just let it be “Q” for now.

We want to write code that works like this:

board = BoggleBoard.new
puts board
 An unshaken board prints out something sensible, like:
 Shake (and modify) the board
board.shake!

puts board
 Prints out:
 DUMV
 KSPD
 HCDA
 ZOHG

board.shake!
puts board

 We've shaken again, so a new random board:
 QIRZ
 EEBY
 OEJE
 MHCU
2. Smart(er) Boggle Board

We need to model the dice, now. Think carefully about how shaking a Boggle board works. Each die lands in one and only one cell, with one side facing up.

Can you think of a way to model a die landing in only one cell without explicitly keeping track of which dice have landed and which haven’t? One way to do this is using a secondary Array, can you think of another?

We’ll still only have one core method, BoggleBoard#shake!. Here’s a list of Boggle dice, with “Q” representing “Qu”:

AAEEGN
ELRTTY
AOOTTW
ABBJOO
EHRTVW
CIMOTU
DISTTY
EIOSST
DELRVY
ACHOPS
HIMNQU
EEINSU
EEGHNW
AFFKPS
HLNNRZ
DEILRX
3. Dealing with Q

Now let’s take care of the “Q”. Assuming we want “Qu” to be printed rather than “Q”, how could we make that happen?

There are several ways of making this happen, especially if you keep in mind that how the board appears to the computer - how it’s represented in your program - doesn’t have to be how it appears to the person using the program.

Consider a few ways to make “Qu” print instead of just “Q”, deliberate on the tradeoffs for a few minutes, and implement one. You’ll probably want to change how the board is printed, too, since “Qu” will throw everything out of alignment.

For example, something like this might be appropriate:

> puts board.shake!
U N O T
S E W G
S V L T
L Qu C F
Check out the String#ljust method for an easy way to add the right amount of space for display.

As you’re coding, ask yourself…
Do I have a clear understanding of how this procedure works?
Am I stuck because I know what I want to do but don’t know how to say it in Ruby?
Am I stuck because my understanding of how Boggle works is too fuzzy or mistaken?

Boggle 2: Word Checker
------
Using your basic BoggleBoard generator from before, we’re now going to model a person checking whether a given word is on the Boggle board or not.

The only rule is that the same dice can’t be reused in the same word, i.e., the “word path” can’t ever cross itself.

We’ll implement a BoggleBoard#include? method which works like this:

board = BoggleBoard.new
board.shake!
board.include?("apple") # => true or false
Note: This method won’t care whether the input is actually a word in a dictionary. It will just tell you whether the string, as its input, is on the Boggle board.

Tasks
1. Pseudocode for BoggleBoard#include?

Take a step back. Breathe. I know you want to jump right in and start writing code. But don’t! It’s a trap!

Get a pen and paper and draw out a 4-by-4 Boggle board. Imagine it filled with letters. Or actually fill it with letters if you like - maybe using your Boggle board generator.

Have your pair spell out a word for you and verify yourself whether it is on the board. It might help if the word is gibberish and not English so that you’re forced to check letter-by-letter and can short-circuit the English-reading part of your brain.

As clearly and precisely as you can, reflect on your internal mental process. Can you explain it to your pair? Draw it, verbalize it, or do whatever is easiest for you, but make sure you and your pair are clear about it.

Initially, let’s do a simpler, less interesting version of Boggle. Instead of being able to string together letters that are connected in any direction, let’s just focus on words that appear in a continuous line vertically, horizontally, and diagonally. (Remember, only words of 3 or more letters count!)

Write pseudocode for your algorithm. If you’re feeling adventurous, you and your pair could each write your own pseudocode and compare.

How do your stylistic approaches compare? Your respective vocabulary? The overall structure and strategy of your approach?

2. Implement BoggleBoard#include? in Ruby

If you went through the exercise above, your job is now to just translate your pseudocode into Ruby.

What new instance methods do you need to define? Would your algorithm be easier to implement if your board was stored differently?

For example, what are the tradeoffs between storing the board as a 4x4 array of arrays versus a single 16-element array?

Going Deeper (Extra Credit)
Now try implementing your algorithm for the real boggle rules! The words don’t have to be in continuous lines, they can be connected in any way, diagonally, vertically, horizontally, in any order, i.e. words can snake themselves across the board willy-nilly.

What do you need to change to accommodate this added requirement? Does it make sense to change the structure of your board? Again, model this before coding, make sure you are aware of all the cases.

Initially, let’s do a simpler, less interesting version of Boggle. Instead of being able to string together letters that are connected in any direction, let’s just focus on words that appear in a continuous line vertically, horizontally, and diagonally. (Remember, only words of 3 or more letters count!)

Sudoku 1: Modelling And Logic
-----
By the end of the next two challenges, you’ll have a fully-functioning Sudoku solver that you can run from the command line.

Context
From Wikipedia’s definition, Sudoku is a logic-based, combinatorial number-placement puzzle. The objective is to fill a 9x9 grid with digits so that each column, each row, and each of the nine 3x3 sub-grids that compose the grid (also called “boxes”) contains all of the digits from 1 to 9.

In a sudoku game, some of the squares will already have numbers. Usually there will be enough initial numbers to guarantee a unique solution.

An example is given below:

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
-------
Starting with your attempt from the previous iteration of the Sudoku solver, we now want to add the ability to make guessing.

What happens if a square/cell can contain multiple possible numbers and you don’t have enough information to conclude right then and there which number it is?

Most people who play Sudoku do “guessing”. Usually this is done by writing possibilities in the corners of the square.

Task: Implement a guessing-friendly version of Sudoku
Once we’ve filled in all cells which have only one possible value, we have to guess. Write out a pseudocode for how that might work before you dive in!

This solver should now be able to solve any Sudoku puzzle, although some will take a long time. Try it with the sample_unsolved.txt file.

