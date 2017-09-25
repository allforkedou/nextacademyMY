require 'rest-client'

RestClient.get "localhost:4567/this_is_the_path"

# header
RestClient.post "localhost:4567/this_path_checks_authorization", "", {password: "12345678"}

# body
RestClient.post "localhost:4567/this_path_checks_authorization", {password: "12345678"}