def canonical(word)
  w = word.downcase.chars.sort.join
  return w
end

def is_anagram?(word_one, word_two)
		return canonical(word_one)==canonical(word_two)
end

def anagrams_for(word, arr_words)
	canon = canonical(word)
	hash = {}
	hash[canon] = []
	for i in 0..arr_words.length-1
		if(is_anagram?(word, arr_words[i]))
			hash[canon] << arr_words[i]
		end
	end
	return hash[canon]
end

#Testcase
p anagrams_for('happy', ['pyahp','yapph','ppap','HAPYP'])