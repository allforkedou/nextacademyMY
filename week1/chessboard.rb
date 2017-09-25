chessboard = Array.new(8){Array.new(8)}
first_line = ['Rook', 'Knight', 'Bishop', 'Queen', 
			  'King', 'Bishop', 'Knight', 'Rook']
second_line = ['Pawn']*8
for i in 0..7
	#complete first line
	chessboard[0][i] = 'B '+ first_line[i]
	chessboard[7][i] = 'W '+ first_line[i]

	#complete second line
	chessboard[1][i] = 'B '+ second_line[i]
	chessboard[6][i] = 'W '+ second_line[i]
end

p chessboard

table = [
        ["Number", "Name", "Position", "Points per Game"],
        [12, "Joe Schmo", "Center", [14, 32, 7, 0, 23]],
        [9, "Ms. Buckets", "Point Guard", [19, 0, 11, 22, 0]],
        [31, "Harvey Kay", "Shooting Guard", [0, 30, 16, 0, 25]],
        [18, "Sally Talls", "Power Forward", [18, 29, 26, 31, 19]],
        [22, "MK DiBoux", "Small Forward", [11, 0, 23, 17, 0]]
  		]