#<< is like push, except it only takes a single object
array = []
(1..10).each do |i| 
  array << i
end

p (1..10).to_a
p ("a".."z").to_a
p ("A".."Z").to_a