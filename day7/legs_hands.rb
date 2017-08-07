class Person
	attr_accessor :legs, :hands
	@@legs = 2
	@@hands = 2

	def initialize(name)
		@name = name
	end

	def lose_leg
		@@legs -= 1
	end

	def show_legs
		p @@legs
	end
end

john = Person.new('John')
snow = Person.new('SNow')
john.lose_leg
john.show_legs
snow.show_legs

#both will have 1 leg, cause @@legs is class variable.