#Boggle board test version with board being
  #P P A P
  #A B C D
  #L M A O
  #A S I A
require "matrix"
class BoggleBoard
    # @@dice = [
    #           [%w{A A E E G N},
    #           %w{E L R T T Y},
    #           %w{A O O T T W},
    #           %w{A B B J O O}],
    #           [%w{E H R T V W},
    #           %w{C I M O T U},
    #           %w{D I S T T Y},
    #           %w{E I O S S T}],
    #           [%w{D E L R V Y},
    #           %w{A C H O P S},
    #           %w{H I M N Q U},
    #           %w{E E I N S U}],
    #           [%w{E E G H N W},
    #           %w{A F F K P S},
    #           %w{H L N N R Z},
    #           %w{D E I L R X}]
    #         ]
  attr_reader :board
  def initialize
    @board = Array.new(4){Array.new(4)} #Would be easier to just make a 16x1 matrix
    @hash = {} #The hash table of position vectors of characters
    @visited = [] #The array of position vectors visited
  end

  def shake!
    @board = [%w{P P A P},%w{A B C Q},%w{L M A O},%w{A S I A}]
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
    #Should use marshal, else it will just be a pointer pointint to board
    print_board =  Marshal.load(Marshal.dump(@board))
    for i in 0..3
      if (print_board[i]).include?('Q')
        print_board[i][print_board[i].index('Q')] = 'Qu'
      end
      puts print_board[i].join(" ")
    end
  end

  def include?(word)
    word = word.upcase.gsub('QU','Q')
    create_hash(word)
    #if the boggle doesn't have every alphabet, don't even bother to call helper function and return false
    if !include_every_alphabet?(word)
      p 'hey'
      return false
    end
    if include_helper(word, check_hash(word[0]))
      print_visited_path
      return true
    else
      return false
    end
  end

  #Where the magic happens
  def include_helper(word, restricted_hash)
    #if there is only an alphabet to be found and is on boggle board, return true
    hash_w0 = restricted_hash
    hash_w1 = check_hash(word[1])

    for k in 0..hash_w0.length-1
      @visited << hash_w0[k]
      print_visited_path
      #This is the point you should put print_visited_path to see the visiting process
      if (word.length==1)
        return true
      end
      valid, valid_i_j = is_valid(hash_w0[k], hash_w1)
      if valid
        if include_helper(word[1..-1],valid_i_j)
          return true
        else
          @visited.pop
        end
      else
        @visited.pop
      end
    end
    return false
  end

  #Check if the boggle board has all the possible alphabets
  def include_every_alphabet?(word)
    for i in 0..word.length-1
      return false if (check_hash(word[i])==[])
    end
    return true
  end

  #Create hash table of position vectors for every character in the word
  def create_hash(word)
    for k in 0..word.length-1
      if(@hash[word[k]].nil?)
        @hash[word[k]] = []
        for i in 0..3
          for j in 0..3
            @hash[word[k]] << Vector[i,j] if (@board[i][j] == word[k])
          end
        end
        #Can implement include_every_alphabet? here but will look very clumsy
      end
    end
  end

  #Check and return the hash table of the character
  def check_hash(char)
    if char.nil?
      return nil
    else
      return @hash[char]
    end
  end

  #Check if the current char vector can visit the next char and return the possible Vectors [i,j]
  def is_valid(vector, hash_w1)
    valid_i_j = []
    for i in -1..1
      for j in -1..1
        if(hash_w1-@visited).include?(vector+Vector[i,j])
          valid_i_j << vector+Vector[i,j]
        end
      end
    end
    if (valid_i_j == [])
      return false, valid_i_j
    else
      return true, valid_i_j
    end
  end

  def print_visited_path
    @visited.each do |vector|
      print vector.to_s.delete('Vector') + '->'
    end
    puts
  end

end #This is Class' end! DO NOT DELETE!

  board = BoggleBoard.new
  board.shake!
  puts board

  #Testcases
  # puts board.include?('PPAP')
  # puts board.include?('PPAPP')
  # puts board.include?('CQU')
  # puts board.include?('B')
  # puts board.include?('PALASIAA')
  # puts board.include?('B')