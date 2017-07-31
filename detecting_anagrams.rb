def canonical(word)
  w = word.downcase.chars.sort.join
  return w
end

def is_anagram?(word_one, word_two)
		return canonical(word_one)==canonical(word_two)
end

#testcase
p is_anagram?('happy', 'yppah')