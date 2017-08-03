class Sudoku
  def initialize(board_string)
  	board_string.split('').each_slice(9) do |row|
  		new_row = row.map do |cell|
  			if (cell == 0)
  				cell = '-'
  			end
  		end
  		p new_row.join(' ')
  	end
  end

  def solve!

  end

  # Returns a string representing the current state of the board
  # Don't spend too much time on this method; flag someone from staff
  # if you are.
  def board

  end
end

# The file has newlines at the end of each line, so we call
# String#chomp to remove them.
board_string = File.readlines('sample.unsolved.txt').first.chomp

game = Sudoku.new(board_string)

# Remember: this will just fill out all the "logically necessary" cells and not "guess"
game.solve!

# prints the board with nice formatting to the user
puts game.board

board_string = '619030040270061008000047621486302079000014580031009060005720806320106057160400030'