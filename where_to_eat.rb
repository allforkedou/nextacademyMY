# Rewrite the code from `example2.rb` using case statements.
def where_to_eat(money, time)
	case
	when money < 10 && time < 15
		puts "Go to 7-11 and get cup noodles."

	when money < 10 && time >= 15
		puts "Take a walk to the mixed rice store."

	when money >= 10 && time < 15
		puts "Wanna grab a pie?"

	else # money >= 10 && time >= 15 (we do not need to write this condition here)

		puts "How about some fish head noodles?"

	end
end

#######################
# Driver code

# money < 10 && time < 15
where_to_eat(5, 10)

# money < 10 && time >= 15
where_to_eat(10, 30)

# money >= 10 && time < 15
where_to_eat(15, 10)

# money >= 10 && time >= 15
where_to_eat(15, 30)