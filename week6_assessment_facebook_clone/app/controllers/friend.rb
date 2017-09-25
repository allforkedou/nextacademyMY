post '/users/:id/addfriend' do
	@user = User.find(params[:id])
	if current_user.is_friend?(@user)
	# if(current_user.friends.include?(@user))
		@addfriend_message = "He/She is already your friend"
	elsif current_user == @user
		@addfriend_message = "Forever alone"
	else
		current_user.friends << @user
		@user.friends << current_user
		@addfriend_message = "You have successfully added "+@user.name+" as friend"
	end
	erb :"users/show"
end

get '/users/:id/friends' do
	@user = User.find(params[:id])
	@friends = @user.friends
	erb :"friends/index"
end