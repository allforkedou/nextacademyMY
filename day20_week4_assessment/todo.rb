# Pre-configurations (Change if you want an awesome difficulty assessment)
require_relative 'config/application'

# Your Code begins from this line onwards #
case ARGV[0]
when '--add'
	Task.add(ARGV[1], ARGV[2])

when '--list'
	Task.list

when '--update'
	Task.update(ARGV[1], ARGV[2], ARGV[3])

when '--remove'
	Task.remove(ARGV[1])
end