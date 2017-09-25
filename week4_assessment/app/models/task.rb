class Task < ActiveRecord::Base

	def self.add(description, status)
		self.create(description: description, status: status)
	end

	def self.list
		linewidth = 39
		puts 'No.'.ljust(linewidth/3)+'Description'.ljust(linewidth*2/3)+'Status'.ljust(linewidth)
		puts '==='.ljust(linewidth/3)+'==========='.ljust(linewidth*2/3)+'======'.ljust(linewidth)
		i = 1
		self.all.each do |row|
			puts "#{i}.".ljust(linewidth/3)+"#{row[:description]}".ljust(linewidth*2/3)+"#{row[:status]}".ljust(linewidth)
			i += 1
		end
	end

	def self.update(id, description, status)
		if self.find_by_id(id).nil?
			puts "Task number #{id} is not found. Are you sure that this is the right task number?"
		else
			self.find(id).update(description: description, status: status)
		end
	end

	def self.remove(id)
		if self.find_by_id(id).nil?
			puts "Task number #{id} is not found. Are you sure that this is the right task number?"
		else
			self.find(id).destroy
		end
	end

end