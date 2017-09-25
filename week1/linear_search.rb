# Implement the #linear_search method
random_numbers = [6, 29, 18, 2, 72, 19, 18, 10, 37]

# Implement the #global_linear_search method
bananas_arr = "bananas".split(//)

#Basic linear search, can't use Ruby's built-in methods except for Array#[], have to use while or until
def linear_search(obj, arr)
	index = nil
	for i in 0..arr.length-1
		if (arr[i] == obj)
			index = i
			break
		end
	end
	return index
end

p linear_search(18, random_numbers)
# => 2
p linear_search(9, random_numbers)
# => nil

def global_linear_search(obj,arr)
	index = []
	for i in 0..arr.length-1
		if (arr[i] == obj)
			index << i
		end
	end
	return index
end

bananas_arr = "bananas".split(//)
# => ["b", "a", "n", "a", "n", "a", "s"]
p global_linear_search("a", bananas_arr)
# => [1, 3, 5]
