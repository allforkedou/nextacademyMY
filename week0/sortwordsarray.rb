# Let's write a program which asks us to type in as many words as we want (one word per line, continuing until we just press Enter on an empty line), and which then repeats the words back to us in alphabetical order. OK? Hint: There's a lovely array method which will give you a sorted version of an array: sort. Use it!

words = []
puts 'Please type in as many words as you like, and press Enter if done'
w = gets.chomp
while (w != '')
	words.push(w)
	w = gets.chomp
end

puts 'The words are now in alphabetical order: ' + words.sort.join(', ')

#Try writing the above program without using the sort method. A large part of programming is solving problems, so get all the practice you can! 

words = []
puts 'Please type in as many words as you like, and press Enter if done'
w = gets.chomp
while (w != '')
	words.push(w)
	w = gets.chomp
end

def sort(unsorted_array,sorted_array)
	min = unsorted_array.min
	unsorted_array.each do |w|
		if(w==min)
			sorted_array.push(min)
			unsorted_array.delete(min)
		end
	end
	if(unsorted_array.empty?)
		return sorted_array
	else
		return sort(unsorted_array,sorted_array)
	end
end

puts 'The words are now in alphabetical order: ' + sort(words,[]).join(', ')





