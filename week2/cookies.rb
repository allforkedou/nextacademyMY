# Cookies And Oven
# I <3 Cookies is a bakery that makes delicious cookies. They are growing rapidly, and they need some software to help them manage their kitchen.

# Your job is to build a program that will help them manage their cookie baking. Here are a few user stories to help get you started:

# As a baker, I want to make different types of cookies (peanut butter, chocolate chip, etc.).
# As a baker, I want to place batches of cookies in an oven.
# As a baker, I want to know when a batch of cookies is ready to be removed from the oven.
# The point of this challenge is to exercise your object-oriented design muscles. It’s time to apply the concepts that you have learnt in previous challenges over here. Are you up for it? 

# Objectives
# Design the structure

# Think about this problem critically before you even begin to write code and describe how you would design the program in plain English.

# At the very least, consider these questions in your answer:

# What are essential classes?
# What attributes will each class have?
# What interface will each class provide?
# How will the classes interact with each other?
# Which classes will inherit from others, if any?
# Step 1: MVP

# Implement a minimum viable product.

# It does not need to track multiple types of cookies, but you should be able to move cookies into and out of an oven.

# Step 2: Additional Features

# Add more features to your program.

# Multiple types of cookies, each with a different baking time
# Status attribute for cookies, with at least these possible values: :doughy, :almost_ready, :ready, :burned
# Step 3: Refactor

# Take a step back and look at the code you’ve produced. Run through a checklist to see if you are following the principles of object-oriented design:

# Is it DRY (Don’t Repeat Yourself)?
# Do your classes follow the Law of Demeter?
# Are your classes orthogonal?
# Do you expose only the minimum amount of surface area for each object?
# The Law of Demeter can be summarized as follows:

# For all classes C. and for all methods M attached to C, all objects to which M sends a message must be instances of classes associated with the following classes:

# The argument classes of M (including C).
# The instance variable classes of C.
# (Objects created by M, or by functions or methods which M calls, and objects in global variables are considered as arguments of M.)

# Read Avdi Grim’s post for a more thorough explanation.

# Get Creative!
# Put yourself in the baker’s shoes, and imagine what other features you might like to have. Then pick the most useful and feasible one and build it out.

# Answer These Questions:

# - What are essential classes?
# - What attributes will each class have?
# - What interface will each class provide?
# - How will the classes interact with each other?

class Cookie
	attr_accessor :type, :baking_time, :status
	def initialize(type, baking_time)
		@type = type
		@baking_time = baking_time
		@status = :doughy
	end
end

class Oven
	attr_accessor :timer
	def initialize
		@timer = 0
	end

	def bake(cookie, time_to_bake)
		@timer = time_to_bake
		if (timer>cookie.baking_time)
			cookie.status = :burnt
		elsif (timer == cookie.baking_time)
			cookie.status = :ready
		elsif (timer >= cookie.baking_time/2 and timer < cookie.baking_time)
			cookie.status = :almost_ready
		else
			cookie.status = :doughy
		end
	end
end

#Testcases
chocolate_chip = Cookie.new('Chocolate Chip', 10)
p chocolate_chip.type
p chocolate_chip.baking_time
p chocolate_chip
oven = Oven.new
oven.bake(chocolate_chip,12)
p chocolate_chip
oven.bake(chocolate_chip,10)
p chocolate_chip
oven.bake(chocolate_chip,6)
p chocolate_chip
oven.bake(chocolate_chip,1)
# p chocolate_chip