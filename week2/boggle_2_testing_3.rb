#This is the version that can find all words but will use repeated dice

require "matrix"
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
    # @board = [%w{P P A P},%w{A B C D},%w{L M A O},%w{A S I A}]
    @board = (@@dice.map do |arr| 
              arr.map {|x| x=Node.new(x[rand(6)])} end)

    push_neighbors
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
      for j in 0..3
        if (@board[i][j].value == 'Q')
          letter = 'Qu'
        else
          letter = @board[i][j].value
        end
        print letter + (" ")
      end
      puts
    end
  end

  def push_neighbors
    for i in 0..3
      for j in 0..3
              @board[i][j].neighbors << @board[i][j-1] unless j-1<0#up
              @board[i][j].neighbors << @board[i][j+1] unless j+1>3#bottom
              @board[i][j].neighbors << @board[i-1][j] unless i-1<0#left
              @board[i][j].neighbors << @board[i+1][j] unless i+1>3#right
              @board[i][j].neighbors << @board[i-1][j-1] unless i-1<0 or j-1<0#upper left
              @board[i][j].neighbors << @board[i+1][j-1] unless i+1>3 or j-1<0#upper right
              @board[i][j].neighbors << @board[i-1][j+1] unless i-1<0 or j+1>3#bottom left
              @board[i][j].neighbors << @board[i+1][j+1] unless i+1>3 or j+1>3#bottom right
      end
    end
  end


  def include?(word, root = nil, travelled = [])
    if (travlled == [])
      paths == @board
    else
      paths == root.neighbors
    end
    paths.each do |arr|
      arr.each do |node|
        if (node.value == word[0]) and !travelled.include?(node)
          travelled<<node
          return true if word == node.value
          return include?(word[1,-1], node, travelled)
        end
        travelled = []
      end
    end
    return false
  end

end

class Node
  attr_accessor :value, :neighbors
  def initialize(letter)
      @value = letter
      @neighbors = []
  end
end



  board = BoggleBoard.new
  board.shake!
  puts board
  puts board.include?('PPAP')