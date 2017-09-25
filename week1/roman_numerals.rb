# I 1
# V 5
# X 10
# L 50
# C 100
# D 500
# M 1000
def to_roman(num)
	ints = [1, 5, 10, 50, 100, 500, 1000]
	romans = ['I', 'V', 'X', 'L', 'C', 'D', 'M']
	len = ints.length
	count =0
	result =""

	for i in (ints.length-1).downto(0)
		count = num/ints[i]
		result += romans[i]*count
		num -= count*ints[i]
	end

	return result
end

#Testcases
puts to_roman(1)
puts to_roman(3)
puts to_roman(5)
puts to_roman(6)
puts to_roman(555)
puts to_roman(1101)
