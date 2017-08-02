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