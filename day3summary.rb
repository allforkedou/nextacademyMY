#Enumerables: reduce and inject are the same
# Sum some numbers
(5..10).reduce(:+)                             #=> 45
# Same using a block and inject
(5..10).inject { |sum, n| sum + n }            #=> 45
# Multiply some numbers
(5..10).reduce(1, :*)                          #=> 151200
# Same using a block
(5..10).inject(1) { |product, n| product * n } #=> 151200
(5..10).inject {|sum, n| sum + n } #=> 45# Multiply some numbers
(5..10).inject(1) {|product, n| product * n } #=> 151200# find the longest word
longest = %w{ cat sheep bear }.inject do |memo,word|
  memo.length > word.length ? memo : word
end
longest #=> "sheep"# find the length of the longest word
longest = %w{ cat sheep bear }.inject(0) do |memo,word|
  memo >= word.length ? memo : word.length
end
longest #=> 5
# find the longest word
longest = %w{ cat sheep bear }.inject do |memo, word| 
	#memo takes first index, word takes second index
	#next, memo takes second index, word takes third index
	puts 1 #this will run 2 times
   memo.length > word.length ? memo : word
end
longest#=> "sheep"