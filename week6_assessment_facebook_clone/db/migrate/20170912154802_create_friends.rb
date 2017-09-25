class CreateFriends < ActiveRecord::Migration[5.0]
   def change
      	create_table :friends, id: false do |t|
        t.integer :user_id
        t.integer :friend_user_id
      end

      add_index(:friends, [:user_id, :friend_user_id], :unique => true)
      add_index(:friends, [:friend_user_id, :user_id], :unique => true)
   end
end