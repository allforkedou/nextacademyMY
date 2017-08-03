# Boggle 2: Word Checker
# Using your basic BoggleBoard generator from before, we’re now going to model a person checking whether a given word is on the Boggle board or not.

# The only rule is that the same dice can’t be reused in the same word, i.e., the “word path” can’t ever cross itself.

# We’ll implement a BoggleBoard#include? method which works like this:

# board = BoggleBoard.new
# board.shake!
# board.include?("apple") # => true or false
# Note: This method won’t care whether the input is actually a word in a dictionary. It will just tell you whether the string, as its input, is on the Boggle board.

# Tasks
# 1. Pseudocode for BoggleBoard#include?

# Take a step back. Breathe. I know you want to jump right in and start writing code. But don’t! It’s a trap!

# Get a pen and paper and draw out a 4-by-4 Boggle board. Imagine it filled with letters. Or actually fill it with letters if you like - maybe using your Boggle board generator.

# Have your pair spell out a word for you and verify yourself whether it is on the board. It might help if the word is gibberish and not English so that you’re forced to check letter-by-letter and can short-circuit the English-reading part of your brain.

# As clearly and precisely as you can, reflect on your internal mental process. Can you explain it to your pair? Draw it, verbalize it, or do whatever is easiest for you, but make sure you and your pair are clear about it.

# Initially, let’s do a simpler, less interesting version of Boggle. Instead of being able to string together letters that are connected in any direction, let’s just focus on words that appear in a continuous line vertically, horizontally, and diagonally. (Remember, only words of 3 or more letters count!)

# Write pseudocode for your algorithm. If you’re feeling adventurous, you and your pair could each write your own pseudocode and compare.

# How do your stylistic approaches compare? Your respective vocabulary? The overall structure and strategy of your approach?

# 2. Implement BoggleBoard#include? in Ruby

# If you went through the exercise above, your job is now to just translate your pseudocode into Ruby.

# What new instance methods do you need to define? Would your algorithm be easier to implement if your board was stored differently?

# For example, what are the tradeoffs between storing the board as a 4x4 array of arrays versus a single 16-element array?

# Going Deeper (Extra Credit)
# Now try implementing your algorithm for the real boggle rules! The words don’t have to be in continuous lines, they can be connected in any way, diagonally, vertically, horizontally, in any order, i.e. words can snake themselves across the board willy-nilly.

# What do you need to change to accommodate this added requirement? Does it make sense to change the structure of your board? Again, model this before coding, make sure you are aware of all the cases.
class BoggleBoard
    @@dice = [
              [%w{A A E E G N},
              %w{E L R T T Y},
              %w{A O O T T W},
              %w{A B B J O O}],
              [%w{E H R T V W},
              %w{C I M O T U},
              %w{D I S T T Y},
              %w{E I O S S T}],
              [%w{D E L R V Y},
              %w{A C H O P S},
              %w{H I M N Q U},
              %w{E E I N S U}],
              [%w{E E G H N W},
              %w{A F F K P S},
              %w{H L N N R Z},
              %w{D E I L R X}]
            ]

  def initialize
    @board = Array.new(4){Array.new(4)} #Would be easier to just make a 16x1 matrix
  end

  def shake!
    @board = @@dice.map do |arr| 
              arr.map {|x| x=x[rand(6)]}
            end
  end

  # Defining to_s on an object controls how the object is
  # represented as a string, e.g., when you pass it to puts
  #
  # Override this to print out a sensible board format so
  # you can write code like:
  #
  # board = BoggleBoard.new
  # board.shake!
  # puts board
  def to_s
    # "omg what is this? try printing me."
    for i in 0..3
      if (@board[i]).include?('Q')
        @board[i][@board[i].index('Q')] = 'Qu'
      end
      puts @board[i].join(" ")
    end
  end
end

  board = BoggleBoard.new
  board.shake!
  puts board