#<< is like push, except it only takes a single object
array = []
(1..10).each do |i| 
  array << i
end

p (1..10).to_a
p ("a".."z").to_a
p ("A".."Z").to_a

# Explore the following array methods

# 1. length

# 2. index

# 3. join
array = ["a", "b", "c"]
array.join        #=> "abc"
array.join("-")   #=> "a-b-c"

# 4. include?
array.include?("a")

# 5. empty?
[].empty?
# 6. sample
a = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
a.sample         #=> 7
a.sample(4)      #=> [6, 4, 2, 5]
# 7. transpose
a = [[1,2], [3,4], [5,6]]
a.transpose   #=> [[1, 3, 5], [2, 4, 6]]
# 8. sort
a = [ "d", "a", "e", "c", "b" ]
a.sort                    #=> ["a", "b", "c", "d", "e"]
a.sort { |x,y| y <=> x }  #=> ["e", "d", "c", "b", "a"]

#parallel assignment
a, b = 1, 2
#=> [1, 2]
a
#=> 1
b
#=> 2

list = [1,2,3,4]
#=> [1,2,3,4]
head, *tail = list
#=> [1,2,3,4]
head
#=> 1
tail
#=> [2,3,4]

list # is not modified
#=> [1,2,3,4]

head, *tail = []
#=> []
head
#=> nil
tail
#=> []

numbers = [1, 2, 3, 4]
double_numbers = numbers.map do |number|
	2 * number
end

#Destructive methods
#With !(exclamation point), you will change the original values

# 1. Create a string and explore the methods reverse vs reverse!
s = 'PPAP'
p s.reverse
p s #PPAP
p s.reverse!
p s #PAPP

# 2. Create a string and explore the methods slice vs slice!
s = 'PPAP'
p s.slice(2..3)
p s #still PPAP
p s.slice!(2..3)
p s #left PP

# 3. Create an array and explore the methods shuffle vs shuffle!
arr = (1..10).to_a
p arr.shuffle
p arr
p arr.shuffle!
p arr

# 4. Create an array and explore the methods select vs select!
arr = (1..10).to_a
p arr.select{|x| x.even?}
p arr
p arr.select!{|x| x.even?}
p arr

%w(foo bar) #is a shortcut for ["foo", "bar"]
%w[ant bear cat].all? { |word| word.length >= 3 } #=> true
%w[ant bear cat].all? { |word| word.length >= 4 } #=> false
[nil, true, 99].all?                              #=> false
[].all?                                           #=> true