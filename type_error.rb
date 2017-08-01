def print_and_sort(array)
  output_string = ""
  array.each do |element|
    output_string = output_string + " " + element
  end
  puts output_string
  array.sort
end

def run
  words = %w{ all i can say is that my life is pretty plain }
  words_with_nil = words.dup.insert(3, nil)
  mixed_array = ["2", 1, "5", 4, "3"]
  print_and_sort(words)
  print_and_sort(words_with_nil)
  print_and_sort(mixed_array)
end

run
#comment out the above code with your new solution

