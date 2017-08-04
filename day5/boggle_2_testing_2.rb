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

  def check_neighbors(current_char,word_remaining,travelled)
    if(word_remaining == "")
      return true
    else
      # p current_char, word_remaining
      for i in -1..1
        for j in -1..1
          for k in 0..check_hash(current_char).length-1
            if (check_hash(word_remaining[0])-[check_hash(current_char)[k]]-travelled).include?(check_hash(current_char)[k]+Vector[i,j])
              travelled << check_hash(current_char)[k]
              p travelled
              p Vector[i,j]
              return check_neighbors(word_remaining[0], word_remaining[1..-1],travelled)
            end
          end
        end
      end
      return false
    end
  end

  def check_hash(char)
    if(@chars_hash[char].nil?)
      @chars_hash[char] = []
      for i in 0..3
        for j in 0..3
          if (@board[i][j] == char)
            @chars_hash[char] << Vector[i,j]
          end
        end
      end
    else
      #do nothing
    end
    return @chars_hash[char]
  end

  def include? (word)
    for i in 0..word.length-1
        if (check_hash(word[i])==[])
          return false
        end
    end
    return check_neighbors(word[0],word[1..-1],[])
  end

end



  board = BoggleBoard.new
  board.shake!
  puts board
  puts board.include?('PPAPP')