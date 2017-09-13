get '/' do
	if logged_in?
  		erb :"users/welcome"
  	else
  		erb :"static/index"
  	end
end