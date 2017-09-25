# ARGV-ify A Calculator

# Make a simple calculator script that can perform the 4 basic math operations (+, -, x, /) and augment it so you can do the following:

# $ ruby calc.rb 3 + 4
# 7
# Note, you’ll have to pass in the arguments in quotes because some characters have special meaning on the command-line. * for example means “every file in the current directory.” Probably not what you want to pass in as command-line arguments!

# Extra Credit: instead of building a simple calculator, build an RPN calculator!

def plus(i,j)
	i+j
end
def minus(i,j)
	i-j
end
def multiply(i,j)
	i*j
end
def divide(i,j)
	i/j
end

case ARGV[1]
when '+'
	puts plus(ARGV[0].to_i,ARGV[2].to_i)
when '-'
	puts minus(ARGV[0].to_i,ARGV[2].to_i)
when '*'
	puts multiply(ARGV[0].to_i,ARGV[2].to_i)
when '/'
	puts divide(ARGV[0].to_i,ARGV[2].to_i)
end
