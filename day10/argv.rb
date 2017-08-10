puts "The command line arguments are:"
puts ARGV.inspect
puts ""

# $ ruby argv.rb these are
# The command line arguments are:
# ["these", "are"]

# $ ruby argv.rb these are the command line arguments
# The command line arguments are:
# ["these", "are", "the", "command", "line", "arguments"]

# $ ruby argv.rb "this come in as one" "this comes in as two"
# The command line arguments are:
# ["this come in as one", "this comes in as two"]