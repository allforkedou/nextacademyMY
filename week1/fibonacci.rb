#Take an integer n as input and returns the nth Fibonacci number

def fibonacci_iterative(n)
	fib = 0
	fib_a = 0
	fib_b = 1
	if(n==0)
		return fib_a
	elsif(n==1)
		return  fib_b
	else
		for i in 0..n-2
			fib = fib_a+fib_b
			fib_a = fib_b
			fib_b = fib
		end
		return fib
	end
end

def fibonacci_recursive(n)
	if(n==0)
		return 0
	elsif(n==1)
		return 1
	else
		return fibonacci_recursive(n-1)+fibonacci_recursive(n-2)
	end
end

p fibonacci_iterative(0) == 0
p fibonacci_iterative(1) == 1
p fibonacci_iterative(2) == 1
p fibonacci_iterative(3) == 2
p fibonacci_iterative(4) == 3
p fibonacci_iterative(5) == 5

p 'iterative vs. recursive'

p fibonacci_recursive(0) == 0
p fibonacci_recursive(1) == 1
p fibonacci_recursive(2) == 1
p fibonacci_recursive(3) == 2
p fibonacci_recursive(4) == 3
p fibonacci_recursive(5) == 5