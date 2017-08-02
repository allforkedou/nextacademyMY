#Simple benchmarking with blocks

def benchmark
  # Your benchmarking code goes here.
  start_time = Time.now
  yield
  end_time = Time.now
  return end_time - start_time
end


def run
  long_string = "apple"*100000000
  running_time = benchmark { long_string.reverse }
  puts "string.reverse took #{running_time} seconds to run"
end

run

def print_result
  block_execution = yield
  puts block_execution
end

# This will print out the number 9 to the console
print_result { 3 * 3 }

# Blocks can also be written using the do...end format
print_result do
  creature = "walrus"
  "I am the #{creature}!"
end

# Blocks have access to variables outside of their definition

shopping_list = [:milk, :eggs, :cheese]
print_result do
  important_item = shopping_list.sample
  "I hope I don't forget #{important_item}!!!"
end

#index is ppap, that means in each_with_index, the second parameter is the index.
people.each.with_index do |row, ppap|
  p row, ppap
end

user = { name: "Tom", gender: "M", email: "tom@example.com" }
#This is the same as:
user = { :name => "Tom", :gender => "M", :email => "tom@example.com" }


#For hash index will be blank
user.each do |key, value, index|
  puts "Key: #{key}, Value: #{value} Index: #{(index)}"
end

ppap = %w(p p a p)
ppap.each_with_index do |one, two, three|
	puts "One: #{one}, Two: #{two}, Three: #{three}"
end

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

#removes two elements from array and returns them
args = [ "-m", "-q", "filename" ]
args.shift(2)  #=> ["-m", "-q"]
args           #=> ["filename"]

#variables start with uppercase will become constant dynamic variables.
