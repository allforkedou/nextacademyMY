# Ruby Todo: Core Features
# For this challenge, we will be building a single-user command-line ToDo application. From the user’s perspective, we want to build something that works like this (you will need to use ARGV here!): 

# $ ruby todo.rb add Bake a delicious blueberry-glazed cheesecake
# $ ruby todo.rb list
# $ ruby todo.rb delete <task_id>
# $ ruby todo.rb complete <task_id>
# Your text file (an example is included in the repo) will be simple. Just task descriptions each on their own line. Keep in mind that you will eventually have more information included, this is why we want you to use the CSV format.

# An example of task descriptions:

# Bake a delicious blueberry-glazed cheesecake
# Go play miniature golf with Mike Tyson
# Become a World-Class Developer
# This application has all the moving parts of an MVC (model-view-controller - you will learn more about this in Week 4) application: user input, display code, and data persistence. It’s important to think about what responsibilities this application has to fulfill.

# Keep things like the single responsibility principle and separation of concerns in mind as you decide what objects and classes belong in your application.

# You will be working on several iterations of the application. Each iteration will involve adding new commands and features. As you work through the iterations, pay close attention to how change impacts your application. When a new feature is added how many files do you have to change? How frustrating is it to make those changes?

# Objectives
# Enumerate the responsibilities

# Start by listing down the responsibilities of your ToDo application. These aren’t just the user-facing commands like “add”, “delete”, etc. They’re also back-end responsibilities like reading and writing from the todo.csv file, parsing command-line arguments, and printing the “interface” to the console.

# Each responsibility should map to a concrete unit of Ruby code. For example,

# Responsibility	Code World
# Initialize an empty TODO list	list = List.new
# Add a task to a TODO list	list.add(Task.new("walk the dog"))
# Get all the tasks on a TODO list	tasks = list.tasks
# Delete a particular task from a TODO list	???
# Complete a particular task on a TODO list	???
# Parse the command-line arguments and take the appropriate action. Parse the todo.csv file and wrap each entry in easier-to-manipulate Ruby objects. There are other responsibilities. What are they? 

# Implement the list command

# When you run

# $ ruby todo.rb list
# your application should print out a list of all the TODOs. For example:

# $ ruby todo.rb list
# 1. Bake a delicious blueberry-glazed cheesecake
# 2. Write up that memo and fax it out
# 3. Conquer the world
# You’ll have to design and build basic controller and model code to make this work. For example, how does your program know the user wants to “add” a task to their list?

# Implement the add command

# Requirements:

# A user can add (append) a task to their TODO list
# It should work like this

# $ ruby todo.rb add Walk the dog
# Appended "Walk the dog" to your TODO list...

# $
# Implement the delete command

# Requirements:

# A user can delete a specific task from their TODO list
# It should work like this

# $ ruby todo.rb list
# 1. Bake a delicious blueberry-glazed cheesecake
# 2. Write up that memo and fax it out
# 3. Conquer the world

# $ ruby todo.rb delete 3
# Deleted "Conquer the world" from your TODO list...

# $ ruby todo.rb list
# 1. Bake a delicious blueberry-glazed cheesecake
# 2. Write up that memo and fax it out

# $
# Implement completeness

# Requirements:

# A user can complete a specific task from their TODO list
# A completed TODO task will be identified as such when a user uses the list command
# Note : This will require changing the format of todo.csv and the code that parses it.

# Extra Credit: Human Readable File

# Here’s the deal: Google just LOVES your new command line todo app. And they’re ready to buy you out for millions if only you can change the CSV file to a human readable file, so that it can be printed out easily. They also want the app to be able to handle commas in the task description - something a CSV file doesn’t accommodate very easily.

# Here’s the way the file should be saved:

# 1. [ ] Bake a delicious blueberry-glazed cheesecake
# 2. [X] Write up that memo and fax it out
# 3. [ ] Conquer the world
# (the brackets indicate whether the task has been completed or not)

# What factors do you need to take into account to save this data correctly? How does this change the parsing (besides not being able to use the CSV class)?

# Update your app to accommodate this new feature!

# What classes do you need?

# Remember, there are four high-level responsibilities, each of which have multiple sub-responsibilities:
# 1. Gathering user input and taking the appropriate action (controller)
# 2. Displaying information to the user (view)
# 3. Reading and writing from the todo.txt file (model)
# 4. Manipulating the in-memory objects that model a real-life TODO list (domain-specific model)

# Note that (4) is where the essence of your application lives.
# Pretty much every application in the universe has some version of responsibilities (1), (2), and (3).
require 'csv'

#This is the version to pass rspec
class Task
	attr_accessor :title, :completed

	def initialize (title = "")
		@title = title
		@completed = false
	end
end

class List
	attr_reader :file
	attr_accessor :tasks

	def initialize(file)
		@file = file
		@tasks = nil
	end

	def tasks
		return @tasks if @tasks
		parsed = []
		CSV.foreach(file) do |row|
			# task = Task.new(row[1])
			# task.completed = true if row[0] == 'Y'
			parsed << Task.new(row)
		end
		@tasks = parsed
		return @tasks
	end

	def save
		CSV.open("todo_test.csv", "wb") do |csv|
    		@tasks.each do |task|
    			# y_or_n = 'N'
    			# y_or_n = 'Y' if task.completed == true
        		csv << [task.title]
    		end
    	end
	end

	def add(task)
		@tasks << Task.new(task)
		save
	end

	def delete(task_number)
		@tasks.delete_at(task_number-1)
		save
	end

	def complete(task_number)
		@tasks[task_number-1].completed = true
	end
end

# Testcase
# list = List.new('todo.csv')
# puts "There are #{list.tasks.size} tasks in the file '#{list.file}'."

# task = 'Complete todo.rb'
# list.add(task)
# list.delete(1)
# puts "There are #{list.tasks.size} tasks in the file '#{list.file}'."

