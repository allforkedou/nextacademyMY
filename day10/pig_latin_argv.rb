# Iteration 1: Converting one word to Pig Latin
def convert_word_to_pig_latin(word)
	if (word.nil?)
		return ""
	end
	index = (word.downcase =~ /[aeiou]/)
	if (index.nil? || index==0)
		return word
	else
		return word[index..-1]+word[0..index-1]+'ay'
	end
end

# Iteration 2: Converting sentences to Pig Latin (Optional)
def convert_sentence_to_pig_latin(sentence)
	pig_sentence = ''
	words = sentence.split(/\W+/)
	rubbish = sentence.split(/\w+/)
	for i in (0..words.length)
		pig_sentence += rubbish[i].to_s + convert_word_to_pig_latin(words[i]) 
		#put rubbish at first because it has empty string
	end
	return pig_sentence
end

puts convert_sentence_to_pig_latin(ARGV.join(" "))