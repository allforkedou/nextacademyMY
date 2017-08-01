# Fill in the methods below with your solution.
# Do not change the method names

# Script: CONVERT TO PIG LATIN

# Iteration One: CONVERT SINGLE WORD

# GET a word from user input
# IF the word starts with a vowel, don't change it
# ELSE replace the word with its pig latin equivalent
#   GET all of the consonants before the first vowel in the word
#   SET the consonants at the end of the word and add the suffix "ay"
# ENDIF
# PRINT the pig-latin-ified word

# Iteration Two: CONVERT COMPLETE SENTENCE

# GET a sentence from user input
# FOR each word in the sentence
#   CONVERT SINGLE WORD
# ENDFOR
# PRINT the converted sentence
# DISPLAY the number of words converted

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
	end
	return pig_sentence
end

#Testcases
p convert_sentence_to_pig_latin("PPAP is pen pineapple apple pen")
p convert_sentence_to_pig_latin("PPAP !! is $$ pen pineapple apple pen")

