#Show all the users
get '/users' do
	@users = User.all
	erb :"users/index"
end

#Create new user
post '/users' do
	@user = User.new(params[:user])
	if @user.save
		@signup_message = "Successfully created user"
	else
		@signup_message = "Failed to register user"
	end
	erb :"static/index"
end

#Show profile of a user
get '/users/:id' do
  @user = User.find(params[:id])
  if @user
  	erb :"users/show"
  else
  	redirect '/'
  end
end

#Form to edit user's profile
get '/users/:id/edit' do
	if current_user ==  User.find(params[:id])
		erb :"users/edit"
	else
		redirect '/'
	end
end

#Update user's profile
patch '/users/:id' do
	@user =  User.find(params[:id])
	if current_user == @user
		@user.update(params[:user])
		@update_message = "Profile updated"
	else
		@update_message = "Failed to update profile, try again!"
	end
	erb :"users/edit"
end