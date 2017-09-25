# TODO: Refactor for elegance
def shout_backwards(string)
  return string.upcase.reverse + "!!!"
end


# FIXME: This is convoluted. Refactor for clarity.
# def squared_primes(array)
#   array.find_all{|x| 
#     (2..x-1).select(){|i| x % i == 0 }
#     .count == 0 }.map{|p| p*p}
# end

def squared_primes(array)
	primes = []
	array.each do |x|
		if ((2..x-1).all? {|i| x%i != 0})
			primes << x
		end
	end
	return primes.map{|prime| prime**2}
end

# Driver code... don't edit. This should print a bunch of trues.
puts shout_backwards("hello, boot") == "TOOB ,OLLEH!!!"
puts squared_primes([1, 3, 4, 7, 42]) == [1, 9, 49]