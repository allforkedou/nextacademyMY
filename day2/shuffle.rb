def shuffle(array)
	#Only loops, arrays, rand or Array#sample are allowed
  # Implement the shuffle method
  return array.sample(array.length)
end


# Driver code:
sorted_array = (1..10).to_a

# This should print a different sequence of numbers each time
p shuffle(sorted_array)
p shuffle(sorted_array)
p shuffle(sorted_array)
