def destroy_message(string)
  #TODO: return the part a string without the message
  if (string.include?(':'))
  	return string[0..string.index(':')]
  else
  	return string
  end
end

def destroy_message!(string)
  #TODO: remove the message from string destructively!
  if (string.include?(':'))
  	return string.replace(string[0..string.index(':')])
  else
  	return string
  end
end

# # Driver code...
string = "this message will self-destruct: you can't hug every cat"
original_string = string.dup
puts destroy_message(string) == "this message will self-destruct:"
puts string == original_string # we shouldn't modify the string passed to destroy_message

string = "this has no message"
original_string = string.dup
puts destroy_message(string) == string
puts string == original_string # we shouldn't modify the string passed to destroy_message

string = "this message will self-destruct: you can't hug every cat"
original_string = string.dup
destroy_message!(string)
puts string == "this message will self-destruct:"
puts string != original_string

string = "this has no message"
result = destroy_message!(string)
puts result.nil?
puts string == string

#Testcases
# string = 'Ruby: How are you?'

# p destroy_message(string)
# p string

# p destroy_message!(string)
# p string


