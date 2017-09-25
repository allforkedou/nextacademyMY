# Implement an iterative version of the factorial function
def factorial_iterative(n)
	factorial = 1
	if (n==0)
		#do nothing
	else
		n.downto(1){|i| factorial=factorial*i}
	end
	return factorial
end

# Implement a recursive version of the factorial function
def factorial_recursive(n)
	if (n==0)
		return 1
	else
			return n*factorial_recursive(n-1)
	end
end

puts factorial_iterative(9)
puts factorial_recursive(9) 
# == 362880