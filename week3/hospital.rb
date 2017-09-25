# Hospital Interface
# You’ll be building an interface for a hospital. The main components are: the actual hospital, employees (janitors, receptionists, and doctors), and patients.

# The goal of this challenge is to explore the utility of object-oriented design. You will be building multiple classes and will have to define their interfaces.

# This is a fairly open-ended challenge. The expectations are loose, so you will be making most of the decisions about how to design and build your program. Talk it out with your pair. Go to the whiteboard. Argue about names. Have fun!

# As you are coding, ask yourself…
# How will I use this class?
# How will this class interact with the other classes?
# Does this attribute need to be private or public?
# Are my methods and variables well named?
# Objectives
# Create the Hospital

# Write the code that will create a new hospital object.

# What types of attributes or accessors will be needed?

# For example, you’ll definitely need a name for the hospital. You can also add its location, number of employees, and number of patients.

# Create the Patients

# Your patients will be stored in the hospital database. (Don’t worry about creating a database - just have a way for the hospital to store the patient’s records).

# Can you think of anything they might inherit from the hospital, or is inheritance not needed here? These design decisions are up to you.

# Create the Employees

# There are multiple types of employees, and you’re free to create your own.

# A few obvious examples are doctors, receptionists, and janitors. What attributes and methods might they all share? What will be different for each?

# Build Authentication System

# Now imagine you’re delivering this software and it’s going to run as a Ruby file in the terminal.

# You’re going to create a single administrator who can add employees and patients, and only this administrator is allowed to create these objects in the system.

# You also want to allow the created employees and patients to login and access their medical records. However, a janitor logging in will not be able to access sensitive patient data.

# An example of how this interface might look (this is just an idea - you are welcome to implement this feature however you think is best):

# $ ruby hospital.rb
# > Welcome to Misty River Hospital
# > -------------------------------
# > Please enter your username:
# > ruby_tuesday
# > Please enter your password:
# > ********
# > -------------------------------
# > Welcome, ruby_tuesday. Your access level is: DOCTOR
# > -------------------------------
# > What would you like to do?
# > Options:
# > - list_patients
# > - view_records <patient_id>
# > - add_record <patient_id>
# > - remove_record <patient_id> <record_id>

# Start coding here.
require "io/console"
class Hospital
	attr_reader :name, :location, :employees, :patients
	def initialize(name, location)
		@name = name
		@location = location
		@employees = {}
		@patients = {}
	end

	def add(person)
		if (person.class == Employee)
			@employees[person.id] = person
		elsif (person.class == Patient)
			@patients[person.id] = person
		else
			p 'Invalid person'
		end
	end

	def delete(person)
		if (person.class == Employee)
			@employees.delete(person.id)
		elsif (person.class == Patient)
			@patients.delete(person.id)
		else
			p 'Invalid person'
		end
	end

	def inpatient?(person)
		return !patients[person.id].nil?
	end

	def num_employees
		return @employees.length
	end

	def num_patients
		return @patients.length
	end

	def login(person)
		puts "Welcome to #{self.name}"
		puts "-------------------------------"
		logged_in = false
		if(person.class == Employee)
			while(!logged_in)
				puts "Please enter your username:"
				username = gets.chomp
				puts "Please enter your password:"
				password = STDIN.noecho(&:gets).chomp
				puts "-------------------------------"
				if(person.acc[username] == password)
					logged_in = true
				else
					puts "Sorry, wrong username or password, please try again."
				end
				puts "-------------------------------"
			end
			puts "Welcome, #{person.name}. Your access level is: #{person.role.upcase}"
			puts "-------------------------------"
			puts "What would you like to do?"
			puts "Options:"
			menu(person.role.upcase)
		else
			'Sorry you are not an employee, Bye.'
		end
	end

	def menu(access_level)
		options = {}
		options['list'] = "- list_patients" if (access_level == 'DOCTOR')
		options['view'] = '- view_records <patient_id>' if (access_level == 'DOCTOR')
		options['add'] = '- add_record <patient_id>' if (access_level == 'DOCTOR')
		options['remove'] = '- remove_record <patient_id> <record_id>' if (access_level == 'DOCTOR')
		options.each_value{|value| puts value}
	end
end #<-- class Hospital's end, DO NO DELETE

class Person
	attr_reader :name, :id
	def initialize(name, id)
		@name = name
		@id = id
	end

end #<-- class Person's end, DO NOT DELETE

class Employee < Person #roles: doctor, receptionist, and janitor
	attr_reader :role, :acc
	def initialize (name, id, role)
		super(name,id)
		@role = role
	end

	def create_acc(username, password)
		@acc = {}
		@acc[username] = password
	end
end #<-- class Employee's end, DO NO DELETE

class Patient < Person
	attr_reader :insurance_id
	def initialize (name, id, insurance_id)
		super(name,id)
		@insurance_id = insurance_id
	end
end #<-- class Patient's end, DO NO DELETE


#Testcases:
# hospital = Hospital.new('Misty River Hospital', 'KL')
# jason = Employee.new('Jason', 880808108888, 'doctor')
# jason.create_acc('jason','1234')
# hospital.login(jason)

# ahkao = Patient.new('Kao Lat', 969696109696, 'AIA996')
# hospital.add(ahkao)
# p hospital.inpatient?(ahkao)
# p hospital.num_patients
# hospital.delete(ahkao)
# p hospital.inpatient?(ahkao)
# p hospital.num_patients

