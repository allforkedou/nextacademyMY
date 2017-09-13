# This is just notes, not working codes


class User <ActiveRecord::Base
	def friends
		friendships = Friend.where('user_id =? OR friend_id = ?', self.id, self.id)
		friend_ids =
		friendships.pluck(:user_id) +
		friendships.pluck(:friend_id) -
		[self.id]
		User.where(user_id: friends_ids)
	end
	# SELECT * FROM users;
	# WHERE id IN(
	# 	SELECT friend_id from friends WHERE user_id = self.id) OR
	# 	id IN (select user_id from friends WHERE friend_id = self.id) )

	# ruby sql syntax
	def friends
		User.where(id: Friend.select(:friend_id).where(user_id: 2)).or(User.where(id: Friend.select(:user_id).where(user_id: 2)))
	end
end

class CreateFriends
	def change
		cretea_table :friends do |t|
		t.integer :friend_id, index: true
		t.integer :user_id, index: true
		#put index on foreign keys
		end
	end
end