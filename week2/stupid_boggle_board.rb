# 1. Stupid Boggle Board

# Our BoggleBoard class has one core instance method: shake!

# For the first step, focus on how you represent the board. shake! should modify the board, filling each cell with a random upper-case letter A-Z.

# There are no other restrictions on the letters. They can appear multiple times, for example. Just pick a flippin’ random letter and don’t sweat it, ok?

# I also know you’re worrying about how “Q” is always “Qu” in Boggle. Just let it be “Q” for now.

# We want to write code that works like this:
# board = BoggleBoard.new
# puts board
# # An unshaken board prints out something sensible, like:
# # ____
# # ____
# # ____
# # ____

# # Shake (and modify) the board
# board.shake!

# puts board
# # Prints out:
# # DUMV
# # KSPD
# # HCDA
# # ZOHG

# board.shake!
# puts board

# # We've shaken again, so a new random board:
# # QIRZ
# # EEBY
# # OEJE
# # MHCU
class BoggleBoard
  def initialize
    @board = Array.new(4){Array.new(4)}
  end

  def shake!
    @board.map! do |arr|
      arr.map!{|x| x=(65+rand(26)).chr}
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
      puts @board[i].join("")
    end
  end
end

  board = BoggleBoard.new
  board.shake!
  puts board