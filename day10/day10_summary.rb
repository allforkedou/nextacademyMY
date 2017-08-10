#Modules vs Classes
module AnimalActions
	def communicate
		puts @sound
	end
end

class Dog
	include AnimalActions
	def initialize
		@sound = 'bark'
	end
end

class Cat
	include AnimalActions
	def initialize
		@sound = 'meow'
	end
end

dog = Dog.new
dog.communicate
cat = Cat.new
cat.communicate

csv.parse csv method for ruby

#Polymorphism
#It means being able to send the same message to different objects
#Few ways to achive
#1. Inheritance
class Mammal  
  def breathe  
    puts "inhale and exhale"  
  end  
end  
  
class Cat < Mammal  #Inheritance happens here
  def speak  
    puts "Meow"  
  end  

  def breathe
  	puts 'oi'
  end
end  
  
rani = Cat.new  
rani.breathe #<-- The breathe method in Cat will overwrite the one in Mammal 
rani.speak 

#2. Duck typing
class Duck  
  def quack  
    'Quack!'  
  end  
  
  def swim  
    'Paddle paddle paddle...'  
  end  
end  
  
class Goose  
  def honk  
    'Honk!'  
  end  
  def swim  
    'Splash splash splash...'  
  end  
end  
  
class DuckRecording  
  def quack  
    play  
end  
  
  def play  
    'Quack!'  
  end  
end  
  
def make_it_quack(duck)  
  duck.quack  
end  
puts make_it_quack(Duck.new)  
puts make_it_quack(DuckRecording.new)  
  
def make_it_swim(duck)  
  duck.swim  
end  
puts make_it_swim(Duck.new)  
puts make_it_swim(Goose.new)  

#Problems with Inheritance
#1. Can inherit too much
#2. Can only inherit from one class

#Composition solves this making objects composed of other objects

#3.Composition
class laptop
	def initialize
		@screen = Screen.new
		@keyboard = Keyboard.new
	end
end

#Law of Demeter
class Employee
	def request_raise
		@company.send_raise_request
	end
end

class BMCompany
	def send_raise_request
		#send to hr department
		#send to ceo directly
	end
end

class HPCompany
	def send_raise_request
		#send to ceo directly
end

# Summary
# 1.Polymorphism
# 	Same message, different objects, different results
# 2.Inheritance
# 	Parent and children Classes
# 3.Duck typing
# 	If it quacks like a duck, it is a duck
# 4.Composition
# 	Objects composed of other objects
# 5.Encapsulation
# 	Create private method to ensure privacy
# 6.The Law of Demeter
# 	Avoid chaining methods

# How can I put cursor on every line in Sublime Text?

# Four steps:

# Select all the text: CTRL A
# Activate multi-cursors: CTRL (or CMD on Mac) SHIFT L
# Press the Home key to move all cursors to the front of the line
# Press the " quote key to insert the quote.
# Using the Home End and CTRL + left | right arrow keys is handy when managing multiple cursors.

#Link to read about standard streams
#https://en.wikipedia.org/wiki/Standard_streams

#CTRL+L to clear irb or terminal screen

# load is used when you want to import a file irrespective of whether it has been already imported. require or require_relative is used when you want to import a file only if it has not been already.

# From this, it follows that the former is used when the imported file is the object of analysis (data file), whereas the latter is used to provide some features to be used in the program (part of the program, library, framework).

# While require can only handle paths relative to $:, require_relative is an extension that can handle paths relative to current directory as well. require_relative is a superset of require, and require can be dispensed (although require_relative is written using require, so it has to be rewritten if require is to be dispensed).

#Useful codes from racer_utils.rb
# Use "reputs" to print over a previously printed line,
# assuming the cursor is positioned appropriately.
def reputs(str = '')
  puts "\e[0K" + str
end

# Clear the screen
def clear_screen!
  print "\e[2J"
end

# Moves cursor to the top left of the terminal
def move_to_home!
  print "\e[H"
end

#Fill an array with the same element 5 times
Array.new(5, str)
# => [1234, 1234, 1234, 1234, 1234]