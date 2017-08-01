# example.rb

# 1. Checking for a credit card number pattern using regex /\d{4}-\d{4}-\d{4}-\d{4}/ 
puts "Example 1:"
p "1234-1234-1234-1234" =~ /\d{4}-\d{4}-\d{4}-\d{4}/ 
# => this will return the starting position of the match

# 2. Checking for a credit card number pattern using regex /\d{4} - \d{4} - \d{4} - \d{4}/ 
puts "Example 2:"
p "1234-1234-1234-1234" =~ /\d{4} - \d{4} - \d{4} - \d{4}/ 
# => this will return nil because there should not be any spaces between the digits and the dashes in the regex 

# 3. Checking for alphabets of either case (upper/lowercase) within a string using regext /[a-zA-Z]/
puts "Example 3:"
p "WA 7317 B" =~ /[a-zA-z]/
# => this will return 0 since the first match happened at index 0

# 4. Checking for alphabets of either case (upper/lowercase) within a string using regext /[a-zA-Z]/
puts "Example 4:"
p "7317 ABcdE " =~ /[a-zA-z]/
# => this will return 5 since the first match happened at index 5 

# 5. Checking for alphabets of either case (upper/lowercase) within a string using regext /[a-zA-Z]/
puts "Example 5:"
p "7317" =~ /[a-zA-z]/
# => this will return nil since there are no alphabets in the given string

# 6. Checking for digits in a string
puts "Example 6a:"
p "I wish I had 1 million dollars!" =~ /\d/
p "I wish I had 1 million dollars!" =~ /1/
# => this will return the position of 1

puts "Example 6b:"
p "I wish I had 1 million dollars!" =~ 1
# => but this will return nil. When using the match operator, a regex must be used for pattern matching

# 7. Replace all vowels in a string with the character "*" 
puts "Example 7:"
p "hello".gsub(/[aeiou]/, '*')                  
# => this will return "h*ll*"

# 8. Given the string "12-34-56", substitute the middle portion with "*":
puts "Example 8:"
string = "12-34-56"
p string.gsub(/(\d{2})-\d{2}-(\d{2})/, '\1-**-\2')

# 9. Given the strings "12-34-56, 98-76-54", substitute the middle portion with "*":
puts "Example 9:"
string = "12-34-56, 98-76-54"
p string.gsub(/(\d{2})-\d{2}-(\d{2})/, '\1-**-\2')

# 10. Replace any non-word characters in a string with *A*:
puts "Example 10:"
string = "name@example.com"
p string.gsub(/\W/, "A")