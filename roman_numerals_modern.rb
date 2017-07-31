def to_roman(num)
	#now has new symbols for numbers 4, 9, 40, 90, 400, 900
	ints = [1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000]
	romans = ['I', 'IV', 'V', 'IX', 'X', 'XL','L', 'XC', 'C', 'CD', 'D', 'CM', 'M']
	count = 0
	result =''
	for i in (ints.length-1).downto(0)
		count = num/ints[i]
		result += romans[i]*count
		num -= count*ints[i]
	end
	return result
end

puts to_roman(4)
puts to_roman(9)
puts to_roman(13)
puts to_roman(14)
puts to_roman(44)
puts to_roman(944)
puts to_roman(1453)
puts to_roman(1646)