# Pig Latin Translator (Basic)
# Rules of the game
# If your first letter is a vowel (“a,e,i,o,u”), just add
# “way” behind it.
# E.g.: apple → appleway
# If your first letter is a consonant (anything that’s not
# “a,e,i,o,u”), move it to the end of the word and add
# “ay” behind it.
# E.g.: pig → igpay banana → ananabay
# If the first cluster of letter is a consonant, move it to
# the end of the word and add “ay” behind it.
# E.g.: ship → ipshay sky → skyay

puts 'Pig Latin Translator (Basic): Please enter a word'
word = gets.chomp()

if(word.length == 0)
	self
elsif (word.start_with?('a','e','i','o','u'))
	  word = word + 'way'
else
	for i in 0..word.length-1
		if(['a','e','i','o','u'].include? word[i])
			word = word[i..-1]+word[0..i-1]+'ay'
			break
		end
		if (i==word.length-1)
			word = word+'ay'
		end
	end
end

puts word

