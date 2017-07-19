class Die
	def initialize
		roll
	end
	
	def roll
		@showNumber = 1+rand(6)
	end
	
	def show
		puts 'You rolled: '+@showNumber.to_s
	end
	
	def cheat(i)
		if(i<1 || i>6)
			puts 'You are too stupid to cheat.'
		else
			@showNumber = i.to_i
		end
	end
end

dice = Die.new
puts 'Are you ready to roll or ...?'
ans = gets.chomp
if(ans.downcase == 'cheat')
	puts 'What # do you want to set to?'
	num = gets.chomp.to_i
	dice.cheat(num)
else
	dice.roll
end

puts dice.show