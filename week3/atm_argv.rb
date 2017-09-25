# ARGV-ify An ATM

# Now that you are more acquainted with ARGV, let’s ARGV-ify an ATM. In your code, set your bank balance to be 10 dollars. Then using ARGV, allow the user to add, withdraw, and check bank balance. An example is as follows:

# $ ruby atm.rb add 10
# Your balance is now 20 dollars.

# Note that you will now need to pass in two arguments in the command line. How would you do that? By the way, for this exercise, don’t worry about using classes. Just keep it simple.

# Save your file under atm.rb and check if it passes the tests!
@balance = 10
def add(amount)
	@balance += amount
	check
end
def withdraw(amount)
	@balance -= amount
	check
end
def check
	puts 'Your balance is now '+@balance.to_s+' dollars'
end

case ARGV[0]
when 'add'
	add(ARGV[1].to_i)
when 'withdraw'
	withdraw(ARGV[1].to_i)
end
