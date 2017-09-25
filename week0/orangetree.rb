# Make an OrangeTree class. It should have a height method which returns its height, and a oneYearPasses method, which, when called, ages the tree one year. #Each year the tree grows taller (however much you think an orange tree should grow in a year), and after some number of years (again, your call) the tree #should die. For the first few years, it should not produce fruit, but after a while it should, and I guess that older trees produce more each year than #younger trees... whatever you think makes most sense. And, of course, you should be able to countTheOranges (which returns the number of oranges on the #tree), and pickAnOrange (which reduces the @orangeCount by one and returns a string telling you how delicious the orange was, or else it just tells you that #there are no more oranges to pick this year). Make sure that any oranges you don't pick one year fall off before the next year. 
class OrangeTree

	def initialize
		@height = 0
		@age = 0
		@orangeCount = 0
	end

	def	height
		puts 'Height: ' + @height.to_s
	end

	def oneYearPasses
		if (@age==5)
			puts 'one year passed, and the treee has died (5 years old). you have enjoyed it enough, time to let it rest in peace...'
			exit
		else
			puts 'One year has passed...'
			@age = @age + 1
			@height = @height + 10
			@orangeCount = 2*@age
		end
	end

	def countTheOranges
		puts 'Number of oranges: ' + @orangeCount.to_s
	end

	def pickAnOrange
		if (@orangeCount == 0)
			puts 'There are no oranges to pick this year'
		else
			@orangeCount = @orangeCount -1
			puts '*Ate an orange* Yummy!'
		end
	end
end
#Testing
oren = OrangeTree.new
oren.height
oren.countTheOranges
oren.pickAnOrange
oren.oneYearPasses
oren.height
oren.countTheOranges
oren.pickAnOrange
oren.countTheOranges
oren.oneYearPasses
oren.oneYearPasses
oren.oneYearPasses
oren.oneYearPasses
oren.height
oren.countTheOranges
oren.pickAnOrange
oren.countTheOranges
oren.pickAnOrange
oren.countTheOranges
oren.pickAnOrange
oren.countTheOranges
oren.oneYearPasses