roster = [["Number", "Name", "Position", "Points per Game"],
         [12, "Joe Schmo", "Center", [14, 32, 7, 0, 23] ],
         [9, "Ms. Buckets", "Point Guard", [19, 0, 11, 22, 0] ],
         [31, "Harvey Kay", "Shooting Guard", [0, 30, 16, 0, 25] ],
         [7, "Sally Talls", "Power Forward", [18, 29, 26, 31, 19] ],
         [22, "MK DiBoux", "Small Forward", [11, 0, 23, 17, 0] ]]

# turns the array of players into array of hashes
def convert_roster_format(roster)
	hash_arr = []
	#Doesn't work due toi .to_h only take 2 parameters
	# symbols = []
	# for i in 0..roster[0].length-1
	# 	symbols << roster[0][i].to_sym
	# end
	# for i in 1..roster.length-1
	# 	hash_arr << [symbols,roster[i]].to_h
	# end
	for i in 1..roster.length-1
		# hash_arr << Hash[roster[0].zip(roster[i])] #or, Hash[] and to_h are both the same
		hash_arr <<(roster[0].zip(roster[i])).to_h
	end

	return hash_arr
end

p convert_roster_format(roster)