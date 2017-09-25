# View all statuses of a user
get '/users/:id/statuses' do
	@user = User.find(params[:id])
	@statuses = Status.where(user_id: params[:id])
	erb :"statuses/index"
end

#Link to create new status
get '/users/:id/statuses/new' do
	if current_user == User.find(params[:id])
		erb :"statuses/new"
	else
		redirect '/'
	end
end

# View a particular status
get '/users/:id/statuses/:statusid' do
	@user = User.find(params[:id])
	@status = Status.find_by(user_id: @user.id, id: params[:statusid])
	if @user and @status
		@like = Like.find_by(status_id: @status.id, user_id: current_user.id)
		@likes_count = Like.where(status_id: @status.id, liked: true).count
		erb :"statuses/show"
	else
		redirect '/'
	end
end

#Post a status
post '/users/:id/statuses' do
	if current_user == User.find(params[:id])
		@status = Status.new(user_id: params[:id], description: params[:status_description])
		if @status.save
			@status_message = "Successfully posted the status"
		else
			@status_message = "Failed to post the status, make sure you entered at least one word"
		end
		erb :"statuses/new"
	else
		redirect '/'
	end
end

#Edit a status
get '/users/:id/statuses/:statusid/edit' do
	@user =  User.find(params[:id])
	if current_user == @user
		@status = Status.find_by(user_id: params[:id], id: params[:statusid])
		if @status
			erb :"statuses/edit"
		else
			redirect '/'
		end
	else
		redirect '/'
	end
end

#Update a status
patch '/users/:id/statuses/:statusid' do
	@user =  User.find(params[:id])
	if current_user == @user
		@status = Status.find_by(user_id: params[:id], id: params[:statusid])
		if @status
			@status.update(description: params[:status_description])
			@update_message = "Status updated"
		else
			@update_message = "Failed to update status, try again!"
		end
		erb :"statuses/edit"
	else
		redicrect '/'
	end
end

#Delete a status
delete '/users/:id/statuses/:statusid' do
	@user =  User.find(params[:id])
	if current_user == @user
		@status = Status.find_by(user_id: params[:id], id: params[:statusid])
		if @status
			@status.destroy
			@delete_message = "Status deleted"
		else
			@delete_message = "Failed to delete status, try again!"
		end
		erb :"statuses/show"
	else
		redicrect '/'
	end
end