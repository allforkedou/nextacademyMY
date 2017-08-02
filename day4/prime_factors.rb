#Return the prime factors of n, and 1 is not considered a prime number.
require "prime"
def prime_factors(n)
	factors = []
	primes_double = Prime.prime_division(n)
	primes_double.each do |primes|
		for i in 0..primes[1]-1
			factors << primes[0]
		end
	end
	return factors
end

#Testcases
p prime_factors(8)
p prime_factors(1)
p prime_factors(2)