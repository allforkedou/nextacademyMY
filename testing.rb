# An example of a destructive method for arrays:

# Create an array of integers and store it in a variable called numbers

numbers = [1, 2, 3, 4]
puts "Create an array:"
p numbers

# First, let's use the method "map" to create a NEW array where each number is doubled

double_numbers = numbers.map do |number|
	2 * number
end

# ps: notice how we used "numbers" (plural) to denote the array, and when we iterate through the array, 
# we use "number" (singular) to denote that it is only one object? That's also one way to improve code readability! :)

# Output the new array created
puts "Created a new array using the method map. This new array is named as 'double_numbers':"
p double_numbers

# Output the original array
puts "This is the original stored in the variable 'numbers':"
p numbers

# Now, let's use the method "map!" to change the values of each element in the array 'numbers'
numbers.map! do |number|
	2 * number
end


# Output the 'numbers' array
puts "The values in the array 'numbers' has now been changed, and the variable 'numbers' is no longer assigned to [1, 2, 3, 4], it is now:"
p numbers

p dn