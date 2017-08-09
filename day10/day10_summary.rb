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