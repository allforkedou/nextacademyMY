count = 0
while (count<3)
	question = gets.chomp
	if (question != 'BYE')
		count = 0
		if(question != question.upcase)
			puts 'HUH! SPEAK UP, SONNY!'
		else
			puts 'NO, NOT SINCE ' + rand(1930..1950).to_s + '!'
		end
	else
		count += 1
		puts 'Huh...?'
	end
end
puts 'Ok, you said "BYE" three times'

 # Write a Deaf Grandma program. Whatever you say to grandma (whatever you type in), she should respond with HUH?!  SPEAK UP, SONNY!, unless you shout it (type in all capitals). If you shout, she can hear you (or at least she thinks so) and yells back, NO, NOT SINCE 1938! To make your program really believable, have grandma shout a different year each time; maybe any year at random between 1930 and 1950. (This part is optional, and would be much easier if you read the section on Ruby's random number generator at the end of the methods chapter.) You can't stop talking to grandma until you shout BYE.
# Hint: Don't forget about chomp! 'BYE'with an Enter is not the same as 'BYE' without one!
# Hint 2: Try to think about what parts of your program should happen over and over again. All of those should be in your while loop.
# Extend your Deaf Grandma program: What if grandma doesn't want you to leave? When you shout BYE, she could pretend not to hear you. Change your previous program so that you have to shout BYE three times in a row. Make sure to test your program: if you shout BYE three times, but not in a row, you should still be talking to grandma. 