# 2. Smart(er) Boggle Board

# We need to model the dice, now. Think carefully about how shaking a Boggle board works. Each die lands in one and only one cell, with one side facing up.

# Can you think of a way to model a die landing in only one cell without explicitly keeping track of which dice have landed and which haven’t? One way to do this is using a secondary Array, can you think of another?

# We’ll still only have one core method, BoggleBoard#shake!. Here’s a list of Boggle dice, with “Q” representing “Qu”:
# AAEEGN
# ELRTTY
# AOOTTW
# ABBJOO
# EHRTVW
# CIMOTU
# DISTTY
# EIOSST
# DELRVY
# ACHOPS
# HIMNQU
# EEINSU
# EEGHNW
# AFFKPS
# HLNNRZ
# DEILRX

# 3. Dealing with Q

# Now let’s take care of the “Q”. Assuming we want “Qu” to be printed rather than “Q”, how could we make that happen?

# There are several ways of making this happen, especially if you keep in mind that how the board appears to the computer - how it’s represented in your program - doesn’t have to be how it appears to the person using the program.

# Consider a few ways to make “Qu” print instead of just “Q”, deliberate on the tradeoffs for a few minutes, and implement one. You’ll probably want to change how the board is printed, too, since “Qu” will throw everything out of alignment.

# For example, something like this might be appropriate:

# > puts board.shake!
# U N O T
# S E W G
# S V L T
# L Qu C F
# Check out the String#ljust method for an easy way to add the right amount of space for display.
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