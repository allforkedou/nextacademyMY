# Your code here to sort the array
def dictionary_sort(array)
	puts 'Congratulations! Your dictionary has '+ array.length.to_s+ ' words:'
	array = array.sort
	array.each {|x| puts x}
end

# ...your code here to initialize the program and take user input
def run
	arr = []
	puts 'Type a word:'
	word = gets.chomp.downcase
	while(word != '')
		if (!word.is_a?(String))
			#do nothing
		elsif (arr.include? word)
			#do nothing
		else
			arr << word
		end
		puts 'Type another word (or press enter to finish):'
		word = gets.chomp.downcase
	end
	dictionary_sort(arr)
end
run
