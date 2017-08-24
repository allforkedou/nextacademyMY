require_relative '../config'

# this is where you should use an ActiveRecord migration to

class CreateAssociations < ActiveRecord::Migration[5.0]
  def change
  	create_table :student_teachers do |t|
    	t.references :teacher
    	t.references :student
    end
  end
end