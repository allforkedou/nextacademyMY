# Design Drill: Argument Order Dependency
# Once methods start taking more than one or two parameters, it can be difficult to remember their order.

# When a method expects its arguments to arrive in a particular order, it creates a dependency. The rest of your code now must know about this order, and that makes it brittle. What happens if you want to add or remove a parameter? Now you have to find every place where you call that method and change the argument order accordingly.

# A good design solution for this problem is to use named arguments . In Ruby, we can implement this design pattern by passing in a hash as a method argument, using the keys of the hash as names for the arguments, for example:

# def make_a_speech(**components)
#   introduction = components[:introduction]
#   inappropriate_anecdote = components[:inappropriate_anecdote]
#   long_winded_moralizing = components[:long_winded_moralizing]
#   conclusion = components[:conclusion]

#   # Now put it all together ...
# end
# Objectives
# Use named arguments

# Take a look at the House#initialize method. My, how many parameters it has!

# Refactor the method to use named arguments instead.


# IMPORTANT: Handling default values

# Some of the parameters defined earlier take default values. Check out thoughtbot’s article on keyword arguments (i.e. use Ruby 2.0 keyword arguments). Identify the relevant parts and incorporate that into your design for the default values.

# Optional: Handling boolean and nil with Ruby 1.9

# What happens when you pass a boolean or nil value as an argument? Take a look at this example: 

# class Car
#   attr_reader :headlights, :gear

#   def start_car(options = {})
#     @headlights = options[:headlights] || true
#     @gear = options[:gear] || 1
#   end
# end

# herbie = Car.new

# # When we start the car, the headlights should be on by default:
# herbie.start_car
# herbie.headlights # => true

# # But what happens when we want to start without headlights?
# herbie.start_car(headlights: false)
# herbie.headlights # => true WHAT???
# Check out Avdi Grim’s post on how this issue was resolved. But note that this is for Ruby 1.9. The best practice is still to use Ruby 2.0’s way of handling keyword arguments. This is just an example of Ruby 1.9’s way.
class House
  attr_reader :square_feet, :num_bedrooms, :num_baths, :cost, :sold

  def initialize(address: '', square_feet: 0, num_bedrooms: 3, num_baths: 2, cost: 320_000, down_payment: 0.20, sold: false, has_tenants: false)
    @address = address
    @square_feet = square_feet
    @num_bedrooms = num_bedrooms
    @num_baths = num_baths
    @cost = cost
    @down_payment = down_payment
    @sold = sold
    @has_tenants = has_tenants
  end

  def obscure_address
    @address.sub(/\A\d*/, '****')
  end

  def buy!(money, good_credit)
    @sold = true if money >= down_payment && good_credit
  end

  def down_payment
    cost * @down_payment
  end

  def to_s
    "#{obscure_address} : #{square_feet} sq. ft., #{num_bedrooms} bed, #{num_baths} bath. $#{cost}"
  end
end

