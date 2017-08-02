users = [
	{ name: "Tom", gender: "M", email: "tom@example.com" },
	# write your code here
  	{ name: "Rachel", gender: "F", email: "rachel@example.com"},
	{ name: "Brenda", gender: "F", email: "brenda@example.com"}
]

users.each do |user|
	p user[:name], user[:gender], user[:email]
 end
# (Extra credit: display the details of each user in one line.
# For example: "Tom", "M", "tom@example.com" will be in the first line, and the details of the second user will be in the second line, etc.)
users.each do |user|
	puts user[:name]+", "+user[:gender]+", "+user[:email]
end