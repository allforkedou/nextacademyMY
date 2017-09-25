require_relative '../../db/config'
class Teacher < ActiveRecord::Base
	has_many :student_teachers
	has_many :students, :through => :student_teachers

	validates_format_of :email,:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
	validates :email, uniqueness: true
	validates_format_of :phone, :with => /\D*(?:\d\D*){10,}/
end