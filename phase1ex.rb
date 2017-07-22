# Q1
# 1. Assign the value 10 to a variable. Call the variable num_of_students.
# 2. Create an array with two types of fruits stored inside and call this array as fruits.
# 3. Define a variable called sentence and assign the string "How are you?" to it.
num_of_students = 10
fruits = ['apple','durian']
sentence = 'How are you?'

# #Q2
# Declare a variable called "animals". This variable should: 
# 1. Be a hash.
# 2. Store an animal as the key, for example, cat.
# 3. Store the corresponding animal's number of legs as the value. In this case, the value for "cat" will be 4.
animals = {'cat'=>4}
puts animals['cat']

# Q3
# Using the square brackets [ ] and the methods puts/p, display the following elements of the given array in the console:
    # orange
    # strawberry
array = ["apple", "orange", "banana", "strawberry", "grapes", "pineapple", "avocado", "dragon fruit"]
puts array[0]
puts array[3]

# Q4
# Using the iterator each, loop through the given array. For each string in the array, display the string in reverse order, i.e. your code should print out: 
cars =  ['Toyota', 'Mitsubishi', 'Honda']
cars.each{|car| puts car.reverse}

# Q5
# Write an if-else statement for the following scenario:
# If the "user_input" string variable contains all uppercase characters, the terminal will print "You are shouting";
# Else if "user_input" string variable contains all lowercase characters, the terminal will print "I love Ruby";
# For all other types of input, the terminal will print "You are neutral".
user_input = gets.chomp
if(user_input == user_input.upcase)
	puts 'You are shouting'
elsif(user_input == user_input.downcase)
	puts 'I love Ruby'
else
	puts 'You are neutral'
end

# Q6
# 1. Read the following documentation and learn how to use the "length" method to get the length of the given array:
# https://docs.ruby-lang.org/en/2.0.0/Array.html#method-i-length
# 2. Choose another method from the documentation and use it on the array.
array = [2, 3, 4, 5]
array.length
array.rindex{|x| x==5}

# Q7
# Iterate through the given array and display only the names of the students. Your result should be:
# Amy
# David
# Zoe
math_test_scores = [["Amy", 99], ["David", 65], ["Zoe", 85]] 
math_test_scores.each{|score| puts score[0]}

# Q8
# Define a method called "sum". This method must: 
# 1. Accept TWO numbers as arguments.
# 2. Sum up both numbers and return the answer. 
# For example, 
# If I call `sum(2, 5)`, it should return 7.
# If I call `sum(3, 2)`, it should return 5.
def sum(num1,num2)
	return num1+num2
end

# Q9
# Define a method called check_vowel. The method should:
# 1. Take in an alphabet as its argument.
# 2. If the alphabet is a vowel (a,e,i,o,u), return that alphabet.
# 3. If the alphabet is NOT a vowel, return the value 0.
# Remember to check that your method works by calling the method after definition with some test examples. 
# For example, you can test your method as follows:
# p check_vowel("a")
# p check_vowel("b")
def check_vowel(x)
	if(x.start_with?('a','e','i','o','u'))
		return x
	else
		return 0
	end
end

# Q10
 # The given code has several errors. Make the necessary corrections to:
    # Line 2
    # Line 7
    # Line 8
    # Line 9
# If the corrections are done correctly, the value 9 should be displayed in the terminal. 
# def cool_math(x, y)
   # 3x + y
# end
# #############################
# #Driver code:
# a = "2"
# b = 3
# puts cool_maths(a, b)

def cool_math(x, y)
   return 3*x + y
end

#############################
#Driver code:
a = 2
b = 3
puts cool_math(a, b)



     