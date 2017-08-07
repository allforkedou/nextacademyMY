# In this challenge, you will be modeling a simple system with two objects: orange trees and oranges. You’ll be applying what you have learnt about variable scope, and  attr_reader/writer/accessor methods here.

# Objectives
# Implement the OrangeTree and Orange classes

# Use attr_reader, attr_writer, and/or attr_accessor so that we can call tree.height and tree.age to get a tree’s height or age, respectively. Which of the three attr_ methods should you be using and why?

# Do the same with the Orange class so that we can call orange.diameter to get an orange’s diamater.

# Implement Aging

# As a tree ages, it grows taller. Eventually it starts bearing fruit and stops growing - not necessarily at the same time. Some years later, the tree dies and can bear fruit no more!

# Implement an OrangeTree#age! instance method that will age your tree one year. Each year the tree should get some amount taller, and then eventually stop growing. You can decide when the tree stops growing.

# Later, it should die. At this point your OrangeTree class should:

# Have an OrangeTree#height method which returns the tree’s current height
# Have an OrangeTree#age method which returns the tree’s current age
# Have an OrangeTree#age! method which ages the tree one year and grows the tree a little, if it’s able to grow
# Have an OrangeTree#dead? method which returns true if the tree has died
# Implement Orange-picking

# After some number of years - you decide the number - the orange tree starts to bear fruit. Write a method OrangeTree#any_oranges? which returns true if there are any oranges on the tree and false otherwise.

# Also write a method OrangeTree#pick_an_orange! which will return one of the oranges on the tree (an instance of the Orange class). If you try to pick an orange when there are no oranges left, your code should raise a NoOrangesError (defined in the source code).

# You’ll also have to implement the Orange class at this point, including Orange.new and Orange#diameter.

# Does the script run?

# Does the script at the top of the challenge run and output what you’d expect? (Hint: you have to be clear about your expectations before you an answer that question.)

# If not, what are the errors or unexpected behaviors? Do you understand them?
# This is how you define your own custom exception classes
class NoOrangesError < StandardError
end

class OrangeTree
  attr_reader :height, :age, :oranges

  def initialize(age = 0, height = 0) #this will automatically initialize age and height to 0
    @age = age
    @height = height
    @oranges = 0
  end

    # Ages the tree one year
  def age!
    raise OrangeTreeIsDeadError, "This tree is dead" unless self.age<100
    if(self.dead?)
      #do nothing
    else
      @age += 1 if self.age<100
      @height += 10 if self.height<50
      @oranges += 10 if self.age>=10
    end
  end

  def dead?
    return self.age >=100
  end

  # Returns +true+ if there are any oranges on the tree, +false+ otherwise
  def any_oranges?
    if(self.age>=10 and !self.dead? and self.oranges>0)
      return true
    else
      return false
    end
  end

  # Returns an Orange if there are any
  # Raises a NoOrangesError otherwise
  def pick_an_orange!
    raise NoOrangesError, "This tree has no oranges" unless self.any_oranges?
    # orange-picking logic goes here
    @oranges -= 1
    return Orange.new
  end
end

class Orange
  # Initializes a new Orange with diameter +diameter+
  attr_reader :diameter
  def initialize(diameter = rand(1..4))
    @diameter = diameter
  end
end

#######################################################################
## Driver code:

    tree = OrangeTree.new

    tree.age! until tree.any_oranges?

    puts "Tree is #{tree.age} years old and #{tree.height} feet tall"

    until tree.dead?
      basket = []

      # It places the oranges in the basket
      while tree.any_oranges?
        basket << tree.pick_an_orange!
      end

      # It's up to you to calculate the average diameter for this harvest.
      total_diameter = 0
      basket.each do |orange|
        total_diameter += orange.diameter
      end
      avg_diameter = total_diameter/basket.length

      puts "Year #{tree.age} Report"
      puts "Tree height: #{tree.height} feet"
      puts "Harvest: #{basket.size} oranges with an average diameter of #{avg_diameter} inches"
      puts ""

      # Age the tree another year
      tree.age!
    end

    puts "Alas, the tree, she is dead!"