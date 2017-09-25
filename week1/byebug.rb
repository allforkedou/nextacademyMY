require 'byebug'

def shift_letter(array)

	alphabets = ("a".."z").to_a
	# byebug

	array.map! do |element|
		byebug
		first_letter_index = alphabets.index(element[0])
		shifted_letter_index = first_letter_index + 1
		shifted_letter = alphabets[shifted_letter_index]
		shifted_letter + element[1..-1]
	end

end

array = ["apple", "banana", "papaya"]
p shift_letter(array)