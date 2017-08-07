#Depth First Traversal (DFS) method
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

    @@moves = 

  def initialize
    @board = Array.new(4){Array.new(4)} #Would be easier to just make a 16x1 matrix
    @visited = Array.new(4){Array.new(4,false)}
    @dictonary = []
    @chars_hash = {}
  end

  def shake!
    @board = [%w{P P A P},%w{A B C D},%w{L M A O},%w{A S I A}]
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

  def findWords(visited, i, j, str)
    @visited[i][j] = true
    str += @board[i][j]
    if isWord(str)
      return true
    end

    for row in i-1..i+1
      for col in j-1..j+1
          if (row>=0 and col>=0) and !visited[i][j]
            findWords(@visited, row, col, str)
          end
      end
    end

  end

  def isWord(str)
    if (dictionary.include?(str))
      return true
    else
      return false
    end
  end

  def include? (word)
    @dictionary << word
    for i in 0..3
      for j in 0..3
        findWords(@visited, i, j, "", word)
      end
    end

  end

end



board = BoggleBoard.new
board.shake!
puts board
puts board.include?('PPAPP')