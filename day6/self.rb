class Person
  def self.example_class_method
    puts "We're calling an example class method"
    puts "*self* is always defined"
    puts "What is *self* here? Let's see"
    p self
    puts "That was self!"
  end

  def example_instance_method
    puts "We're calling an example instance method"
    puts "*self* is defined here too, but it means something different"
    p self
    puts "That was self, again, but see how it is an instance of the class"
  end
end

Person.example_class_method
Person.new.example_instance_method

class Mathematics
  def self.hypot(a, b)
    Math.sqrt(a**2 + b**2)
  end
end
# #this is identical to below
# class Mathematics
#   def Mathematics.hypot(a, b)
#     sqrt(x**2 + y**2)
#   end
# end
p Mathematics.hypot(3,4)