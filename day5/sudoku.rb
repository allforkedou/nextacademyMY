class Sudoku
  attr_accessor :board_string, :board_arr
  def initialize(board_string)
  	@board_string = board_string
  	@board_arr = string_to_array(board_string)
  end

  def solve!
  	p @board_arr
  end

  def string_to_array(string)
  	arr = Array.new(9){Array.new(9)}
  	if(string.length == 81)
  		for i in 0..8
  			for j in 0..8
  				arr[i][j] = string[i*8+j]
  			end
  		end
  		return arr
  	end
  end
  # Returns a string representing the current state of the board
  # Don't spend too much time on this method; flag someone from staff
  # if you are.
  def board
  	print_board = @board_string
  	print_board.split("").each_slice(9) do |row|
  		new_row = row.map do |cell|
  			if (cell == '0')
  				cell = '_'
  			else
  				cell = cell
  			end
  		end
  	p new_row.join(" ")
  	end
  end

 #  def still_empty?
 #  	for i in 0..@board_string.length-1
	#   	if @board_string[i] == '0'
	#   		return true
	#   	else
	#   		return false
	#   	end
	# end
 #  end



end

# The file has newlines at the end of each line, so we call
# String#chomp to remove them.
board_string = File.readlines('sample_unsolved.txt').first.chomp
game = Sudoku.new(board_string)

# Remember: this will just fill out all the "logically necessary" cells and not "guess"
game.solve!

# prints the board with nice formatting to the user
game.board

