require_relative 'db/config.rb'

def student_index
	puts 'No. First_Name Last_Name Email'
	i = 1
	Student.all.each do |student|
		puts "#{i}. #{student.first_name} #{student.last_name} #{student.email}"
		i += 1
	end
end

def print_login_menu
	puts 'Please enter your email to login (teacher-only).'
end

def print_menu
	puts <<-STR
      Welcome! Please pick an option
      1. List all students in the school
      2. Create a new student
      3. Find a student with id
      4. Update a student's email
      5. Delete a student
      6. Exit
	STR
end

logged_in = false
print_login_menu
while !logged_in do
	print '>> '
	input = gets.chomp
	if (Teacher.find_by(email: input)).nil?
		puts 'Sorry, no such email exists, please try again.'
	else
		logged_in = true
		puts 'Logged in'
	end
end

if logged_in
	loop do
		print_menu
		print '>> '
		input = gets.chomp
		case input
		when '1'
			puts '=== All students ==='
			student_index
		when '2'
			infos = {}
			puts "Enter student's first name"
			print '>> '
			infos[:first_name] = gets.chomp
			puts "Enter student's last name"
			print '>> '
			infos[:last_name] = gets.chomp
			puts "Enter student's gender"
			print '>> '
			infos[:gender] = gets.chomp
			puts "Enter student's birthday"
			print '>> '
			infos[:birthday] = gets.chomp
			puts "Enter student's email"
			print '>> '
			infos[:email] = gets.chomp
			puts "Enter student's phone"
			print '>> '
			infos[:phone] = gets.chomp
			student = Student.new(infos)
			if student.save
				puts 'Student created'
			else
				puts 'Create student failed'
			end
		when '3'
			puts "Enter student's id"
			print '>> '
			id = gets.chomp
			p Student.find(id)
		when '4'
			puts "Enter student's id"
			print '>> '
			id = gets.chomp
			puts "Change email to"
			print '>> '
			email = gets.chomp
			student = Student.find_by(id: id)
			student.update(email: email)
			puts 'Email updated'
		when '5'
			puts "Enter student's id"
			print '>> '
			id = gets.chomp
			student = Student.find(id)
			student.destroy
			puts 'Student deleted'
		when '6'
			puts 'Kthxbai'
			break
		else
			puts 'Invalid option! Try again!'
		end
	end
end



