class CreateStatuses < ActiveRecord::Migration[5.0]
	def change
		create_table :statuses do |t|
		t.string :description
		t.references(:user, index: true)
		t.timestamps
		end
	end
end