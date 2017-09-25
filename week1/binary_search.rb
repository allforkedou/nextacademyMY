# Place your solutions here
# Implement a method named binary_search
# Your first task is to write a method that takes a target number and 
# a sorted array of numbers in non-decreasing order and 
# returns either the position of the number in the array, or 
# -1 to indicate the target number is not in the array. 
# For instance, binary_search(32, [13, 19, 24, 29, 32, 37, 43]) should return 4, 
# since 32 is the fourth element of the array (counting from zero). 
# Start with pseudocode! What are the steps? What’s the end case? 
# Spell it out before jumping into Ruby. 
# You can’t use Array#index. Sorry. 
# The point is to build a binary search from scratch, not use Ruby’s built in search methods. 
# Also, don’t use Array#.include?.
def binary_search(num, arr)
	return search(0,arr.length-1, num, arr)
end

def search(startpt,endpt, num, arr)
	m = (startpt+endpt)/2
	if (num==arr[m])
		return m
	elsif (startpt==endpt)
		return -1
	elsif(num<arr[m])
		return search(startpt,m-1, num, arr)
	else
		return search(m+1,endpt, num, arr)
	end
end

test_array = (100..200).to_a
puts binary_search(135, test_array) == 35
# => true

test_array = [13, 19, 24, 29, 32, 37, 43]
puts binary_search(35, test_array) == -1
# => true