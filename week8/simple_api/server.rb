require 'sinatra'

get '/this_is_the_path' do
  'Hello world!'
end

# headers
post "/this_path_checks_authorization" do
  p request.env["HTTP_PASSWORD"]
  password = request.env["HTTP_PASSWORD"]
  if password == "12345678"
    'Success'
  else
    'Failure'
  end
end

# body
post "/this_path_checks_authorization" do
  p params["password"]
  password = params["password"]
  if password == "12345678"
    'Success'
  else
    'Failure'
  end
end