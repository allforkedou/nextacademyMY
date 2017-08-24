require_relative '../../db/config'
require 'date'

class Student < ActiveRecord::Base
# implement your Student model here
	has_many :student_teachers
	has_many :teachers, :through => :student_teachers

	validates_format_of :email,:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
	validates :email, uniqueness: true
	validates :age, numericality: { greater_than: 5}
	validates_format_of :phone, :with => /\D*(?:\d\D*){10,}/

	def name
		full_name = "#{self.first_name} #{self.last_name}"
		return full_name
	end

	def age
		now = Date.today
		age = now.year - self.birthday.year - 
		((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
		return age
	end

end