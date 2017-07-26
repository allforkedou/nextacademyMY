# Expand upon englishNumber. First, put in thousands. So it should return 'one thousand' instead of 'ten hundred' and 'ten thousand' instead of 'one hundred hundred'.
# Expand upon englishNumber some more. Now put in millions, so you get 'one million' instead of 'one thousand thousand'. Then try adding billions and trillions. How high can you go? 
#Does not work when number is 0 due to recursion
def englishNumber (number)
	if(number<0)
		return 'Positive number only, highest unit being trillion'
	elsif (number == 0)
		return ''
	elsif (number>=1000000000000)#trillion
		return englishNumber(number/1000000000000)+' trillion '+englishNumber(number%1000000000000)
	elsif (number>=1000000000)#billion
		return englishNumber(number/1000000000)+' billion '+englishNumber(number%1000000000)
	elsif (number>=1000000)#million
		return englishNumber(number/1000000)+' million '+englishNumber(number%1000000)
	elsif (number>=1000)#thousand
		return englishNumber(number/1000)+' thousand '+englishNumber(number%1000)
	elsif (number>=100)#hundred
		return englishNumber(number/100)+' hundred '+englishNumber(number%100)
	else
		unit = ['one','two','three','four','five','six','seven','eight','nine']
		teen = ['eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen']
		tenth = ['ten','twenty','thirty','forty','fifty','sixty','seventy','eighty','ninty']
		if (number/10 > 0)
			if (number%10 == 0)
				return tenth[number/10-1]
			elsif (number/10 == 1)
				return teen[number%10-1]
			else
				return tenth[number/10-1]+'-'+unit[number%10-1]
			end
		else
			return unit[number%10-1]
		end
	end
end

#testing
puts englishNumber(0)
puts englishNumber(9)
puts englishNumber(10)
puts englishNumber(11)
puts englishNumber(17)
puts englishNumber(32)
puts englishNumber(88)
puts englishNumber(99)
puts englishNumber(100)
puts englishNumber(101)
puts englishNumber(234)
puts englishNumber(3211)
puts englishNumber(999999)
puts englishNumber(1000000000000)