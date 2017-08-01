def sum_to(integer)
  i=1
  sum=0
	while i<=integer
    sum += i
    i += 1
  end
  return sum
end

puts sum_to(10)
