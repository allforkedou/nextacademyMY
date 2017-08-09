# Design Drill: Classical Inheritance
# Inheritance is a design pattern that can be found in almost every modern programming language in some form or another.

# If you’re not sure why inheritance is important or useful, just think about why we have DNA. 

# Here’s a simple explanation from Programming Ruby (a.k.a. the Pickaxe):

# Inheritance allows you to create a class that is a refinement or specialization of another class. This class is called a subclass of the original, and the original is a superclass of the subclass. People also talk of child and parent classes.The basic mechanism of subclassing is simple. The child inherits all of the capabilities of its parent class—all the parent’s instance methods are available in instances of the child.
# Additionally, you may want to read about class inheritance in Ruby to get a sense for how it works.

# Objectives
# A bunch of animals

# Define 7 empty classes: Animal Mammal, Amphibian, Primate, Frog, Bat, and Chimpanzee.

# Set up an inheritance structure that makes sense given the phylogenetic position of the animal in relation to the others.

# Add some properties

# Add instance variables and methods to your different classes. These could include things like @num_legs or warm_blooded?. Make up your own.

# The write a script to prove that your inheritance structure works. If you assign @num_legs = 2 in the Primate class, does an instance of Chimpanzee have the same variable and value?

# Hint: you may have to define some reader methods.

# Extra Credit: Super powers with a Module

# This objective is really just for fun.

# Create a module SuperPowers with some crazy (and perfectly useless) features like a use_laser_vision method and a magic_points reader and writer method.

# Then use your module as a mixin for one or more of your classes.

# Start coding here.
class Animal
	attr_accessor :num_legs, :warm_blooded
	def initialize
		@num_legs = 0
		@warm_blooded = false
	end

	def warm_blooded?
		return @warm_blooded
	end

end

class Mammal < Animal
	def initialize
		@warm_blooded = true
	end
end

class Amphibian < Animal
	def initialize
		@warm_blooded = false
	end
end

class Primate < Mammal

end

class Frog < Amphibian
	
end

class Bat < Mammal
	
end

class Chimpanzee < Mammal
	
end

ppap = Mammal.new
p ppap.warm_blooded?
ppap = Frog.new
p ppap.warm_blooded?
# p Amphibian.warm_blooded?
# p Frog.warm_blooded?
# p Bat.warm_blooded?

