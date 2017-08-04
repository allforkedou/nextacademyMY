# 4. Let's now write an instance method called take_order method that will print out: "Welcome! May I take your order please?"
class Waiter

	def initialize(name, gender, age)
		@name = name
		@gender = gender
		@age = age
	end

	def name
		@name
	end

	def gender
		@gender
	end

	def age
		@age
	end

	def age=(age)
		@age = age
	end

	def take_order
		puts "Welcome! May I take your order please?"
	end

end

tom_waiter = Waiter.new("Tom", "M", 21)
tom_waiter.take_order

# a. Run the code. What do you observe?

# b. Create another Waiter object and call the take_order method with this newly created object.
aki_waiter = Waiter.new("Aki", "F", 18)
aki_waiter.take_order