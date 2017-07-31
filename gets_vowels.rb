def get_vowels(array)
  # write your code here
  vowels = ['a','e','i','o','u']
  arr = []
  array.each do |x|
  	if(vowels.include? x)
      arr<<x
	end
  end
  return arr
end

########################
array = ["a", "b", "c"]
p get_vowels(array)