#Run the code. Read the error message.

#Change the assigned value of sample_avg so that it does not throw an error.

def mean(numbers)
  sum = numbers.inject(:+)

  return sum / numbers.length
end

# This will throw an error. Change this line so that it works.
def run
  #sample_avg = mean(5, 3, 6, 10)
  sample_avg = mean([5, 3, 6, 10])
end

#comment out the above code with your new solution
run

# def mean2(numbers)
def mean2(*numbers)
  sum = numbers.inject(:+)
  return sum / numbers.length
end

#Instead of changing the method invocation, change the definition.
#In other words, rewrite the method so that it can take any number of arguments.
def run2
  sample_avg = mean2(5, 3, 6, 10)
end
#comment out the above code with your new solution
run2
