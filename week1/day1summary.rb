def user_details(name, occupation)
  "Hi! My name is #{name} and I am a #{occupation}."
end

######
# Call the method
user_name = "Glo"
user_occupation = "Lecturer"
p user_details(user_name, user_occupation)

puts "Interpolation works in double quoted strings: #{1 + 2}."
puts 'And it does not work in single quoted strings: #{1 + 2}.'
#results
# Interpolation works in double quoted strings: 3.
# And it does not work in single quoted strings: #{1 + 2}.

puts "Love ".+("Coding")
# This will printout "Love Coding". 
# This is another way to concatenate strings. This example uses the strict syntax. 

first = "Fat " 
second = "fluffy sheep"
#The results are all the same
puts first + second
puts first.+(second)
puts first.concat(second)

# .to_s  => convert to string
# .to_i => convert to integar
# .to_f => convert to float
# .to_sym => convert to symbol

# Hashes use {:key => value} or {key: value}

a = "mouse"
b = "mouse"
c = :mouse
d = :mouse
puts a==b
puts c==d
'Only c==d will return true'

#"irb" is used in command window to proc ruby to run

# puts vs print vs p
puts 1, 2, 3
#result
# 1
# 2
# 3

print 1, 2, 3
#result
#123

p 1, 2, 3
#result
# 1
# 2
# 3
# => [1, 2, 3]

#Integer Methods
# even?
2.even?
# odd?
2.ood?
# next
-1.next #return value+1
# round
27.5.round(-1) #will round to 30
7.25.round(1) #will round to 7.2
# upto
5.upto(9){|i| print i} #98765
# downto
9.downto(7){|i| print i} #987
# times
5.times{|i| puts i}

#String Methods
# 1. + and *

# 2. capitalize, upcase, downcase
	pm_MY = 'NajiB'
	puts pm_MY.capitalize
	puts pm_MY.upcase
	puts pm_MY.downcase
# 3. count 
#stupid method, not good to find char
#Use this instead: can(/o/).count  # => 2
a = "hello world"
a.count "lo"            #=> finds 5 instances of either "l" or "o"
a.count "lo", "o"       #=> the intersection of "lo" and "o" is "o", so it finds 2 instances
a.count "hello", "^l"   #=> the intersection of "hello" and "everything that is not "l" finds 4 instances of either "h", "e" or "o"
a.count "ej-m"          #=> finds 4 instances of "e", "j", "k", "l" or "m" (the "j-m" part)

# 4. include?
a.include?('ll') #will return true
# 5. length

# 6. ljust

# 7. slice

a = [0,1,2,3,4,5,6,7,8,9]

b = a.slice( 2,2 )

puts "slice:"
puts "  a = " + a.inspect
puts "  b = " + b.inspect

b = a.slice!(2,2)
puts "slice!:"
puts "  a = " + a.inspect
puts "  b = " + b.inspect

slice: #a remains the same
  a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  b = [2, 3]
slice!: #will take out the combo from a
  a = [0, 1, 4, 5, 6, 7, 8, 9]
  b = [2, 3]


a[3..6] #Use this method instead, will give 'lo w'
# 8. reverse
'najib'.reverse #will give bijan
# 9. index and []
"hello".index('lo') #will return 3

#gsub
value = "abc abc"
puts value

# Sub replaces just the first instance.
value = value.sub("abc", "---")
puts value

# Gsub replaces all instances.
value = value.gsub("abc", "---")
puts value

# Output

# abc abc
# --- abc
# --- ---

#Convert words using index and [], slice and gsub is prohibited
def manipulate(string,letter)
  index = string.index(letter)
  string[index] = (string[index]).upcase
  puts string
end

manipulate('najib','i')

#Loops in Ruby
#for, whiule, until

