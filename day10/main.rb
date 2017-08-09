require_relative 'cookie.rb'
require_relative 'oven.rb'
require_relative 'tray.rb'

# Manual
# tray = {add_cookie, seal_tray, cookies}
# oven = {start_oven, put_tray, close_oven, start_baking, check_timer, stop_baking}
# cookie = {status,bake_time}

my_oven = Oven.new()

tray_1,tray_2,tray_3,tray_4,tray_5 = Tray.new(), Tray.new(), Tray.new(), Tray.new(), Tray.new()
cookie_type = ['Peanut Butter','Choco Chips','Matcha Green Tea','Luxurious Delight','New Flavors']
all_trays = [tray_1,tray_2,tray_3,tray_4, tray_5]

index = 0

while index < cookie_type.length
  all_trays[index].add_cookie(Cookie.new(cookie_type[index]))
  all_trays[index].seal_tray
  index += 1
end 

my_oven.start_oven

all_trays.each do |t|
  box = 0
  box = 1 if my_oven.tray_box[box].size == "4"
  my_oven.put_tray(t,box) 
end

my_oven.close_oven

my_oven.start_baking
sleep(2)
my_oven.check_timer
sleep(1)
my_oven.stop_baking