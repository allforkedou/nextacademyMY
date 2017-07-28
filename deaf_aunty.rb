#Deaf Aunty Rules
#If you don't shout, she shout right back "HUH?! SPEAK UP, SANDRA!"
#if you shout, she will misunderstand and shout back "NO, WE CANNOT DO THAT!"
#She won't let you go until you say "I love ya, aunty, but I've got to go." 
#Getting Creative Optional: 
#1. hug
#2. Aunty's behavior changed depending on mood, happy in morning, angry at night.
#3.Aunty wants to pinch your cheeks everytime you visit.

def deaf_aunty
  	while(true)
		conversation = gets.chomp
		if (conversation == 'I love ya, aunty, but I\'ve got to go.')
      puts 'Aunty allows you to leave.'
			break
		elsif (conversation == conversation.upcase)
			puts 'NO, WE CANNOT DO THAT!'
		else
			puts 'HUH?! SPEAK UP, SANDRA!'
		end
	end
end
