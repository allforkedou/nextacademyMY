# Ruby Flashcards: Single Deck
# Let’s build a simple flashcard game in Ruby with a command-line interface. Here is an example of one possible implementation:

# $ ruby flashcards.rb
# Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition. Ready? Go!

# Definition
# A file format in which values are delimited by commas.

# Guess: YAML
# Incorrect! Try again.

# Guess: XML
# Incorrect! Try again.

# Guess: CSV
# Correct!

# Definition
# # and so on ...
# Objectives
# Design Your Data Model and Control Flow

# You might already have a clear picture of how to design your program, but it is always a good idea to articulate your concept using pseudocode, wireframes, or another modeling tool. You should be able to draw or write out a rough sketch of both the data model and the control flow of the program.

# This stage should take at most 15-20 minutes. If you’re spending more than that, find a staff member to get you unstuck.

# Some questions to consider:

# Do you fully understand the logic of the game?
# What classes (state and behavior) do you need?
# What are the responsibilities of each class? Are they single responsibilities?
# Which methods should be public? Which should be private?
# Once you have a plan in place, create the skeletal file structure for your app.

# Find a staff member or another student and get their opinion on your overall structure.

# Cards in a file

# The next step is to answer the question of where the cards will come from. Provided to you is a file called flashcard_samples.txt, which demonstrates a supremely basic way to store the card data (definition on one line, term on the next, and then a blank line to separate the two). In other words, the file looks like:

# definition1 definition1 definition1 etc.
# term1 term1 term1 etc.

# definition2 definition2 definition2 etc.
# term2 term2 term2 etc.
# You can use this same file format for your cards if you like, or you can create your own. Just don’t get too fancy. Remember, we’re keeping it simple.

# Core architecture

# Now that you’ve got a general sketch for your app design and some sample data to work with, it’s time to build out your app.

# Think carefully about how each piece of the puzzle should fit together. Build it out slowly and test as you go. Skip the user interface (the part of your program that will receive and respond to user input) for now. You can mock user input by creating having a method on one of your classes that takes a guess as an argument and performs the appropriate action. Later you can hook this up to real, live user input.

# Some questions to consider:

# How will you generate card objects from the source file?
# How will your classes interact?
# Where should the game logic live? What about the file parsing?
# Interface design

# By this point, you should have all of the core components of your application built out. In other words, your code should be an accurate model of the ingredients needed for a real-life flashcard game. Are you missing anything?

# Finally, it is time to implement the interactive part of the game: the piece that will actually let you play with it via your very-own custom interface.

# Think about what kinds of inputs and outputs your interface will handle and write the code to match for them.

# Some questions to consider:

# How should you check for whether the user’s answer is correct? Where should this logic live?

# Think about this:
# 1. What kind of classes do you need?
# 2. How can you link the question and answer?

# Start coding here.
# class ???
#   def initialize
#   end
# end

class Game
  def self.run
    # Your driver code should be here.
    deck = Deck.new('flashcard_samples.txt')
    puts 'Welcome to Ruby Flash Cards. To play, just enter the correct term for each definition. Ready? Go!'
   	puts
   	i = 0
   	while i != deck.cards.size
    	puts 'Definition'
    	puts deck.cards[i].definition
    	next_question = false
    	puts
    	while(!next_question)
    		print 'Guess: '
    		guess = gets.chomp
    		if (guess == deck.cards[i].term)
    			puts 'Correct!'
    			next_question = true
    			i += 1
    		else
    			puts 'Incorrect! Try again.'
    		end
    		puts
    	end
    end
    puts 'Congratulations you have completed all the cards in the deck!'
  end
end

class Deck
	attr_reader :file, :cards
	def initialize(file)
		@file = file
		@cards = nil
	end

	def cards
		return @cards if @cards
		parsed = []
		# File.read(file).squeeze("\n").split("\n")
		file_cleaned = File.read(@file).gsub(/\n+/,'\n')
		file_cleaned.split('\n').each_slice(2) do |arr|
			parsed << Card.new(arr[0],arr[1])
		end
		@cards = parsed
		return @cards
	end

end

class Card
	attr_reader :definition, :term
	def initialize(definition, term)
		@definition = definition
		@term = term
	end
end


Game.run