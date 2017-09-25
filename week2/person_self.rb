class Person
	def initialize
	end

	def me
		p self
	end

	def self.species
		p self
	end

	def say_hi
		p 'Hello'
	end

	def hi_me
		self.say_hi
	end
end

person = Person.new

#person, Person, Person, person