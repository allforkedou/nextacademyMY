def run
    # write your code here
  puts 'Please enter the current room temperature in degree Celsius'
  @room_temperature = gets.chomp.to_i
end
# Run the code
run
while @room_temperature<20
  puts 'Air Conditioner is on'
  	run
end

puts 'Air Conditioner is off'
