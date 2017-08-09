Boggle 2: Word Checker
--------
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
