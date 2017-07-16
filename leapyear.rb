# Leap Years. Write a program which will ask for a starting year and an ending year, and then puts all of the leap years between them (and including them, if they are also leap years). Leap years are years divisible by four (like 1984 and 2004). However, years divisible by 100 are not leap years (such as 1800 and 1900) unless they are divisible by 400 (like 1600 and 2000, which were in fact leap years). (Yes, it's all pretty confusing, but not as confusing as having July in the middle of the winter, which is what would eventually happen.)

puts 'Start Year:'
startyear = gets.to_i
puts 'End Year:'
endyear = gets.to_i
pointer = startyear
count = 0
if (startyear%4!=0)
	pointer = startyear+startyear%4
end
while(pointer<=endyear)
	if ((pointer%4==0 && pointer%100==0 && pointer%400==0) || 
		(pointer%4==0 && pointer%100!=0))
		puts pointer
		count += 1
	end
	pointer += 4
end
puts ('There are total ' + count.to_s + ' leap years')


