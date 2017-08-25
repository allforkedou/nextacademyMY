require_relative '../config'

# this is where you should use an ActiveRecord migration to

class ChangeColumnsOnStudents < ActiveRecord::Migration[5.0]
	def up
		add_column :students, :name, :string

		Student.all.each do |student|
			student.update(name: "#{student.first_name} #{student.last_name}" )
		end

		remove_column :students, :first_name
		remove_column :students, :last_name
	end

	def down
		add_column :students, :first_name, :string
		add_column :students, :last_name, :string

		Student.all.each do |student|
			name_info = student.name.split(" ")
			first_name = name_info[0]
			last_name = name_info[1]
			student.update(first_name: first_name, last_name: last_name)
		end

		remove_column :students, :name
	end
end