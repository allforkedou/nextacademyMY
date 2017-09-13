post '/statuses/:id/like' do
	@status = Status.find(params[:id])
	if (logged_in? and @status)
		@like = Like.find_by(status_id: @status.id, user_id: current_user.id)
		if @like
			if @like.liked == false
				@like.liked = true
			else
				@like.liked = false
			end
		else
			@like = Like.new(status_id: @status.id, user_id: current_user.id)
			if @like.save
				@like.liked = true
			end
		end
		@status.save
		@like.save
		likes_count = Like.where(status_id: @status.id, liked: true).count
		return {likes_count: likes_count}.to_json
	else
		redirect '/'
	end
end